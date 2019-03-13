#!/bin/bash
rm -rf deps/
rm -rf _build/
rm -rf sparrow-ls-release/
rm mix.lock

asdf global erlang 19.3.6.9
asdf global elixir 1.7.0
mix deps.get
mix compile
mix elixir_ls.release -o sparrow-ls-release
asdf global erlang 21.3
asdf global elixir 1.8.1