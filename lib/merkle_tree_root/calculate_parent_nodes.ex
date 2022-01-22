defmodule MerkleTreeRoot.CalculateParentNodes do
  @node_children_count 2

  @spec call(Enumerable.t(binary())) :: Enumerable.t(binary())
  def call(input) do
    input
    |> Stream.chunk_every(@node_children_count)
    |> Stream.map(&hash_chunk/1)
  end

  defp hash_chunk(chunk) do
    acc = get_accumulator(chunk)

    chunk
    |> Enum.reduce(acc, fn x, acc -> acc <> x end)
    |> MerkleTreeRoot.Crypto.sha256()
  end

  defp get_accumulator(chunk) do
    cond do
      length(chunk) == 1 -> Enum.at(chunk, 0)
      true -> ""
    end
  end
end
