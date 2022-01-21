defmodule MerkleTreeRoot.Crypto do
  def sha256(input) do
    result = :crypto.hash(:sha256, input)

    Base.encode16(result, case: :lower)
  end
end
