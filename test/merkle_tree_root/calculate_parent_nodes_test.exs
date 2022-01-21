defmodule MerkleTreeRoot.CalculateParentNodesTest do
  use ExUnit.Case

  describe "call/1" do
    test "returns correct result for test vector input" do
      # same as in the MerkleTreeRoot.CryptoTest
      assert MerkleTreeRoot.CalculateParentNodes.call(["ab", "c"]) ==
               ["ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad"]
    end
  end
end
