defmodule MerkleTreeRoot.ComputeRoot do
  @moduledoc """
    Computes Merkle Tree Root for list of binaries.

    Uses overloaded functions and recursion to proceed until reaches to the root.

    For empty list returns nil.
  """

  @spec call(list(binary())) :: binary()
  def call(input) do
    compute(input)
  end

  defp compute([]), do: nil
  defp compute([element]), do: element

  defp compute(input) when is_list(input) do
    input
    |> MerkleTreeRoot.ComputeParentNodes.call()
    |> Enum.to_list()
    |> compute()
  end
end
