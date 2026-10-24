# Taller 4 · De condicionales a despacho

Nombre: Anapaula Rendon Montalvo
Número de control:23100201
Equipo:05

Copia este archivo a `talleres/23-oct/<tu número de control>/respuestas.md` en el repositorio de tu
equipo, junto con tu `despacho.ts`. Entrega: viernes 23 de octubre, 23:59.

## Paso 1 · La versión con switch

**a)** Antes de tocar nada: ¿cuántos lugares de `condicionales.ts` hay que cambiar para agregar
`perecedera`? 
Para agregar ese tipo habría que modificar cuatro lugares: la definición de `Tipo`
y cada uno de los tres `switch`.

**b)** Después de agregar `'perecedera'` solo al tipo: ¿qué dijo `tsc`, y qué imprimió la
demostración para perecedera? `tsc` no mostró errores. Sin embargo, como los `switch` todavía no
incluían el nuevo caso, la demostración imprimió `perecedera  0  null  General`.

**c)** ¿Por qué el compilador no te avisó? (una línea)
El compilador no avisó porque cada `switch` tiene una opción `default`, que se ejecuta cuando no hay
un caso específico para el tipo recibido.

## Paso 3 · La versión con tabla

**d)** Después de agregar `'perecedera'` al tipo: ¿qué dijo `tsc`? Copia el mensaje.
`tsc` indicó que falta la propiedad `perecedera` en `POLITICAS`, aunque es obligatoria según
`Record<Tipo, Politica>`: `Property 'perecedera' is missing ... but required in type
'Record<Tipo, Politica>'.`

**e)** ¿Cuántos lugares cambiaste en `despacho.ts` para agregar perecedera? 
Para agregar
`perecedera` solo fue necesario añadir su entrada en la tabla `POLITICAS`, es decir, un lugar.

## Los dos lenguajes

**f)** En su motor de Elixir, ¿qué pasa si llega un tipo de carga para el que no hay cláusula? ¿Y en
`despacho.ts`, si a la tabla le falta un tipo? ¿Cuál de los dos te avisa antes, y cuándo? (dos líneas)
Si Elixir recibe un tipo que no coincide con ninguna cláusula, se produce un `FunctionClauseError`
al ejecutar la función. En TypeScript, si falta una entrada requerida en `Record<Tipo, Politica}`,
el compilador lo señala antes de que se ejecute el programa.
