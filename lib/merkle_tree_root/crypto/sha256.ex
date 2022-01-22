defmodule MerkleTreeRoot.Crypto.Sha256 do
  @moduledoc """
    Defines hashing function used to hash block content. Uses SHA-256 algorithm.

    Hash result is encoded to hex with lower case.
  """

  @algorithm :sha256
  @behaviour MerkleTreeRoot.Crypto

  @impl MerkleTreeRoot.Crypto
  def sha256(input) when is_binary(input) do
    result = :crypto.hash(@algorithm, input)

    Base.encode16(result, case: :lower)
  end
end
