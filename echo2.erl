-module(echo2).
-export([go/0,loop/1]).
go()->
	Pid = spawn(echo2,loop,[1]),
	Pid ! {self(),hello},
	Pid ! {self(),hello},
	receive
		{Pid,2} -> 
			io:format("begin to receive 2~n",[]),
			io:format("~w~n",[2])
	end,
	receive
		{Pid,1} -> 
			io:format("begin to receive 1~n",[]),
			io:format("~w~n",[1])
	end,
	Pid ! stop.

loop(Counter) ->
	receive
		{From,_} ->
			io:format("receive for the ~wst time.~n",[Counter]),
			From ! {self(),Counter},
			loop(Counter+1);
		stop ->
			true
	end.
