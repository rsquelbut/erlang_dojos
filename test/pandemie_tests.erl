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

should_find_no_neighbours_on_empty_list_test() ->
  Paris = #city{name = paris},
  ?assertEqual([], pandemie:findNeighbours([], Paris)).

should_find_neighbours_in_1_link_test() ->
  Madrid = #city{name = madrid},
  Paris = #city{name = paris},
  LinkParisMadrid = #link{city1 = Paris, city2 = Madrid},
  ?assertEqual([Madrid], pandemie:findNeighbours([LinkParisMadrid], Paris)).

should_find_no_neighbours_in_1_link_test() ->
  Madrid = #city{name = madrid},
  Paris = #city{name = paris},
  Lisbonne = #city{name = lisbonne},
  LinkLisbonneMadrid = #link{city1 = Lisbonne, city2 = Madrid},
  ?assertEqual([], pandemie:findNeighbours([LinkLisbonneMadrid], Paris)).

should_find_neighbours_test() ->
  Madrid = #city{name = madrid},
  Paris = #city{name = paris},
  Lisbonne = #city{name = lisbonne},
  Bruxelles = #city{name = bruxelles},
  LinkParisMadrid = #link{city1 = Paris, city2 = Madrid},
  LinkLisbonneMadrid = #link{city1 = Lisbonne, city2 = Madrid},
  LinkParisBruxelles = #link{city1 = Bruxelles, city2 = Paris},
  ?assertEqual([Madrid, Bruxelles], pandemie:findNeighbours(
    [LinkParisMadrid,
      LinkParisBruxelles,
      LinkLisbonneMadrid], Paris)).

should_propagate_to_neighbours_test() ->
  Madrid = #city{name = madrid},
  Paris = #city{name = paris, infectionLevel = 3},
  Lisbonne = #city{name = lisbonne},
  LinkParisMadrid = #link{city1 = Paris, city2 = Madrid},
  LinkLisbonneMadrid = #link{city1 = Lisbonne, city2 = Madrid},
  ?assertEqual([#link{city1 = #city{name = paris, infectionLevel = 3}, city2 = #city{name = madrid, infectionLevel = 1}},
    #link{city1 = #city{name = lisbonne, infectionLevel = 0}, city2 = #city{name = madrid, infectionLevel = 1}}],
    pandemie:propagate([LinkParisMadrid, LinkLisbonneMadrid], Paris))
  .

