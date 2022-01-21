defmodule MerkleTreeRoot.Crypto.Sha256 do
  @behaviour MerkleTreeRoot.Crypto

  @impl MerkleTreeRoot.Crypto
  def sha256(input) when is_binary(input) do
    result = :crypto.hash(:sha256, input)

    Base.encode16(result, case: :lower)
  end
end
