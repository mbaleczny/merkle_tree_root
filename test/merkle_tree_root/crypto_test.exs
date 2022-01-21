defmodule MerkleTreeRoot.CryptoTest do
  use ExUnit.Case

  describe "sha256/1" do
    test "returns correct result for test vector 'abc' - encoded as hex, in lower case" do
      # source https://www.di-mgt.com.au/sha_testvectors.html
      assert MerkleTreeRoot.Crypto.sha256("abc") ==
               "ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad"
    end
  end
end
