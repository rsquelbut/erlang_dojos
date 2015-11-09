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
-export([infect/1]).
-include_lib("pandemie.hrl").

-define(will_explode(City), City#city.infectionLevel >= 3).
-define(will_explode_tuple(InfectionLevel), InfectionLevel >= 3).

infect(City) when not is_record(City, city) ->
  not_a_city;
infect(City) when ?will_explode(City) ->
  {propagation, City};
infect(City) ->
  City#city{infectionLevel = City#city.infectionLevel + 1}.
