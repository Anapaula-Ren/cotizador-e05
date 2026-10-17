# Taller 3 · La mutación escondida

Nombre: Anapaula Rendón Montalvo
Número de control: 23100201
Equipo:5

Respuestas del taller, junto con `escondida.ex`.

## 1 · Antes y después de ejecutar

Llena "Predigo" **antes** de correr `npx tsx escondida.ts`. No borres las predicciones que fallaron.

| Línea | Predigo | Salió |
|---|---|---|
| 1 · | A,B false | B,A true |
| 2 · | 10 true | 10 true |
| 3 · | 2 true | 2 true |
| 4 · | null false | SCT-77 false |
| 5 · | 15 15 | 15 15 |

## 2 · Qué se muta y quién se entera

| # | Función | ¿Qué línea muta, y qué cambia? | ¿Quién más se entera del cambio? |
|---|---|---|---|
| 1 | ordenarPorPeso | Cambia el orden de los embarques en el arreglo original. | Cualquier otra parte que use lote también los ve en ese orden. |
| 2 | conDescuento | Cambia el porcentaje de descuento dentro de las reglas recibidas. | Los que usan base ven el nuevo porcentaje. |
| 3 | registrar | Agrega el id a la lista que se comparte fuera de la función. | primera también ve el id que se agrega en la siguiente llamada. |
| 4 | conPermiso | Cambia el permiso dentro del mapa documentos. | El original también muestra ese permiso porque comparte el mapa interno. |
| 5 | fechaDeEntrega | Cambia el día de la fecha que recibió. | La variable salida también queda con el día actualizado. |

## 3 · Tres preguntas cortas

**a)** En la línea 4 salió `false` en `original === conP`, y aun así el original cambió. ¿Cómo es
posible? (dos líneas)

La copia es distinta por fuera, pero conserva el mismo mapa documentos que el original.
Por eso al cambiar el permiso desde la copia también cambia lo que se ve en el original.

**b)** ¿Por qué `registrar` no es una función pura? (una línea)

Porque usa una lista compartida y lo que devuelve depende de las llamadas que ya se hicieron.

**c)** En tus pruebas de Elixir, la última aserción de cada una revisa que el original sigue igual.
¿Por qué en Elixir esa aserción no puede fallar? (dos líneas)

En Elixir no se cambia el valor original; al actualizarlo se devuelve una estructura nueva.
Por eso la lista, el mapa o la fecha que entraron a la función quedan igual.
