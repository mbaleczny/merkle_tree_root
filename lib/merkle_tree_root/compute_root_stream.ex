defmodule MerkleTreeRoot.ComputeRootStream do
  @moduledoc """
    Computes Merkle Tree Root using approach with Streams.

    Uses overloaded functions and recursion to proceed until reaches to the root.
  """

  @spec call(Enumerable.t(binary)) :: binary
  def call(stream) do
    elements_count = Enum.count(stream)
    number_of_rounds = compute_runs_count(elements_count)

    compute(stream, 0, number_of_rounds)
  end

  defp compute(stream, current_run, number_of_rounds) when current_run == number_of_rounds do
    stream |> Enum.to_list() |> List.first()
  end

  defp compute(stream, current_run, number_of_rounds) do
    stream
    |> MerkleTreeRoot.ComputeParentNodes.call()
    |> compute(current_run + 1, number_of_rounds)
  end

  @doc """
    By knowing how many elements there is in the input Stream, we can determine number of levels of a tree
    by calculating log2 of elements count. For odd number of elements we simple increment it by one.
  """
  defp compute_runs_count(elements_count) do
    if rem(elements_count, 2) == 0 do
      elements_count
    else
      elements_count + 1
    end
    |> :math.log2()
  end
end
