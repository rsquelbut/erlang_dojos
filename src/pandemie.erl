%%%-------------------------------------------------------------------
%%% @author raphael
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 09. nov. 2015 12:36
%%%-------------------------------------------------------------------
-module(pandemie).
-author("raphael").

%% API
-export([infect/1, findNeighbours/2, propagate/3, retrieveDistinctsCities/1]).
-include_lib("pandemie.hrl").

-define(will_explode(City), City#city.infectionLevel >= 3).

infect(City) when not is_record(City, city) ->
  not_a_city;
infect(City) ->
  case City#city.infectionLevel of
    3 -> {outbreak, City};
    _ -> {ok, City#city{infectionLevel = City#city.infectionLevel + 1}}
  end
.
findNeighbours([], _) ->
  [];
findNeighbours([{City1, City2} | Rest], City) when City1 == City ->
  [City2 | findNeighbours(Rest, City)];
findNeighbours([{City1, City2} | Rest], City) when City2 == City ->
  [City1 | findNeighbours(Rest, City)];
findNeighbours([_ | Rest], City) ->
  findNeighbours(Rest, City).


propagate(Links, Cities, CityName) ->
  Neighbours = findNeighbours(Links, CityName),
  infectCities(Cities, Neighbours)
.

infectCities(Cities, []) ->
  Cities;
infectCities(Cities, [ToInfect | Tail]) ->
  {[City], NotSatisfying} = lists:partition(fun(#city{name = Name}) -> Name == ToInfect end, Cities),
  case infect(City) of
    {ok, NewCity} ->
      [NewCity | infectCities(NotSatisfying, Tail)]
%%    {outbreak, NewCity} ->
%%>>>
%%      [NewCity | infectCities(NotSatisfying, Tail)]
  end
.

retrieveDistinctsCities(World) ->
  lists:usort(
    fun(A, B) -> A =< B end,
    lists:foldl(
      fun(Link, AccIn) -> AccIn ++ [Link#link.city1] ++ [Link#link.city2] end,
      [],
      World
    )
  )
.


