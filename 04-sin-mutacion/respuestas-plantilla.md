# Taller · quitar la mutación

Nombre:
Número de control:
Equipo:

Copia este archivo a `talleres/01-oct/<tu número de control>/respuestas.md` en el repositorio de tu equipo,
junto con tu `sin_mutacion.ex`, y llena la tabla. Entrega: hoy antes de las 23:59.

| # | Función | ¿Qué muta la versión de TypeScript? | ¿Quién más se entera del cambio? |
|---|---|---|---|
| 1 | total_pesos | muta el total|se entera la funcion totalPesos en el entorno local |
| 2 | marcar_urgentes |los objetos embarques |todos los que lo tengan |
| 3 | aplicar_descuento | el arreglo precios | todo aquel que lo mando|
| 4 | contar_por_tipo |el contador local | nadie se entera |
| 5 | sin_duplicados | el set "vistos" y  el arreglo "resultado" |nadie se entera |

¿Cuál de las cinco era la más peligrosa en TypeScript, y por qué? (dos líneas)
<br>
la 2 es la mas peligrosa porque modifica el objeto entero que se le prestó.
