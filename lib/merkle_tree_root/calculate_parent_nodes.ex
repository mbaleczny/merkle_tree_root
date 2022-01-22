defmodule MerkleTreeRoot.CalculateParentNodes do
  @moduledoc """
    Calculates hashed parent of two adjacent items in a Enumerable input.

    Result has form of a Stream.
  """

  @node_children_count 2

  @spec call(Enumerable.t(binary())) :: Enumerable.t(binary())
  def call(input) do
    input
    |> Stream.chunk_every(@node_children_count)
    |> Stream.map(&hash_chunk/1)
  end

  @doc """
    Concatenates adjacent elements in a Enumerable and calculates its hash.
  """
  defp hash_chunk(chunk) do
    acc = get_accumulator(chunk)

    chunk
    |> Enum.reduce(acc, fn x, acc -> acc <> x end)
    |> MerkleTreeRoot.Crypto.sha256()
  end

  @doc """
    Returns initial value of accumulator for Enum.reduce/3.

    If chunk contains only one element, then the initial value
    is this single element. So concatenated element to it gives same
    result as doubling the single element.
  """
  defp get_accumulator(chunk) do
    if length(chunk) == 1 do
      List.first(chunk)
    else
      ""
    end
  end
end
