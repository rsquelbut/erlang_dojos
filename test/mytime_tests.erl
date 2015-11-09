%%%-------------------------------------------------------------------
%%% @author raphael
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 09. nov. 2015 00:11
%%%-------------------------------------------------------------------
-module(mytime_tests).
-author("raphael").

-include_lib("eunit/include/eunit.hrl").


swedish_date_test() ->
  ?assertEqual("151109", mytime:swedish_date({2015, 11, 9})).
