-module(read_instructions_from_file).

-export([start/1]).

start(File) ->
    io:fwrite("Hello, ~s~n", [File]).

