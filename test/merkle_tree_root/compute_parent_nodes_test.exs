defmodule MerkleTreeRoot.ComputeParentNodesTest do
  use ExUnit.Case
  import Mox

  setup opts do
    stub_with(MerkleTreeRoot.MockCrypto, MerkleTreeRoot.Crypto.Stub)

    verify_on_exit!(opts)
  end

  describe "call/1" do
    test "returns correct result for test vector input" do
      assert MerkleTreeRoot.ComputeParentNodes.call(["ab", "c"]) |> Enum.to_list() == ["abc"]
    end
  end
end
