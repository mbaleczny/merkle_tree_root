defmodule MerkleTreeRoot.CalculateRoot do
  @moduledoc """
    Calculates Merkle Tree Root for list of binaries.

    Uses overloaded functions and recursion to proceed until reaches to the root.
  """

  @spec call(list(binary())) :: binary()
  def call(input) do
    calculate(input)
  end

  defp calculate([]), do: nil
  defp calculate([element]), do: element

  defp calculate(input) when is_list(input) do
    input
    |> MerkleTreeRoot.CalculateParentNodes.call()
    |> Enum.to_list()
    |> calculate()
  end
end
