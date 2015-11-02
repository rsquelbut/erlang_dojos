%%%-------------------------------------------------------------------
%%% @author raphael
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 31. oct. 2015 18:20
%%%-------------------------------------------------------------------
-module(fizzbuzz).
-author("raphael").

%% API
-export([fizzbuzz/1, print_fizzbuzz/1]).

fizzbuzz(0) ->
  0;
fizzbuzz(X) when X rem 15 =:= 0 ->
  fizzbuzz;
fizzbuzz(X) when X rem 3 == 0 ->
  fizz;
fizzbuzz(X) when X rem 5 == 0 ->
  buzz;
fizzbuzz(X) ->
  X.



print_fizzbuzz([]) ->
  [];
print_fizzbuzz([Head | Rest]) ->
  [fizzbuzz(Head) | print_fizzbuzz(Rest)].




