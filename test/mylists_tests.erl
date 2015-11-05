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
%%  io:format(mylists:reverse([1, 2, 3])),
  ?assertEqual([3, 2, 1], mylists:reverse([1, 2, 3])).
