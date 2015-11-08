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
-export([reverse/1, max/1]).

reverse([]) ->
  [];
reverse([First | Rest]) ->
  reverse(Rest) ++ [First].


max([First]) ->
  First;
max([First, Second | Tail]) ->
  if
    First > Second -> max([First | Tail]);
    true -> max([Second | Tail])
  end.