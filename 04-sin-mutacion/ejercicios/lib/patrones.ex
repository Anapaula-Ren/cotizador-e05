defmodule Patrones do
  @moduledoc """
  Miercoles 30 · Coincidencia de patrones.

  Regla del dia: ni un solo `if`, `cond` ni `case` sobre el tipo. Cada decision es una
  clausula de funcion. Puedes escribir cuantas clausulas quieras de cada funcion.

      mix test test/patrones_test.exs
  """

  def descripcion(%{tipo: :general}), do: "Carga general"
  def descripcion(%{tipo: :refrigerada}), do: "Carga refrigerada"

  def descripcion(%{tipo: :peligrosa, numero_un: numero_un}),
    do: "Carga peligrosa (#{numero_un})"

  def descripcion(%{tipo: :sobredimensionada}), do: "Carga sobredimensionada"

  def documentos_completos?(%{tipo: :general}), do: true
  def documentos_completos?(%{tipo: :refrigerada}), do: true
  def documentos_completos?(%{tipo: :peligrosa, numero_un: nil}), do: false
  def documentos_completos?(%{tipo: :peligrosa, numero_un: _numero_un}), do: true
  def documentos_completos?(%{tipo: :sobredimensionada, permiso: nil}), do: false
  def documentos_completos?(%{tipo: :sobredimensionada, permiso: _permiso}), do: true

  def clasificar_peso(kg) when is_number(kg) and kg >= 10_000, do: :pesado
  def clasificar_peso(kg) when is_number(kg) and kg >= 1_000, do: :medio
  def clasificar_peso(kg) when is_number(kg) and kg > 0, do: :ligero
  def clasificar_peso(_kg), do: :invalido

  def mensaje({:ok, total}), do: "Total: #{total}"
  def mensaje({:error, motivo}), do: "Rechazado: #{motivo}"

  def primer_id([]), do: :vacio
  def primer_id([%{id: id} | _resto]), do: id
end
