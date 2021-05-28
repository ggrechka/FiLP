% преобразование строки в  список ASCII кодов символов
read_string(10,L,L,N,N):-!.	% 10 - enter
read_string(X,L,CurL,N,CurN):-	NewN is CurN+1,append(CurL,[X],NewL),
				get0(Y),read_string(Y,L,NewL,N,NewN).
read_string(L,N):-	nl,write("input string: "),
			get0(X),read_string(X,L,[],N,0).

% вывод строки через список ASCII кодов символов
write_string([]):-!.
write_string([H|T]):-	put(H),
			write_string(T).

% вывод строки через список списков ASCII кодов символов
write_strings([]):-!.
write_strings([H|T]):-	write_string(H),nl,
			write_strings(T).

% задание 1
task1:-	read_string(L,N),nl,

		write_string(L),write(", "),
		write_string(L),write(", "),
		write_string(L),nl,nl,

		write("Length: "),writeln(N),nl.

% задание 2
task2:-	read_string(L,_),
		count_words(L,Count),
		write("Words: "),
		writeln(Count),nl.

% количество слов в строке
count_words([],Count,Count):-!.
count_words(L,Count,CurCount):-	skip_spaces(L,CurL),
				get_word(CurL,NewL,Word),
				Word \= [],
				NewCount is CurCount+1,
				count_words(NewL,Count,NewCount),!.
count_words(_,Count,Count).
count_words(L,Count):-count_words(L,Count,0).

% убирает пробелы в начале строки
skip_spaces([32|T],NewL):-skip_spaces(T,NewL),!.
skip_spaces(L,L).

% вычленяет слово в начале строки
get_word([],[],[]):-!.
get_word(L,NewL,Word):-get_word(L,NewL,Word,[]).

get_word([],[],Word,Word).
get_word([32|T],T,Word,Word):-!.
get_word([H|T],NewL,Word,CurWord):-	append(CurWord,[H],NewWord),
					get_word(T,NewL,Word,NewWord).



% задание 3
task3:-	read_string(L,_),

		get_words(L,Words,_),
		unique_list(Words,UniqueW),

		count_reps(UniqueW,Counts,Words),
		max_list_down(Counts,MaxC),

		list_el_numb(Counts,MaxC,Index),
		list_el_numb(UniqueW,MaxW,Index),

		nl,write("most common word: "),write_string(MaxW),nl,
		write("frequency: "),writeln(MaxC),nl.

% собирает список из слов
get_words([],Words,Words,C,C):-!.
get_words(L,Words,CurWords,C,CurC):-	skip_spaces(L,CurL),
					get_word(CurL,NewL,Word),
					Word \=[],
					NewC is CurC+1,
					append(CurWords,[Word],NewWords),
					get_words(NewL,Words,NewWords,C,NewC),!.
get_words(_,Words,Words,C,C).
get_words(L,Words,Count):-get_words(L,Words,[],Count,0).


list_el_numb([],_,_,_):-fail,!.
list_el_numb([H|_],H,CurNum,CurNum):-!.
list_el_numb([_|T],Elem,CurNum,Num):-	NewNum is CurNum+1,
					list_el_numb(T,Elem,NewNum,Num).
list_el_numb(List,Elem,Num):-list_el_numb(List,Elem,1,Num).


number_times([],0,_):-!.
number_times([H|T],X,H):-	number_times(T,CurX,H),
				X is CurX+1,!.
number_times([_|T],X,N):-	number_times(T,X,N).

max_list_down([],CurMax,CurMax):-!.
max_list_down([H|T],CurMax,Max):-	(H>CurMax -> NewMax=H;NewMax=CurMax),
					max_list_down(T,NewMax,Max).
max_list_down([H|T],Max):-max_list_down(T,H,Max).

appendList([],X,X).
appendList([H|T1],X,[H|T2]):-appendList(T1,X,T2).

list_delete_equal([],CurList,CurList,_):-!.
list_delete_equal([H|T],CurList,ResList,H):-	list_delete_equal(T,CurList,ResList,H),!.
list_delete_equal([H|T],CurList,ResList,X):-	appendList(CurList,[H],NewList),
						list_delete_equal(T,NewList,ResList,X).	
list_delete_equal(List,ResList,X):-list_delete_equal(List,[],ResList,X).

unique_list([],[]):-!.
unique_list([H|T],ResList):-	list_delete_equal(T,NewList,H),
				unique_list(NewList,CurList),
				appendList([H],CurList,ResList).

% считает количество вхождений элементов из одного списка в другой список
count_reps([],[],_):-!.
count_reps([Word|T],Counts,Words):-	count_reps(T,CurCounts,Words),
					number_times(Words,Count,Word),
					append([Count],CurCounts,Counts).