-module(read_instructions_from_command_line).

-export([start/0]).

-import(parse_command, [parse/1]).

start() ->
    io:fwrite("Enter instructions~n"),
    parseCommand(io:get_line("")).

parseCommand(Line) ->
  Command = parse(Line),
  io:fwrite("~w~n", [Command]),
  parseCommand(io:get_line("")).
