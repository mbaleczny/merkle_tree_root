defmodule MerkleTreeRoot.CalculateRootStream do
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

  defp calculate_runs_count(elements_count) do
    if rem(elements_count, 2) == 2 do
      elements_count
    else
      elements_count + 1
    end
    |> :math.log2()
  end
end
