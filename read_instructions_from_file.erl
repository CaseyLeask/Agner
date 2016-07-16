-module(read_instructions_from_file).

-export([start/1]).

-import(parse_command, [parse/1]).
-import(robot, [initialState/0, execute/2]).

start(File) ->
  {ok, OpenedFile} = file:open(File, [read]),
  read_lines(OpenedFile, initialState(), file:read_line(OpenedFile)).

read_lines(OpenedFile, CurrentState, {ok, Line}) ->
  Command = parse(Line),
  NewState = execute(CurrentState, Command),
  read_lines(OpenedFile, NewState, file:read_line(OpenedFile));
read_lines(OpenedFile, _CurrentState, eof) ->
  file:close(OpenedFile).
