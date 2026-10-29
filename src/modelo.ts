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
  id: string;
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

export function cotizar(_b: Borrador, _r: Reglas): Cotizado | Rechazado {
  throw new Error('por implementar');
}

export function despachar(_c: Cotizado, _folio: string): Despachado {
  throw new Error('por implementar');
}