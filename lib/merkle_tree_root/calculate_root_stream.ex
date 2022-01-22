defmodule MerkleTreeRoot.CalculateRootStream do
  @moduledoc """
    Calculates Merkle Tree Root using approach with Streams.

    Uses overloaded functions and recursion to proceed until reaches to the root.
  """

  @spec call(Enumerable.t(binary)) :: binary
  def call(stream) do
    elements_count = Enum.count(stream)
    number_of_rounds = calculate_runs_count(elements_count)

    calculate(stream, 0, number_of_rounds)
  end

  defp calculate(stream, current_run, number_of_rounds) when current_run == number_of_rounds do
    stream |> Enum.to_list() |> List.first()
  end

  defp calculate(stream, current_run, number_of_rounds) do
    stream
    |> MerkleTreeRoot.CalculateParentNodes.call()
    |> calculate(current_run + 1, number_of_rounds)
  end

  @doc """
    By knowing how many elements there is in the input Stream, we can determine number of levels of a tree
    by calculating log2 of elements count. For odd number of elements we simple increment it by one.
  """
  defp calculate_runs_count(elements_count) do
    if rem(elements_count, 2) == 2 do
      elements_count
    else
      elements_count + 1
    end
    |> :math.log2()
  end
end
