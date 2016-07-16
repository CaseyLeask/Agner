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
execute({X, ?TABLE_UPPER_BOUND, "NORTH"}, move) ->
  {X, ?TABLE_UPPER_BOUND, "NORTH"};
execute({X, Y, "NORTH"}, move) ->
  {X, Y+1, "NORTH"};
execute({?TABLE_UPPER_BOUND, Y, "EAST"}, move) ->
  {?TABLE_UPPER_BOUND, Y, "EAST"};
execute({X, Y, "EAST"}, move) ->
  {X+1, Y, "EAST"};
execute({X, ?TABLE_LOWER_BOUND, "SOUTH"}, move) ->
  {X, ?TABLE_LOWER_BOUND, "SOUTH"};
execute({X, Y, "SOUTH"}, move) ->
  {X, Y-1, "SOUTH"};
execute({?TABLE_LOWER_BOUND, Y, "WEST"}, move) ->
  {?TABLE_LOWER_BOUND, Y, "WEST"};
execute({X, Y, "WEST"}, move) ->
  {X-1, Y, "WEST"};
execute({X, Y, "NORTH"}, left) ->
  {X, Y, "WEST"};
execute({X, Y, "EAST"}, left) ->
  {X, Y, "NORTH"};
execute({X, Y, "SOUTH"}, left) ->
  {X, Y, "EAST"};
execute({X, Y, "WEST"}, left) ->
  {X, Y, "SOUTH"};
execute({X, Y, "NORTH"}, right) ->
  {X, Y, "EAST"};
execute({X, Y, "EAST"}, right) ->
  {X, Y, "SOUTH"};
execute({X, Y, "SOUTH"}, right) ->
  {X, Y, "WEST"};
execute({X, Y, "WEST"}, right) ->
  {X, Y, "NORTH"}.

