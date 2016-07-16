-module(read_instructions_from_file).

-export([start/1]).

-import(parse_command, [parse/1]).

start(File) ->
  {ok, OpenedFile} = file:open(File, [read]),
  read_lines(OpenedFile, file:read_line(OpenedFile)).

read_lines(OpenedFile, {ok, Line}) ->
  Command = parse(Line),
  io:fwrite("~w~n", [Command]),
  read_lines(OpenedFile, file:read_line(OpenedFile));
read_lines(OpenedFile, eof) ->
  file:close(OpenedFile).
