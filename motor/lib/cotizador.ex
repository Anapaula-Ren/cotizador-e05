defmodule Cotizador do
  @tipos [:general, :refrigerada, :peligrosa, :sobredimensionada]

  def cotizar(embarque, reglas) do
    with :ok <- validar(embarque, reglas) do
      {:ok, calcular(embarque, reglas)}
    end
  end

  defp validar(%{peso_kg: p}, _reglas) when p <= 0, do: {:error, :peso_invalido}
  defp validar(%{distancia_km: d}, _reglas) when d <= 0, do: {:error, :distancia_invalida}
  defp validar(%{tipo: t}, _reglas) when t not in @tipos, do: {:error, :tipo_desconocido}

  defp validar(%{puente: puente}, reglas)
       when not is_map_key(reglas.cuota_puente, puente),
       do: {:error, :puente_desconocido}

  defp validar(%{tipo: :peligrosa, numero_un: nil}, _reglas),
    do: {:error, :falta_numero_un}

  defp validar(%{tipo: :sobredimensionada, permiso: nil}, _reglas),
    do: {:error, :falta_permiso}

  defp validar(%{tipo: :sobredimensionada}, _reglas), do: :ok

  defp validar(%{peso_kg: p}, reglas) when p > reglas.peso_maximo_kg,
    do: {:error, :excede_peso_maximo}

  defp validar(_embarque, _reglas), do: :ok

  defp calcular(embarque, reglas) do
    flete_bruto = embarque.distancia_km * reglas.tarifa_km
    descuento = pct(flete_bruto, pct_descuento(embarque.peso_kg, reglas.descuento))
    flete = flete_bruto - descuento
    cuota_puente = Map.fetch!(reglas.cuota_puente, embarque.puente)
    recargo = 0
    ajuste_minimo = 0

    %{
      flete_bruto: flete_bruto,
      descuento: descuento,
      flete: flete,
      cuota_puente: cuota_puente,
      recargo: recargo,
      ajuste_minimo: ajuste_minimo,
      total: flete + cuota_puente + recargo + ajuste_minimo
    }
  end

  defp pct(monto, porcentaje), do: div(monto * porcentaje + 50, 100)

  defp pct_descuento(peso, %{criterio: :a_partir_de, umbral_kg: umbral, pct: porcentaje})
       when peso >= umbral,
       do: porcentaje

  defp pct_descuento(peso, %{criterio: :mas_de, umbral_kg: umbral, pct: porcentaje})
       when peso > umbral,
       do: porcentaje

  defp pct_descuento(_peso, _descuento), do: 0
end
