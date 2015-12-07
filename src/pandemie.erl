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
-export([infect/1, findNeighbours/2]).
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
