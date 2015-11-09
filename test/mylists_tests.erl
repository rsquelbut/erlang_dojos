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

list_sorted_desc_test() ->
  ?assertEqual([[a, a], [0, 0], {a, a}, {0, 0}, a, 0],
    mylists:sort_desc([a, 0, {a, a}, [0, 0], {0, 0}, [a, a]])).

%%item_sorted_desc_test() ->
%%  ?assertEqual([[a, a], [0, 0], {a, a}, {0, 0}, a, 0],
%%    mylists:sort_desc(item)).

list_sorted_asc_test() ->
  ?assertEqual([0, a, {0, 0}, {a, a}, [0, 0], [a, a]],
    mylists:sort_asc([a, 0, {a, a}, [0, 0], {0, 0}, [a, a]])).