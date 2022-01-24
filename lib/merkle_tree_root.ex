defmodule MerkleTreeRoot do
  @moduledoc """
    Defines all implement approaches of computing Merkle Tree Root.
  """

  @spec compute_root_from_file(:list | :stream | :task_async_stream, binary()) :: binary()
  def compute_root_from_file(method, file_path) when is_binary(file_path) do
    if File.exists?(file_path) do
      compute_root(method, file_path)
    else
      raise ArgumentError, message: "File #{file_path} does not exists."
    end
  end

  defp compute_root(:list, file_path) do
    file_path
    |> read_file_content()
    |> Enum.to_list()
    |> MerkleTreeRoot.ComputeRoot.call()
  end

  defp compute_root(:stream, file_path) do
    file_path
    |> read_file_content()
    |> MerkleTreeRoot.ComputeRootStream.call()
  end

  defp compute_root(:task_async_stream, file_path) do
    stream = file_path |> read_file_content()
    elements_count = Enum.count(stream)

    if elements_count > 0 do
      cores = max(1, System.schedulers_online() - 2)
      chunk_size = div(elements_count, cores)

      stream
      |> Stream.chunk_every(chunk_size)
      |> Task.async_stream(&MerkleTreeRoot.ComputeRootStream.call/1)
      |> Stream.map(fn {:ok, result} -> result end)
      |> MerkleTreeRoot.ComputeRootStream.call()
    else
      nil
    end
  end

  defp read_file_content(file_path) do
    file_path
    |> File.stream!()
    |> Stream.map(&String.replace(&1, "\n", ""))
  end
end
