defmodule MerkleTreeRoot.Crypto.Stub do
  @moduledoc """
    Defines dummy hashing function for test simplicity.
  """

  @behaviour MerkleTreeRoot.Crypto

  @impl MerkleTreeRoot.Crypto
  def sha256(input) when is_binary(input), do: input
end
