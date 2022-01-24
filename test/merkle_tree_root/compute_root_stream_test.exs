defmodule MerkleTreeRoot.ComputeRootStreamTest do
  use ExUnit.Case
  import Mox

  setup opts do
    stub_with(MerkleTreeRoot.MockCrypto, MerkleTreeRoot.Crypto.Stub)

    verify_on_exit!(opts)
  end

  describe "call/1" do
    test "returns correct merkle tree root for test vector with even number of elements" do
      stream = Stream.map(["a", "b", "c", "d"], & &1)
      assert MerkleTreeRoot.ComputeRootStream.call(stream) == "abcd"
    end

    test "returns correct merkle tree root for test vector with odd number of elements" do
      stream = Stream.map(["a", "b", "c"], & &1)
      assert MerkleTreeRoot.ComputeRootStream.call(stream) == "abcc"
    end

    test "returns nil for empty vector" do
      refute MerkleTreeRoot.ComputeRootStream.call([])
    end
  end
end
