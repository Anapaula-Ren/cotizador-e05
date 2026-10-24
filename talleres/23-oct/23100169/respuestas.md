# Taller 4 · De condicionales a despacho

Nombre: Karely Guadalupe Hernández Navarro  
Número de control: 23100169
Equipo: 5 

Copia este archivo a `talleres/23-oct/<tu número de control>/respuestas.md` en el repositorio de tu
equipo, junto con tu `despacho.ts`. Entrega: viernes 23 de octubre, 23:59.

## Paso 1 · La versión con switch

**a)** Antes de tocar nada: ¿cuántos lugares de `condicionales.ts` hay que cambiar para agregar
`perecedera`?
<br>
En cuatro lugares en total: hay que agregarlo al inicio en la definición de `Tipo`, y se debe agregar un caso (`case`) en los tres `switch` de las funciones (`recargo`, `documentoRequerido` y `etiqueta`)

**b)** Después de agregar `'perecedera'` solo al tipo: ¿qué dijo `tsc`, y qué imprimió la
demostración para perecedera?
<br>
El compilador `tsc` no mostró ningún error. Al ejecutarlo, la demostración imprimió los valores por defecto: `perecedera  0  null  General`.

**c)** ¿Por qué el compilador no te avisó? (una línea)
<br>
Porque los tres `switch` tienen un caso `default`, entonces el tipo nuevo cae ahí silenciosamente y TypeScript no exige crear un caso específico para él.
## Paso 3 · La versión con tabla

**d)** Después de agregar `'perecedera'` al tipo: ¿qué dijo `tsc`? Copia el mensaje.
<br>
El compilador marcó un error porque faltaba agregar la entrada requerida a la tabla:
`Property 'perecedera' is missing in type '{ general: { pct: number; fija: number; documento: null; etiqueta: string; }; refrigerada: { pct: number; fija: number; documento: null; etiqueta: string; }; peligrosa: { pct: number; fija: number; documento: "numeroUn"; etiqueta: string; }; sobredimensionada: { ...; }; }' but required in type 'Record<Tipo, Politica>'.`

**e)** ¿Cuántos lugares cambiaste en `despacho.ts` para agregar perecedera?
<br>
Cambié solo dos lugares: agregué `'perecedera'` al tipo `Tipo` y añadí su bloque de información en la tabla `POLITICAS`. No tuve que modificar la lógica de ninguna de las tres funciones.

## Los dos lenguajes

**f)** En su motor de Elixir, ¿qué pasa si llega un tipo de carga para el que no hay cláusula? ¿Y en
`despacho.ts`, si a la tabla le falta un tipo? ¿Cuál de los dos te avisa antes, y cuándo? (dos líneas)
<br>
En Elixir ocurre un `FunctionClauseError` durante la ejecución si no hay cláusula. En TypeScript, al faltar un tipo en `Record`, marca un error de compilación. TypeScript avisa antes (al compilar), mientras que Elixir avisa hasta que se intenta usar ese tipo ejecutando el programa.