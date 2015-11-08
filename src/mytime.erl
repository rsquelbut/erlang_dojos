%%%-------------------------------------------------------------------
%%% @author raphael
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 08. nov. 2015 23:58
%%%-------------------------------------------------------------------
-module(mytime).
-author("raphael").

%% API
-export([swedish_date/0]).


swedish_date() ->
  {Year, Month, Day} = date(),
  Yy = string:right(integer_to_list(Year),2,$0),
  Mm = string:right(integer_to_list(Month),2,$0),
  Dd = string:right(integer_to_list(Day),2,$0),
  MmDd = string:concat(Mm,Dd),
  YyMmDd = string:concat(Yy,MmDd),
  YyMmDd.
