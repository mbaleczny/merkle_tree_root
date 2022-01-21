defmodule MerkleTreeRoot.CalculateParentNodes do
  @node_children_count 2

  def call(input) when is_list(input) do
    input
    |> Enum.chunk_every(@node_children_count)
    |> Enum.map(&hash_chunk/1)
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
