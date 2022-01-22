defmodule MerkleTreeRoot do
  @spec calculate_root_from_file(:list | :stream | :task_async_stream, binary()) :: binary()
  def calculate_root_from_file(method, file_path) when is_binary(file_path) do
    if File.exists?(file_path) do
      calculate_root(method, file_path)
    else
      raise ArgumentError, message: "File #{file_path} does not exists."
    end
  end

  defp calculate_root(:list, file_path) do
    file_path
    |> read_file_content()
    |> Enum.to_list()
    |> MerkleTreeRoot.CalculateRoot.call()
  end

  defp calculate_root(:stream, file_path) do
    file_path
    |> read_file_content()
    |> MerkleTreeRoot.CalculateRootStream.call()
  end

  defp calculate_root(:task_async_stream, file_path) do
    stream = file_path |> read_file_content()

    elements_count = Enum.count(stream)
    cores = max(1, System.schedulers_online() - 2)
    chunk_size = div(elements_count, cores)

    stream
    |> Stream.chunk_every(chunk_size)
    |> Task.async_stream(&MerkleTreeRoot.CalculateRootStream.call/1)
    |> Stream.map(fn {:ok, result} -> result end)
    |> MerkleTreeRoot.CalculateRootStream.call()
  end

  defp read_file_content(file_path) do
    file_path
    |> File.stream!()
    |> Stream.map(&String.replace(&1, "\n", ""))
  end
end
