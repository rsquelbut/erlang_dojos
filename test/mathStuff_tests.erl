%%%-------------------------------------------------------------------
%%% @author raphael
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 08. nov. 2015 23:21
%%%-------------------------------------------------------------------
-module(mathStuff_tests).
-author("raphael").

-include_lib("eunit/include/eunit.hrl").

square_perimeter_test() ->
  ?assertEqual(4, mathStuff:perimeter({square, 1})).

circle_perimeter_test() ->
  ?assertEqual(6.28, mathStuff:perimeter({circle, 1})).

triangle_perimeter_test() ->
  ?assertEqual(3, mathStuff:perimeter({triangle, 1, 1, 1})).

unknown_perimeter_test() ->
  ?assertError(not_implemented, mathStuff:perimeter({unknown, 1})).

