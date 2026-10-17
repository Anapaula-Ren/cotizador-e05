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

  defp calcular(_embarque, _reglas), do: %{}
end
