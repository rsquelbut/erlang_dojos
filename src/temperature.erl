%%%-------------------------------------------------------------------
%%% @author raphael
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 08. nov. 2015 22:24
%%%-------------------------------------------------------------------
-module(temperature).
-author("raphael").

%% API
-export([convert/1]).


convert({celsius, Temperature}) ->
  {farenheight, c2f(Temperature)};
convert({farenheight, Temperature}) ->
  {celsius, f2c(Temperature)}.

%%5(F-32) = 9C
c2f(TemperatureEnCelsius) ->
  TemperatureEnCelsius * 9 / 5 + 32.

f2c(TemperatureEnFarenheight) ->
  (TemperatureEnFarenheight - 32) * 5 / 9.


