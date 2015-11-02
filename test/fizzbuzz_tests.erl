%%%-------------------------------------------------------------------
%%% @author raphael
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 02. nov. 2015 12:38
%%%-------------------------------------------------------------------
-module(fizzbuzz_tests).
-author("raphael").

-include_lib("eunit/include/eunit.hrl").


fizzbuzz_0_test() ->
  ?assert(0 == fizzbuzz:fizzbuzz(0)).

fizzbuzz_fizz_test() ->
  ?assert(fizz == fizzbuzz:fizzbuzz(3)).

fizzbuzz_buzz_test() ->
  ?assert(buzz == fizzbuzz:fizzbuzz(5)).

fizzbuzz_fizzbuzz_test() ->
  ?assert(fizzbuzz == fizzbuzz:fizzbuzz(15)).

fizzbuzz_num_test() ->
  ?assert(2 == fizzbuzz:fizzbuzz(2)).

fizzbuzz_empty_list_test() ->
  ?assert([] == fizzbuzz:fizzbuzzz([])).

fizzbuzz_one_item_list_test() ->
  ?assertEqual([0], fizzbuzz:fizzbuzzz([0])).

fizzbuzz_four_item_whit_fizz_list_test() ->
  ?assertEqual([0, 1, 2, fizz], fizzbuzz:fizzbuzzz([0, 1, 2, 3])).

fizzbuzz_lot_items_whit_fizz_list_test() ->
  ?assertEqual([0, 1, 2, fizz, 4, buzz, fizz, 7, 8, fizz, buzz, 11, fizz, 13, 14, fizzbuzz, 16, 17, fizz, 19, buzz],
    fizzbuzz:fizzbuzzz([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20])).
