%%%-------------------------------------------------------------------
%%% @author raphael
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 09. nov. 2015 13:02
%%%-------------------------------------------------------------------
-author("raphael").

-record(city, {name, infectionLevel = 0}).
-record(propagate, {city}).
