# Taller · quitar la mutación

Nombre: Karely Guadalupe Hernández Navarro
Número de control: 23100169
Equipo: 5

Copia este archivo a `talleres/01-oct/<tu número de control>/respuestas.md` en el repositorio de tu equipo,
junto con tu `sin_mutaci
on.ex`, y llena la tabla. Entrega: hoy antes de las 23:59.

| # | Función | ¿Qué muta la versión de TypeScript? | ¿Quién más se entera del cambio? |
|---|---|---|---|
| 1 | total_pesos | La variable total, el acumulador |El entorno local se entera la funcion totalPesos|
| 2 | marcar_urgentes | Los objetos prestados (embarques) |Todos los que lo tengan|
| 3 | aplicar_descuento | El arreglo precios[]| Todos los que lo tengan|
| 4 | contar_por_tipo | Se muta el contador local|Nadie se entera|
| 5 | sin_duplicados | Se muta el Set (vistos) y el Arreglo (resultados)| Nadie se entera|

¿Cuál de las cinco era la más peligrosa en TypeScript, y por qué? (dos líneas)
<br>
La segunda funcion, porque modifica el objeto entero que se le presto.