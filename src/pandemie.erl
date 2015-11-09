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


infect(City) when City#city.infectionLevel >= 3 ->
  {propagation, City};
infect(City) ->
  #city{name = City#city.name, infectionLevel = City#city.infectionLevel + 1}.
