defmodule MerkleTreeRootTest do
  use ExUnit.Case
  import Mox

  setup opts do
    # set production implementation of crypto module
    stub_with(MerkleTreeRoot.MockCrypto, MerkleTreeRoot.Crypto.Sha256)

    verify_on_exit!(opts)
  end

  describe "calculate_root_from_file/1" do
    test "returns calculated root for data read from file" do
      file_path = "input.txt"

      assert MerkleTreeRoot.calculate_root_from_file(file_path)
    end

    test "returns ArgumentError when file does not exists" do
      file_path = "not_existing_file"

      assert_raise ArgumentError, "File #{file_path} does not exists.", fn ->
        MerkleTreeRoot.calculate_root_from_file(file_path)
      end
    end
  end
end
