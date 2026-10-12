# Taller · coincidencia de patrones

Nombre: Anapaula Rendón Montalvo
Número de control: 23100201
Equipo: 5

Copia este archivo a `talleres/06-oct/<tu número de control>/respuestas.md` en el repositorio de tu pareja,
junto con tu `patrones.ex`. Entrega: el mismo día del taller, antes de las 23:59.

## 1. ¿Por qué importa el orden de las cláusulas?

Explícalo con un ejemplo de TU `patrones.ex`: qué pasaría si cambias de lugar dos cláusulas.

Porque Elixir revisa las cláusulas de arriba hacia abajo y la primera que coincide gana. Si cambias el orden, cambia el resultado

## 2. ¿Qué pasa cuando ninguna cláusula coincide?

¿Qué error da Elixir, y por qué es mejor que regresar un valor por omisión en silencio?

Elixir lanza un FunctionClauseError. Eso es bueno porque indica que no se manejó un caso válido o inesperado. Es mejor que devolver un valor por omisión en silencio porque así se detecta el error temprano y no se oculta un dato inválido o un bug en el programa.

## 3. Escribiste `documentos_completos?` sin un solo `if`. ¿Cuántas cláusulas usaste y en qué orden?

Usé 6 cláusulas en documentos_completos?/1, en este orden:

:general -> true
:refrigerada -> true
:peligrosa con numero_un: nil -> false
:peligrosa con cualquier otro numero_un -> true
:sobredimensionada con permiso: nil -> false
:sobredimensionada con cualquier otro permiso -> trues
