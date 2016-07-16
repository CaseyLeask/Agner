-module(robot).

-export([initialState/0, execute/2]).

-define(TABLE_LOWER_BOUND, 0).
-define(TABLE_UPPER_BOUND, 4).

onTable(N) ->
  lists:any(fun(I) -> I =:= N end, lists:seq(?TABLE_LOWER_BOUND, ?TABLE_UPPER_BOUND)).

initialState() ->
  initialState.

execute(CurrentState, {place, {X, Y, Direction}}) ->
  XIsOnTable = onTable(X),
  YIsOnTable = onTable(Y),
  if
    XIsOnTable and YIsOnTable ->
      {X, Y, Direction};
    true ->
      CurrentState
  end;
execute(initialState, _) ->
  initialState;
execute({X, Y, Direction}, report) ->
  io:fwrite("~w,~w,~s~n", [X, Y, Direction]),
  {X, Y, Direction};
execute({X, ?TABLE_UPPER_BOUND, north}, move) ->
  {X, ?TABLE_UPPER_BOUND, north};
execute({X, Y, north}, move) ->
  {X, Y+1, north};
execute({?TABLE_UPPER_BOUND, Y, east}, move) ->
  {?TABLE_UPPER_BOUND, Y, east};
execute({X, Y, east}, move) ->
  {X+1, Y, east};
execute({X, ?TABLE_LOWER_BOUND, south}, move) ->
  {X, ?TABLE_LOWER_BOUND, south};
execute({X, Y, south}, move) ->
  {X, Y-1, south};
execute({?TABLE_LOWER_BOUND, Y, west}, move) ->
  {?TABLE_LOWER_BOUND, Y, west};
execute({X, Y, west}, move) ->
  {X-1, Y, west};
execute({X, Y, north}, left) ->
  {X, Y, west};
execute({X, Y, east}, left) ->
  {X, Y, north};
execute({X, Y, south}, left) ->
  {X, Y, east};
execute({X, Y, west}, left) ->
  {X, Y, south};
execute({X, Y, north}, right) ->
  {X, Y, east};
execute({X, Y, east}, right) ->
  {X, Y, south};
execute({X, Y, south}, right) ->
  {X, Y, west};
execute({X, Y, west}, right) ->
  {X, Y, north}.

