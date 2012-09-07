-module(echo2).
-export([go/0,loop/1]).
go()->
	Pid = spawn(echo2,loop,[1]),
	Pid ! {self(),hello},
	receive
		{Pid,Msg1} -> 
			io:format("begin to receive 1~n"),
			io:format("~w~n",[Msg1])
	end,
	Pid ! {self(),hello},
	receive
		{Pid,Msg2} -> 
			io:format("begin to receive 2~n"),
			io:format("~w~n",[Msg2])
	end,
	Pid ! stop.
loop(Counter) ->
	receive
		{From,_} ->
			From ! {self(),Counter},
			io:format("receive for the ~w time.~n",Counter),
			loop(Counter+1);
		stop ->
			true
	end.
