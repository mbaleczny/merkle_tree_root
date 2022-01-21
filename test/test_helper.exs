Application.ensure_all_started(:mox)

Mox.defmock(MerkleTreeRoot.MockCrypto, for: MerkleTreeRoot.Crypto)
Application.put_env(:merkle_tree_root, :crypto, MerkleTreeRoot.MockCrypto)

ExUnit.start()
