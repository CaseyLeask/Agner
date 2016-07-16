-module(read_instructions_from_command_line).

-export([start/0]).

-import(parse_command, [parse/1]).

start() ->
    io:fwrite("Hello, World~n"),
    parseCommand(io:get_line("")).

parseCommand(Command) ->
  Instruction = parse(Command),
  io:fwrite("~w~n", [Instruction]),
  parseCommand(io:get_line("")).
