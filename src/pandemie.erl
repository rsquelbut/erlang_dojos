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
-export([infect/1, findNeighbours/2, propagate/2, retrieveDistinctsCities/1]).
-include_lib("pandemie.hrl").

-define(will_explode(City), City#city.infectionLevel >= 3).

infect(City) when not is_record(City, city) ->
  not_a_city;
infect(City) when ?will_explode(City) ->
  {propagation, City};
infect(City) ->
  City#city{infectionLevel = City#city.infectionLevel + 1}.

findNeighbours([], _) ->
  [];
findNeighbours([Head | Rest], City) when Head#link.city1 == City ->
  [Head#link.city2 | findNeighbours(Rest, City)];
findNeighbours([Head | Rest], City) when Head#link.city2 == City ->
  [Head#link.city1 | findNeighbours(Rest, City)];
findNeighbours([_ | Rest], City) ->
  findNeighbours(Rest, City).


propagate([], _) ->
  [];
propagate(World, City) ->
  Neighbours = findNeighbours(World, City),
  infectCities(World, Neighbours).

infectCities(World, [Neighbour]) ->
  infectACityInWorld(World, Neighbour);
infectCities(World, [Head | Tail]) ->
  infectCities(infectACityInWorld(World, Head), Tail).

infectACityInWorld(World, CityToInfect) ->
  lists:map(fun(Link) -> updateOne(Link, CityToInfect) end, World).

retrieveDistinctsCities(World) ->
  lists:usort(fun(A,B) -> A =< B end,lists:foldl(fun(Link, AccIn) -> AccIn ++ [Link#link.city1] ++ [Link#link.city2] end,[],World))
.

updateOne(Link, City) when Link#link.city2 == City ->
  Link#link{city2 = infect(Link#link.city2)};
updateOne(Link, City) when Link#link.city1 == City ->
  Link#link{city1 = infect(Link#link.city1)};
updateOne(Link, _) ->
  Link.
