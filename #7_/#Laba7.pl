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


% задание 4
task4:-	read_string(L,Length),
		write("string length: "),write(Length),nl,

		(Length>5 -> Index is Length-3,

		build_list(L,CurL1,4),
		build_list_after(L,CurL2,Index),

		nl,write("first three characters: "),write_string(CurL1),
		nl,write("last three characters: "),write_string(CurL2),nl,nl;

		L \= [],
		list_el_numb(L,First,1),
		build_reps(Length,First,RepsL),

		nl,writeln("repeated first character,"),
		write("number of reps is equal to the length: "),
		write_string(RepsL),nl,nl).

% создает список, состоящий из одного элемента заданное количество раз
build_reps(0,_,L,L):-!.
build_reps(N,X,L,CurL):-	CurN is N-1,
				append(CurL,[X],NewL),
				build_reps(CurN,X,L,NewL).
build_reps(N,X,L):-build_reps(N,X,L,[]).

build_list(_,CurList,CurList,1):-!.
build_list([H|T],CurList,ResList,Num):-	appendList(CurList,[H],NewList),
					CurNum is Num-1,
					build_list(T,NewList,ResList,CurNum).
build_list(List,ResList,Num):-build_list(List,[],ResList,Num).


% собирает в новый список элементы после заданного номера (через рекурсию вниз)
build_list_after([],CurL,CurL,_):-!.
build_list_after([H|T],CurL,ResL,N):-	NewN is N-1,
					(NewN<0 -> appendList(CurL,[H],NewL);NewL=CurL),
					build_list_after(T,NewL,ResL,NewN).
build_list_after(L,ResL,N):-build_list_after(L,[],ResL,N).


% задание 5
task5:-	read_string(L,Length),

		list_el_numb(L,X,Length),
		list_matches(L,Matches,X),

		write("matches: "),
		writeln(Matches),nl.

% собирает список индексов элементов, совпадающих с заданным
list_matches([],[],0,_):-!.
list_matches([H|T],Matches,Index,H):-	list_matches(T,CurMatches,CurIndex,H),
					Index is CurIndex+1,
					append(CurMatches,[Index],Matches),!.
list_matches([_|T],Matches,Index,X):-	list_matches(T,Matches,CurIndex,X),
					Index is CurIndex+1.
list_matches(List,Matches,X):-	reverse(List,InvList),
				list_matches(InvList,Matches,_,X).



% задание 6
task6:-	read_string(L,_),
		string_seq(L,ResL,3),
		
		write("sequence: "),
		write_string(ResL),nl,nl.

% собирает в список элементы, чьи индексы делятся на заданное число
string_seq([],[],_,0):-!.
string_seq([H|T],ResL,X,I):-	string_seq(T,CurResL,X,CurI),
				I is CurI+1,(0 is I mod X ->
				append(CurResL,[H],ResL);ResL=CurResL).
string_seq(List,ResL,X):-	reverse(List,InvList),
				string_seq(InvList,ResL,X,_).


% задание 7
task7:-	read_string(L,_),

		number_times(L,CountP,43),	% 43 - '+'
		number_times(L,CountM,45),	% 45 - '-'
		CountPM is CountP+CountM,

		string_next(L,48,CountN),	% 48 - '0'

		nl,write("total quantity of '+' and '-': "),
		writeln(CountPM),

		write("number of characters followed by '0': "),
		writeln(CountN),nl.

% считает количество элементов, после которых следует заданный
string_next([],_,0):-!.
string_next([_|[]],_,0):-!.
string_next([_,H2|T],H2,Count):-	string_next([H2|T],H2,CurCount),
					Count is CurCount+1,!.
string_next([_|T],X,Count):-	string_next(T,X,Count).

% задание 8
task8:-	read_string(L,_),

		X=119,W=120,

		(list_el_numb(L,X,I1),
		list_el_numb(L,W,I2) ->

		(I1<I2 -> S=X;S=W),
		write("success: "),put(S),nl;
		
		writeln("not found!"),nl).


% задание 9
task9:-	read_string(L1,Length1),
		write("length: "),writeln(Length1),

		read_string(L2,Length2),
		write("length: "),writeln(Length2),

		(Length1>Length2 ->
		Reps is Length1-Length2,L=L1;
		Reps is Length2-Length1,L=L2),

		nl,write("quantity of reps: "),writeln(Reps),
		nl,write_reps(L,Reps),nl.

% выводит строку заданное количество раз
write_reps(_,0):-!.
write_reps(L,X):-	CurX is X-1,
			write_string(L),nl,
			write_reps(L,CurX).

% задание 10
task10:-	read_string(L,_),

		(check_string(L,[97,98,99],[1,2,3]) ->
		
		build_list_after(L,CurL,3),
		append([119,119,119],CurL,ResL);

		append(L,[122,122,122],ResL)),

		write("modified: "),
		write_string(ResL),nl,nl.

% проверяет, находятся ли заданные элементы по заданным индексам
check_string(_,[],[]).
check_string(L,[Elem|T1],[Ind|T2]):-	list_el_numb(L,Elem,Ind),
					check_string(L,T1,T2).
