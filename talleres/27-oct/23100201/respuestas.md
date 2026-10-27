# Taller 5 · Composición o herencia

Nombre:
Número de control:
Equipo:

Copia este archivo a `talleres/27-oct/<tu número de control>/respuestas.md` en el repositorio de tu
equipo, junto con tu `composicion.ts`. Entrega: martes 27 de octubre, 23:59.

## Paso 1 · La herencia

**a)** ¿En qué dos clases está escrito el cálculo del seguro? ¿Por qué no se pudo escribir una sola
vez?

El cálculo aparece en la clase de «solo seguro» y también en la de «frío + seguro». Como cada
combinación de extras se resuelve con una clase distinta, el cálculo termina repitiéndose.

**b)** Con un tercer extra (express), ¿cuántas clases hacen falta para todas las combinaciones?
¿Cuántas son nuevas? Muestra la cuenta.

Con dos extras tenemos 4 combinaciones; al agregar express, serían 8. Eso significa crear 4 clases
más: 8 − 4 = 4.

## Paso 2 · La composición

**c)** Para agregar express a `composicion.ts`, ¿qué agregaste? ¿Cambió `cotizar`?

Agregué express como otro ajuste, que suma 50 000 al monto. No tuve que cambiar `cotizar`, porque
ya aplica los ajustes que recibe, uno tras otro.

## Paso 3 · El orden

| Llamada | Predigo | Salió |
|---|---|---|
| `cotizar(100, 1000, [express, seguro])` | 153000 | 153000 |
| `cotizar(100, 1000, [seguro, express])` | 152000 | 152000 |

**d)** ¿Por qué salen distintos? (dos líneas)

Express suma 50 000 y el seguro agrega el 2 % del monto que recibe. Por eso, si se aplica primero
express, el seguro se calcula sobre un monto mayor.

## Paso 4 · Sostén la decisión

**e)** En su modelo del proyecto, ¿cómo están escritos los pasos del cálculo: con herencia o con
composición? Cita el archivo y la función.

Están escritos con composición: `calcular` va armando el resultado con los pasos del flete,
descuento, recargos y total, apoyándose en funciones auxiliares.

**f)** Da **un** caso, en su proyecto o fuera de él, donde sí usarías herencia, y di por qué ahí no
hay explosión de combinaciones. (tres líneas)

La usaría, por ejemplo, para distintos tipos de error que compartan una clase base `Error`.
Cada tipo sería una variante de la misma idea, no una combinación de extras.
Así no se dispara la cantidad de clases.
