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

should_infect_city_that_are_not_infected_test() ->
  Atlanta = #city{name = atlanta},
  ?assertEqual(#city{name = atlanta, infectionLevel = 1}, pandemie:infect(Atlanta)).

should_infect_city_that_are_infected_once_test() ->
  Atlanta = #city{name = atlanta, infectionLevel = 1},
  ?assertEqual(#city{name = atlanta, infectionLevel = 2}, pandemie:infect(Atlanta)).

should_infect_city_that_are_infected_twice_test() ->
  Atlanta = #city{name = atlanta, infectionLevel = 2},
  ?assertEqual(#city{name = atlanta, infectionLevel = 3}, pandemie:infect(Atlanta)).

should_explode_when_infect_city_already_infected_thee_times_test() ->
  Atlanta = #city{name = atlanta, infectionLevel = 3},
  ?assertEqual({propagation, Atlanta}, pandemie:infect(Atlanta)).
