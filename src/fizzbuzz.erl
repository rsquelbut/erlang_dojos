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
-export([fizzbuzz/1, fizzbuzzz/1]).

-define(is_modulo(Input, Divider), Input rem Divider == 0).
-define(is_modulo3(Input), ?is_modulo(Input, 3)).
-define(is_modulo5(Input), ?is_modulo(Input, 5)).
-define(is_modulo15(Input), ?is_modulo(Input, 15)).

fizzbuzz(0) ->
  0;
fizzbuzz(X) when ?is_modulo15(X) ->
  fizzbuzz;
fizzbuzz(X) when ?is_modulo3(X) ->
  fizz;
fizzbuzz(X) when ?is_modulo5(X) ->
  buzz;
fizzbuzz(X) ->
  X.


fizzbuzzz([]) ->
  [];
fizzbuzzz([Head | Rest]) ->
  [fizzbuzz(Head) | fizzbuzzz(Rest)].




