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
  ?assertEqual({ok, #city{name = atlanta, infectionLevel = 1}}, pandemie:infect(Atlanta)).

should_explode_when_infect_city_already_infected_thee_times_test() ->
  Atlanta = #city{name = atlanta, infectionLevel = 3},
  ?assertEqual({outbreak, Atlanta}, pandemie:infect(Atlanta)).

should_find_no_neighbours_on_empty_list_test() ->
  Paris = #city{name = paris},
  ?assertEqual([], pandemie:findNeighbours([], Paris)).

should_find_neighbours_in_1_link_test() ->
  ?assertEqual([madrid], pandemie:findNeighbours([{madrid, paris}], paris)).

should_find_no_neighbours_in_1_link_test() ->
  ?assertEqual([], pandemie:findNeighbours([{lisbonne, madrid}], paris)).

should_find_neighbours_test() ->
  Actual = pandemie:findNeighbours(
    [{paris, madrid},
      {paris, bruxelles},
      {lisbonne, madrid}], paris),

  Expected = [madrid, bruxelles],

  ?assertEqual(Expected, Actual).

should_propagate_to_neighbours_test() ->
  Actual = pandemie:propagate(
    [{paris, madrid},
      {lisbonne, madrid},
      {paris, bruxelles}],
    paris),

  Expected = [#link{city1 = #city{name = paris, infectionLevel = 3},
    city2 = #city{name = madrid, infectionLevel = 3}},
    #link{city1 = #city{name = lisbonne},
      city2 = #city{name = madrid, infectionLevel = 3}},
    #link{city1 = #city{name = bruxelles, infectionLevel = 1},
      city2 = #city{name = paris, infectionLevel = 3}}],

  ?assertEqual(Expected, Actual).

should_propagate_recursively_test() ->
%%  CITIES
  Madrid = #city{name = madrid, infectionLevel = 3},
  Paris = #city{name = paris, infectionLevel = 3},
  Lisbonne = #city{name = lisbonne},
  Bruxelles = #city{name = bruxelles},
%%  WORLD
  Links = [{paris, madrid}, {lisbonne, madrid}, {bruxelles, paris}],
  Cities = [Madrid, Paris, Lisbonne, Bruxelles],

  NewCities = pandemie:propagate(Links, Cities, paris),
  ToPropagate = lists:filter(fun(Item) -> is_record(Item, propagate) end, NewCities),
  Actual = lists:map(fun(Propagation) -> pandemie:propagate(NewCities, Propagation#propagate.city) end, ToPropagate),

  Expected = [#link{city1 = #city{name = paris, infectionLevel = 3},
    city2 = #city{name = madrid, infectionLevel = 3}},
    #link{city1 = #city{name = lisbonne, infectionLevel = 1},
      city2 = #city{name = madrid, infectionLevel = 3}},
    #link{city1 = #city{name = bruxelles, infectionLevel = 1},
      city2 = #city{name = paris, infectionLevel = 3}}],

  ?assertEqual(Expected, Actual).

should_fetch_distincts_cities_in_a_world_test() ->
  %%  CITIES
  Madrid = #city{name = madrid, infectionLevel = 3},
  Paris = #city{name = paris, infectionLevel = 3},
  Lisbonne = {propagate, #city{name = lisbonne}},
  Bruxelles = #city{name = bruxelles},
%%  WORLD
  LinkParisMadrid = #link{city1 = Paris, city2 = Madrid},
  LinkLisbonneMadrid = #link{city1 = Lisbonne, city2 = Madrid},
  LinkBruxellesParis = #link{city1 = Bruxelles, city2 = Paris},

  Actual = pandemie:retrieveDistinctsCities([LinkParisMadrid, LinkLisbonneMadrid, LinkBruxellesParis]),
  ?assertEqual([
    {propagate, #city{name = lisbonne}},
    #city{name = bruxelles},
    #city{name = madrid, infectionLevel = 3},
    #city{name = paris, infectionLevel = 3}
  ], Actual)
.
