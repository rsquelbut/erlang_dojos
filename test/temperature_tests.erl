%%%-------------------------------------------------------------------
%%% @author raphael
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 08. nov. 2015 22:25
%%%-------------------------------------------------------------------
-module(temperature_tests).
-author("raphael").

-include_lib("eunit/include/eunit.hrl").

c2f_test() ->
%%  ?assertEqual({farenheight, 212}, temperature:convert({celsius, 100})).
  ?assert({farenheight, 212} == temperature:convert({celsius, 100})).

f2c_test() ->
%%  ?assertEqual({celsius, 0}, temperature:convert({farenheight, 32})).
  ?assert({celsius, 0} == temperature:convert({farenheight, 32})).

