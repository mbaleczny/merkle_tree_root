defmodule MerkleTreeRoot.CalculateRoot do
  def call(input) do
    calculate(input)
  end

  defp calculate([]), do: nil
  defp calculate([element]), do: element

  defp calculate(input) when is_list(input) do
    input
    |> MerkleTreeRoot.CalculateParentNodes.call()
    |> calculate()
  end
end
