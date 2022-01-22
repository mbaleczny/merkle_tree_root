# MerkleTreeRoot

Computing Merkle Tree Root implementation in Elixir.

Project contains three approaches:
- simple
- with use of Streams
- with use of `Task.async_stream/3`

Looking at benchmarks result below for given data set the simple one is the fastest and the most efficient of all implemented approaches.

Why did I implemented three approaches and compared them? Simply out of my curiosity.

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

My benchmarks result:

```
Operating System: macOS
CPU Information: Apple M1 Pro
Number of Available Cores: 10
Available memory: 32 GB
Elixir 1.13.1
Erlang 24.2

Benchmark suite executing with the following configuration:
warmup: 2 s
time: 10 s
memory time: 2 s
parallel: 1
inputs: none specified
Estimated total run time: 42 s

Benchmarking list...
Benchmarking stream...
Benchmarking task_async_stream...

Name                        ips        average  deviation         median         99th %
list                      19.61       50.99 ms    ±11.19%       50.73 ms       77.43 ms
stream                    19.19       52.11 ms     ±9.74%       50.20 ms       72.02 ms
task_async_stream         18.92       52.84 ms    ±10.45%       51.13 ms       81.81 ms

Comparison: 
list                      19.61
stream                    19.19 - 1.02x slower +1.12 ms
task_async_stream         18.92 - 1.04x slower +1.85 ms

Memory usage statistics:

Name                      average  deviation         median         99th %
list                     24.79 MB     ±0.00%       24.79 MB       24.79 MB
stream                   31.91 MB     ±0.00%       31.91 MB       31.91 MB
task_async_stream        32.04 MB     ±0.00%       32.04 MB       32.04 MB

Comparison: 
list                     24.79 MB
stream                   31.91 MB - 1.29x memory usage +7.13 MB
task_async_stream        32.04 MB - 1.29x memory usage +7.25 MB
```
