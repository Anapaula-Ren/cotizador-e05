
defmodule Patrones do
  @moduledoc """
  Miercoles 30 · Coincidencia de patrones.

  Regla del dia: ni un solo `if`, `cond` ni `case` sobre el tipo. Cada decision es una
  clausula de funcion. Puedes escribir cuantas clausulas quieras de cada funcion.

      mix test test/patrones_test.exs
  """

  # 1 · descripcion
  # Devuelve una descripcion dependiendo del tipo de carga.
  def descripcion(%{tipo: :general}), do: "Carga general"
  def descripcion(%{tipo: :refrigerada}), do: "Carga refrigerada"

  def descripcion(%{tipo: :peligrosa, numero_un: numero_un}),
    do: "Carga peligrosa (#{numero_un})"

  def descripcion(%{tipo: :sobredimensionada}),
    do: "Carga sobredimensionada"

  # 2 · documentos_completos?
  # Verifica si la carga tiene los documentos necesarios.
  def documentos_completos?(%{tipo: :general}), do: true

  def documentos_completos?(%{tipo: :peligrosa, numero_un: numero_un})
      when not is_nil(numero_un),
      do: true

  def documentos_completos?(%{tipo: :sobredimensionada, permiso: permiso})
      when not is_nil(permiso),
      do: true

  def documentos_completos?(_), do: false

  # 3 · clasificar_peso
  # Clasifica el peso de la carga según los kilogramos.
  def clasificar_peso(kg) when kg <= 0, do: :invalido
  def clasificar_peso(kg) when kg < 1_000, do: :ligero
  def clasificar_peso(kg) when kg < 10_000, do: :medio
  def clasificar_peso(_), do: :pesado

  # 4 · mensaje
  # Genera un mensaje según el resultado recibido.
  def mensaje({:ok, total}), do: "Total: #{total}"
  def mensaje({:error, motivo}), do: "Rechazado: #{motivo}"

  # 5 · primer_id
  # Devuelve el ID del primer elemento o :vacio si la lista está vacía.
  def primer_id([]), do: :vacio
  def primer_id([%{id: id} | _]), do: id
end
