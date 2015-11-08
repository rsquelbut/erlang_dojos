%%%-------------------------------------------------------------------
%%% @author raphael
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 08. nov. 2015 23:20
%%%-------------------------------------------------------------------
-module(mathStuff).
-author("raphael").

%% API
-export([perimeter/1]).


%%
%%
%%{triangle,A,B,C}

perimeter({square, Side}) ->
  Side * 4;
perimeter({circle, Radius}) ->
  3.14 * Radius * 2;
perimeter({triangle, A, B, C}) ->
  A + B + C;
perimeter(Unbounded) ->
  erlang:error(not_implemented, Unbounded).