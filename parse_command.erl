-module(parse_command).

-export([parse/1]).

parse("PLACE " ++ Args) ->
  place(string:tokens(Args, ","));
parse("MOVE\n") ->
  move;
parse("LEFT\n") ->
  left;
parse("RIGHT\n") ->
  right;
parse("REPORT\n") ->
  report;
parse(_) ->
  invalidCommand.

place([X, Y, Direction]) ->
  place(string:to_integer(X), string:to_integer(Y), string:strip(Direction, right, $\n));
place(_) ->
  invalidCommand.

place({X, []}, {Y, []}, "NORTH") when is_integer(X), is_integer(Y) ->
  {place, {X, Y, "NORTH"}};
place({X, []}, {Y, []}, "EAST") when is_integer(X), is_integer(Y) ->
  {place, {X, Y, "EAST"}};
place({X, []}, {Y, []}, "SOUTH") when is_integer(X), is_integer(Y) ->
  {place, {X, Y, "SOUTH"}};
place({X, []}, {Y, []}, "WEST") when is_integer(X), is_integer(Y) ->
  {place, {X, Y, "WEST"}};
place(_ , _, _) ->
  invalidCommand.
