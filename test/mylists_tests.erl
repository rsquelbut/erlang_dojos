%%%-------------------------------------------------------------------
%%% @author raphael
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 02. nov. 2015 20:59
%%%-------------------------------------------------------------------
-module(mylists_tests).
-author("raphael").

-include_lib("eunit/include/eunit.hrl").


reverse_empty_list_test() ->
  ?assertEqual([], mylists:reverse([])).

reverse_3_items_list_test() ->
  ?assertEqual([3, a, 1], mylists:reverse([1, a, 3])).

max_in_1_item_list_test() ->
  ?assertEqual(a, mylists:max([a])).

max_in_lists_test() ->
  ?assertEqual(a, mylists:max([1, a, 3])).

min_and_max_test() ->
  ?assertEqual({1, 10}, mylists:min_max([4, 1, 7, 3, 9, 10])).