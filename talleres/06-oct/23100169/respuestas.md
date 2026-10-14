# Taller · coincidencia de patrones

Nombre: Karely Guadalupe Herández Navarro
Número de control: 23100169
Equipo: 5 

Copia este archivo a `talleres/06-oct/<tu número de control>/respuestas.md` en el repositorio de tu pareja,
junto con tu `patrones.ex`. Entrega: el mismo día del taller, antes de las 23:59.
 
## 1. ¿Por qué importa el orden de las cláusulas?
 
Explícalo con un ejemplo de TU `patrones.ex`: qué pasaría si cambias de lugar dos cláusulas.
 
Elixir revisa las cláusulas de arriba hacia abajo y usa la primera que coincide. Por ejemplo, si la última cláusula de `documentos_completos?/1` estuviera primero, siempre devolvería `false`.
 
## 2. ¿Qué pasa cuando ninguna cláusula coincide?
 
¿Qué error da Elixir, y por qué es mejor que regresar un valor por omisión en silencio?
 
Si ninguna cláusula coincide, Elixir da un `FunctionClauseError`. Pero en `documentos_completos?/1` y `clasificar_peso/1` hay una última cláusula que cubre los demás casos: devuelve `false` y `:pesado`, respectivamente. En las otras funciones, si no hay una cláusula que coincida, sí aparece el error.
 
## 3. Escribiste `documentos_completos?` sin un solo `if`. ¿Cuántas cláusulas usaste y en qué orden?
Utilice 4 cláusulas en `documentos_completos?/1`, en este orden:
1. Carga `:general`: devuelve `true`.
2. Carga `:peligrosa` con `numero_un` que no sea `nil`: devuelve `true`.
3. Carga `:sobredimensionada` con `permiso` que no sea `nil`: devuelve `true`.
4. Cualquier otro caso: devuelve `falso`.