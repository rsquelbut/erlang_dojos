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
-export([reverse/1]).

reverse([]) ->
  [];
reverse([First | Rest]) ->
  reverse(Rest) ++ [First].