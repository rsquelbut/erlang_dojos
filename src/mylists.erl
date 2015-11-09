%%%-------------------------------------------------------------------
%%% @author raphael
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 02. nov. 2015 20:55
%%%-------------------------------------------------------------------
-module(mylists).
-author("raphael").

%% API
-export([reverse/1, max/1, min/1, min_max/1, sort_desc/1]).

reverse([]) ->
  [];
reverse([First | Rest]) ->
  reverse(Rest) ++ [First].


max([First]) ->
  First;
max([First, Second | Tail]) when First >= Second ->
  max([First | Tail]);
max([First, Second | Tail]) when First < Second ->
  max([Second | Tail]).

min([One]) ->
  One;
min([First, Second | Tail]) ->
  if
    First =< Second -> min([First | Tail]);
    true -> min([Second | Tail])
  end.

min_max([One]) ->
  {One, One};
min_max(List) ->
  {min(List), max(List)}.

-spec sort_desc(List) -> SortedList when
  List :: [A],
  SortedList :: [A],
  A :: term().

sort_desc([Single]) ->
  [Single];
sort_desc(List) ->
  Max = max(List),
  [Max | sort_desc(lists:delete(Max, List))].


