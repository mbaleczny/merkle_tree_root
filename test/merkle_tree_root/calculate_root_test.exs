defmodule MerkleTreeRoot.CalculateRootTest do
  use ExUnit.Case
  import Mox

  setup opts do
    stub_with(MerkleTreeRoot.MockCrypto, MerkleTreeRoot.Crypto.Stub)

    verify_on_exit!(opts)
  end

  describe "call/1" do
    test "returns correct merkle tree root for test vector with even number of elements" do
      assert MerkleTreeRoot.CalculateRoot.call(["a", "b", "c", "d"]) == "abcd"
    end

    test "returns correct merkle tree root for test vector with odd number of elements" do
      assert MerkleTreeRoot.CalculateRoot.call(["a", "b", "c"]) == "abcc"
    end

    test "returns nil for empty vector" do
      refute MerkleTreeRoot.CalculateRoot.call([])
    end
  end
end
