export type Puente = 'comercio_mundial' | 'colombia';

export type Motivo =  | 'peso_invalido'  | 'distancia_invalida'  | 'excede_peso_maximo';

export type Carga =
  | { tipo: 'general' }
  | { tipo: 'refrigerada' }
  | { tipo: 'peligrosa'; numeroUn: string }
  | { tipo: 'sobredimensionada'; permiso: string };

export type Datos = {
  id: string;
  pesoKg: number;
  distanciaKm: number;
  puente: Puente;
};

export type Embarque = Datos & Carga;

export type Borrador = {
  estado: 'borrador';
  embarque: Embarque;
};

export type Cotizacion = {
  fleteBruto: number;
  descuento: number;
  flete: number;
  cuotaPuente: number;
  recargo: number;
  ajusteMinimo: number;
  total: number;
};

export type Cotizado = {
  estado: 'cotizado';
  embarque: Embarque;
  cotizacion: Cotizacion;
};

export type Rechazado = {
  estado: 'rechazado';
  embarque: Embarque;
  motivo: Motivo;
};

export type Despachado = {
  estado: 'despachado';
  embarque: Embarque;
  cotizacion: Cotizacion;
  folio: string;
};

export type Estado = Borrador | Cotizado | Rechazado | Despachado;

export type Resultado<T, E> =
  | { ok: true; valor: T }
  | { ok: false; error: E };

export type Reglas = {
  tarifaKm: number;
  cuotaPuente: Record<Puente, number>;
  descuento: {
    umbralKg: number;
    pct: number;
    criterio: 'a_partir_de' | 'mas_de';
  };
  recargo: Record<Carga['tipo'], { pct: number; fija: number }>;
  baseRecargo: 'flete' | 'subtotal';
  minimo: number;
  pesoMaximoKg: number;
};

const POLITICAS: Record<Carga['tipo'], { aplicaPesoMaximo: boolean }> = {
  general: { aplicaPesoMaximo: true },
  refrigerada: { aplicaPesoMaximo: true },
  peligrosa: { aplicaPesoMaximo: true },
  sobredimensionada: { aplicaPesoMaximo: false },
};

function validar(e: Embarque, r: Reglas): Resultado<Embarque, Motivo> {
  if (e.pesoKg <= 0) return { ok: false, error: 'peso_invalido' };
  if (e.distanciaKm <= 0) return { ok: false, error: 'distancia_invalida' };

  if (POLITICAS[e.tipo].aplicaPesoMaximo && e.pesoKg > r.pesoMaximoKg) {
    return { ok: false, error: 'excede_peso_maximo' };
  }

  return { ok: true, valor: e };
}

function calcularDescuento(pesoKg: number, fleteBruto: number, reglas: Reglas): number {
  const aplica =
    reglas.descuento.criterio === 'a_partir_de'
      ? pesoKg >= reglas.descuento.umbralKg
      : pesoKg > reglas.descuento.umbralKg;

  return aplica ? Math.floor((fleteBruto * reglas.descuento.pct + 50) / 100) : 0;
}

function calcularFlete(e: Embarque, reglas: Reglas) {
  const fleteBruto = e.distanciaKm * reglas.tarifaKm;
  const descuento = calcularDescuento(e.pesoKg, fleteBruto, reglas);
  return {
    fleteBruto,
    descuento,
    flete: fleteBruto - descuento,
  };
}

function calcularRecargo(e: Embarque, flete: number, cuotaPuente: number, reglas: Reglas): number {
  const regla = reglas.recargo[e.tipo];
  const base = reglas.baseRecargo === 'flete' ? flete : flete + cuotaPuente;
  return Math.floor((base * regla.pct + 50) / 100) + regla.fija;
}

export function cotizar(b: Borrador, r: Reglas): Cotizado | Rechazado {
  const e = b.embarque;
  const validacion = validar(e, r);

  if (!validacion.ok) {
    return {
      estado: 'rechazado',
      embarque: e,
      motivo: validacion.error,
    };
  }

  const calculoFlete = calcularFlete(validacion.valor, r);
  const cuotaPuente = r.cuotaPuente[e.puente];
  const recargo = calcularRecargo(validacion.valor, calculoFlete.flete, cuotaPuente, r);

  const subtotal = calculoFlete.flete + cuotaPuente + recargo;
  const ajusteMinimo = Math.max(0, r.minimo - subtotal);
  const total = subtotal + ajusteMinimo;

  return {
    estado: 'cotizado',
    embarque: e,
    cotizacion: {
      ...calculoFlete,
      cuotaPuente,
      recargo,
      ajusteMinimo,
      total,
    },
  };
}

export function despachar(c: Cotizado, folio: string): Despachado {
  return {
    estado: 'despachado',
    embarque: c.embarque,
    cotizacion: c.cotizacion,
    folio,
  };
}