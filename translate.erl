-module(translate).
-export([loop/0,showDayByIdx/0]).

loop()->
	receive
		1 -> "Monday";
		2 -> "Tuesday";
		3 -> "Wednesday";
		4 -> "Thursday";
		5 -> "Friday";
		6 -> "Satday";
		0 -> "Sunday";
		_ -> stop
	end.
showDayByIdx()->
	Day= loop(),
	case Day of
		stop -> stop;
		_ ->io:format("~w~n",[Day]),showDayByIdx()
	end.
