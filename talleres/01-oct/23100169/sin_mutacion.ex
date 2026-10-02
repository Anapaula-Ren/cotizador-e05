defmodule SinMutacion do
  @moduledoc """
  Martes 29 · Taller: quitar la mutacion.

  Cada funcion es la traduccion de una funcion imperativa de TypeScript que esta en
  `../imperativo.ts`. Alla mutan. Aqui no se puede. Reemplaza cada `raise` y corre:

      mix test test/sin_mutacion_test.exs
  """

  def total_pesos(embarques) do
    Enum.reduce(embarques, 0, fn e, acc -> acc + e.peso_kg end)
  end
  
  def marcar_urgentes(embarques) do
    # Usamos for y Map.put para agregar la llave nueva sin mutar el mapa original
    for e <- embarques do
      Map.put(e, :urgente, e.distancia_km > 500)
    end
  end

  def aplicar_descuento(precios, pct) do
    # Comprensión de lista funcional: devuelve una lista nueva
    for p <- precios do
      descuento = div(p * pct + 50, 100)
      p - descuento
    end
  end

  def contar_por_tipo(embarques) do
    Enum.frequencies_by(embarques, & &1.tipo)
  end

  def sin_duplicados(ids) do
    Enum.uniq(ids)
  end
end
