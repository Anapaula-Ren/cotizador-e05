# Taller 3 · La mutación escondida

Nombre: Karely Guadalupe Hernandez Navarro
Número de control: 23100169
Equipo: 5

Copia este archivo a `talleres/16-oct/<tu número de control>/respuestas.md` en el repositorio de tu
equipo, junto con tu `escondida.ex`. Entrega: viernes 16 de octubre, 23:59.

## 1 · Antes y después de ejecutar

Llena "Predigo" **antes** de correr `npx tsx escondida.ts`. No borres las predicciones que fallaron.

| Línea | Predigo | Salió |
|---|---|---|
| 1 · | A,B false | B,A true|
| 2 · | 5 false | 10 true |
| 3 · | 1 false | 2 true |
| 4 · | null false| CT-77 false |
| 5 · | 12, 15 | 15 15 |

## 2 · Qué se muta y quién se entera

| # | Función | ¿Qué línea muta, y qué cambia? | ¿Quién más se entera del cambio? |
|---|---|---|---|
| 1 | ordenarPorPeso |sort no hace un arreglo nuevo, solo reordena y modifica el original directamente|Cualquier otra parte del código que esté usando ese mismo arreglo. |
| 2 | conDescuento |reglas.descuentoPct = pct le mueve directo al objeto original que nos pasaron|Todos los procesos o clientes que usen esas mismas reglas se llevan el descuento sin querer |
| 3 | registrar |.push(id) le mete el dato al arreglo vistos, que es global y está declarado afuera|Las siguientes veces que llames la función, porque el arreglo va acumulando los datos de antes |
| 4 | conPermiso |Le movemos a copia.documentos.permiso y muta el original porque el spread (...) solo copia por encima |Quien tenga el objeto original, porque la parte de documentos es la misma para los dos|
| 5 | fechaDeEntrega |setDate le altera los días directo a la fecha original |La base de datos o el código que nos mandó esa fecha al principio, porque ya se la cambiamos |

## 3 · Tres preguntas cortas

**a)** En la línea 4 salió `false` en `original === conP`, y aun así el original cambió. ¿Cómo es
posible? (dos líneas)

Porque el operador de copia (...) solo abarca el primer nivel del objeto. El apartado de documentos sigue siendo el mismo para ambos y  modificarlo afecta a los dos

**b)** ¿Por qué `registrar` no es una función pura? (una línea)

Porque modifica una variable global que está afuera y da resultados diferentes aunque le pases el mismo argumento

**c)** En tus pruebas de Elixir, la última aserción de cada una revisa que el original sigue igual.
¿Por qué en Elixir esa aserción no puede fallar? (dos líneas)

Porque en Elixir todos los datos son inmutables. Las funciones siempre te regresan un valor nuevo en lugar de modificar el original