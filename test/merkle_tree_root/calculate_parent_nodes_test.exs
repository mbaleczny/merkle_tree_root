defmodule MerkleTreeRoot.CalculateParentNodesTest do
  use ExUnit.Case
  import Mox

  setup opts do
    stub_with(MerkleTreeRoot.MockCrypto, MerkleTreeRoot.Crypto.Stub)

    verify_on_exit!(opts)
  end

  describe "call/1" do
    test "returns correct result for test vector input" do
      assert MerkleTreeRoot.CalculateParentNodes.call(["ab", "c"]) == ["abc"]
    end
  end
end
