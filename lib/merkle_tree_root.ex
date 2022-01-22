defmodule MerkleTreeRoot do
  def calculate_root_from_file(file_path) when is_binary(file_path) do
    if File.exists?(file_path) do
      file_path
      |> read_file_content()
      |> MerkleTreeRoot.CalculateRoot.call()
    else
      raise ArgumentError, message: "File #{file_path} does not exists."
    end
  end

  defp read_file_content(file_path) do
    file_path
    |> File.stream!()
    |> Stream.map(&String.replace(&1, "\n", ""))
    |> Enum.to_list()
  end
end
