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
-export([reverse/1, max/1, min/1, min_max/1]).

reverse([]) ->
  [];
reverse([First | Rest]) ->
  reverse(Rest) ++ [First].


max([First]) ->
  First;
max([First, Second | Tail]) ->
  if
    First >= Second -> max([First | Tail]);
    true -> max([Second | Tail])
  end.

min([One]) ->
  One;
min([First, Second | Tail]) ->
  if
    First =< Second -> min([First | Tail]);
    true -> min([Second | Tail])
  end.

min_max([One]) ->
  {One,One};
min_max(List) ->
  {min(List),max(List)}.


%%order_decroissant([First , Second]) ->
%%  if
%%    First > Second -> [First , Second];
%%    true -> [Second , First]
%%  end.
%%order_decroissant([First , Second | Tail) ->
%%  if
%%    First > Second -> order_decroissant()[First | Second];
%%    true -> [Second | First]
%%  end.

