# Taller 5 · Composición o herencia

Nombre: Karely Guadalupe Hernández Navarro
Número de control: 23100169
Equipo: 5

Copia este archivo a `talleres/27-oct/<tu número de control>/respuestas.md` en el repositorio de tu
equipo, junto con tu `composicion.ts`. Entrega: martes 27 de octubre, 23:59.

## Paso 1 · La herencia

**a)** ¿En qué dos clases está escrito el cálculo del seguro? ¿Por qué no se pudo escribir una sola
vez?

En `ConSeguro` y `RefrigeradaConSeguro`. TypeScript solo nos deja heredar de una clase a la vez, así que como ya hereda de `Refrigerada`, el código del seguro se tiene que repetir sí o sí.

**b)** Con un tercer extra (express), ¿cuántas clases hacen falta para todas las combinaciones?
¿Cuántas son nuevas? Muestra la cuenta.

Serían 8 clases en total (2 × 2 × 2, porque cada extra puede ir o no). Son 4 nuevas: express solo, frío + express, seguro + express, y los 3 juntos.

## Paso 2 · La composición

**c)** Para agregar express a `composicion.ts`, ¿qué agregaste? ¿Cambió `cotizar`?

Solo agregué la función `express` en una línea. La función `cotizar` se quedó igual porque el `reduce` ya se encarga de aplicar los ajustes que le pases en la lista.

## Paso 3 · El orden

| Llamada | Predigo | Salió |
|---|---|---|
| `cotizar(100, 1000, [express, seguro])` | 153000 | 153000 |
| `cotizar(100, 1000, [seguro, express])` | 152000 | 152000 |

**d)** ¿Por qué salen distintos? (dos líneas)

Porque si pones express primero, el 2% del seguro también lo cobran sobre los $500 extras. Si va al revés, el seguro solo afecta al flete base.

## Paso 4 · Sostén la decisión

**e)** En su modelo del proyecto, ¿cómo están escritos los pasos del cálculo: con herencia o con
composición? Cita el archivo y la función.

Usamos composición. La función calcular va armando el resultado paso a paso: agarra el flete base y le va aplicando los descuentos y recargos hasta sacar el total, usando puras funciones auxiliares en vez de clases.

**f)** Da **un** caso, en su proyecto o fuera de él, donde sí usarías herencia, y di por qué ahí no
hay explosión de combinaciones. (tres líneas)

La usaría para excepciones personalizadas que hereden de una clase Error base. Ahí funciona bien porque un error específico es solo una variante directa, no se mezclan características distintas al mismo tiempo, así las clases no se multiplican.