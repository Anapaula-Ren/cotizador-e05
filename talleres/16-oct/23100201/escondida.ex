defmodule Escondida do
  # Ordena los embarques del más ligero al más pesado.
  def ordenar_por_peso(embarques) do
    Enum.sort_by(embarques, & &1.peso_kg)
  end

  # Regresa las reglas con otro porcentaje de descuento.
  def con_descuento(reglas, pct) do
    %{reglas | descuento_pct: pct}
  end

  # Lleva la cuenta de los embarques que ya se vieron.
  def registrar(vistos, id) do
    vistos ++ [id]
  end

  # Regresa una copia del embarque con su permiso.
  def con_permiso(embarque, permiso) do
    %{
      embarque
      | documentos: %{embarque.documentos | permiso: permiso}
    }
  end

  # Calcula la fecha de entrega: la salida más unos días.
  def fecha_de_entrega(salida, dias) do
    Date.add(salida, dias)
  end
end
