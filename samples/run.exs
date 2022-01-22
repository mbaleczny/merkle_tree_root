file_path = "input.txt"

Benchee.run(
  %{
    "list" => fn -> MerkleTreeRoot.calculate_root_from_file(:list, file_path) end,
    "stream" => fn -> MerkleTreeRoot.calculate_root_from_file(:stream, file_path) end,
    "task_async_stream" =>
      fn -> MerkleTreeRoot.calculate_root_from_file(:task_async_stream, file_path) end
  },
  time: 10,
  memory_time: 2
)