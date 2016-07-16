-module(read_instructions_from_command_line).

-export([start/0]).

-import(parse_command, [parse/1]).
-import(robot, [initialState/0, execute/2]).

start() ->
    io:fwrite("Enter instructions~n"),
    parseCommand(io:get_line(""), initialState()).

parseCommand(Line, CurrentState) ->
  Command = parse(Line),
  NewState = execute(CurrentState, Command),
  parseCommand(io:get_line(""), NewState).
