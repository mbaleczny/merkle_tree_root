defmodule MerkleTreeRoot.Crypto.Stub do
  @behaviour MerkleTreeRoot.Crypto

  @impl MerkleTreeRoot.Crypto
  def sha256(input) when is_binary(input), do: input
end
