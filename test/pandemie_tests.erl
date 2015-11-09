%%%-------------------------------------------------------------------
%%% @author raphael
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 09. nov. 2015 12:36
%%%-------------------------------------------------------------------
-module(pandemie_tests).
-author("raphael").

-include_lib("eunit/include/eunit.hrl").
-include_lib("../src/pandemie.hrl").

should_fail_when_infecting_not_a_city_test() ->
  ?assertEqual(not_a_city, pandemie:infect(ersatz)).

should_augment_infection_level_when_city_will_not_explode_test() ->
  Atlanta = #city{name = atlanta},
  ?assertEqual(#city{name = atlanta, infectionLevel = 1}, pandemie:infect(Atlanta)).

should_explode_when_infect_city_already_infected_thee_times_test() ->
  Atlanta = #city{name = atlanta, infectionLevel = 3},
  ?assertEqual({propagation, Atlanta}, pandemie:infect(Atlanta)).
