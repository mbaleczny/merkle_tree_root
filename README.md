# MerkleTreeRoot

Computing Merkle Tree Root implementation in Elixir.

## Requirements

Installed Elixir v1.13 and Erlang v24.2 or asdf (https://github.com/asdf-vm/asdf) with Elixir and Erlang plugins.

Having asdf installed run:

```bash
asdf install
```

## Run

```bash
mix deps.get
mix compile
...
iex -S mix
```

```elixir
iex> MerkleTreeRoot.compute_root_from_file(:list, "input.txt")
```

## Benchmarks

Compare approaches by running:

```bash
mix run samples/run.exs
```
