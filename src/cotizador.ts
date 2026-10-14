export const TARIFA_BASE = 12.5;
export function cargo(kg: number): number {
  const bruto = kg * TARIFA_BASE;
  return kg >= 1000 ? bruto * 0.92 : bruto;
}
