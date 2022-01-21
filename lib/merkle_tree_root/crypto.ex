defmodule MerkleTreeRoot.Crypto do
  @callback sha256(binary()) :: binary

  def sha256(input), do: impl().sha256(input)

  def impl do
    Application.get_env(:merkle_tree_root, :crypto, MerkleTreeRoot.Crypto.Sha256)
  end
end
