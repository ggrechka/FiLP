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

% задание 11
task11:-	read_string(L,Length),

		(Length>10 -> build_list(L,ResL,7);
		Count is 12-Length,build_reps(Count,111,Reps),
		append(L,Reps,ResL)),

		write("modified: "),
		write_string(ResL),nl,nl.

% задание 12
task12:-	read_string(L,_),

		split_string(L,CurL,3),		% 3 - длина фрагмента
		ch_random_lists(CurL,NewL,2),	% 2 - индекс вставки
		double_sort(NewL,ResL),	
		
		nl,writeln("fragments with three characters:"),
		write_strings(CurL),nl,
		
		writeln("fragments with replaced middle character:"),
		write_strings(NewL),nl,

		writeln("sorted fragments:"),
		write_strings(ResL),nl.

list_length([],0):-!.
list_length([_|T],X):-	list_length(T,CurX),
			X is CurX+1.


% удалить элемент с заданным номером
list_delete_item([_|T],CurList,ResList,CurN,CurN):-	appendList(CurList,T,ResList),!.
list_delete_item([H|T],CurList,ResList,CurN,N):-	appendList(CurList,[H],NewList),
							NewN is CurN+1,
							list_delete_item(T,NewList,ResList,NewN,N).
list_delete_item(List,ResList,N):-list_delete_item(List,[],ResList,1,N).
% сортировка списка
sort_list([],L,L):-!.
sort_list(L,ResL,CurResL):-	max_list_down(L,Max),
				append([Max],CurResL,NewResL),
				list_el_numb(L,Max,I),
				list_delete_item(L,CurL,I),
				sort_list(CurL,ResL,NewResL).
sort_list(L,ResL):-sort_list(L,ResL,[]).

% сортировка списков в списке
double_sort([],L,L):-!.
double_sort([H|T],ResL,CurResL):-	sort_list(H,CurH),
					append(CurResL,[CurH],NewResL),
					double_sort(T,ResL,NewResL).
double_sort(L,ResL):-double_sort(L,ResL,[]).

% разделение строки на фрагменты с заданным количеством элементов
% *длина строки должна делиться на заданное число*
split_string([],[],_):-!.
split_string(L,ResL,Count):-	list_length(L,Length),
				Length>=Count,
				CurCount is Count+1,
				build_list(L,FragL,CurCount),
				build_list_after(L,CurL,Count),
				split_string(CurL,CurResL,Count),
				append([FragL],CurResL,ResL).

% генерация кода символа, не совпадающего ни с одним элементом списка,
% *диапазон - маленькие буквы латинского алфавита [97,122]*
character_random(_,_,123):-	!,fail.
character_random(L,R,CurR):-	not(member(L,CurR)),
				R=CurR,!.
character_random(L,R,CurR):-	NewR is CurR+1,
				character_random(L,R,NewR).				
character_random(L,R):-character_random(L,R,97).

% замена в списках списка символа на заданной позиции
% другим рандомным символом, не совпадающим ни с одним
% из элементов списка
ch_random_lists([],L,L,_):-!.
ch_random_lists([H|T],ResL,CurResL,I):-	character_random(H,R),
					replace_character(H,CurH,R,I),
					append(CurResL,[CurH],NewResL),
					ch_random_lists(T,ResL,NewResL,I).
ch_random_lists(L,ResL,I):-ch_random_lists(L,ResL,[],I). 

% замена символа на заданной позиции
replace_character(L,ResL,X,I):-	list_delete_item(L,CurL,I),
				insert_list(CurL,ResL,X,I).

% замена местами двух символов по индексам
replace_characters(L,ResL,I1,I2):-	list_el_numb(L,X1,I1),
					list_el_numb(L,X2,I2),
					
					replace_character(L,CurL,X1,I2),
					replace_character(CurL,ResL,X2,I1).
% вставить элемент на заданный индекс
insert_list(L,ResL,X,Ind):-	build_list(L,L1,Ind),

				CurInd is Ind-1,
				build_list_after(L,L2,CurInd),

				append(L1,[X],CurL1),
				append(CurL1,L2,ResL).

% задание 13
task13:-	read_string(L,_),
		replace_even(L,ResL),

		write("modified: "),
		write_string(ResL),nl,nl.

% выполняет поставленную в task 7.13 задачу
replace_even([],L,L,_):-!.
replace_even([H|T],CurL,ResL,I):-	CurI is I+1,
					1 is CurI mod 2,
					append(CurL,[H],NewL),
					replace_even(T,NewL,ResL,CurI),!.
replace_even([H|T],CurL,ResL,I):-	CurI is I+1,
					H \= 97,H \= 98,
					append(CurL,[97],NewL),
					replace_even(T,NewL,ResL,CurI),!.
replace_even([_|T],CurL,ResL,I):-	CurI is I+1,
					append(CurL,[99],NewL),
					replace_even(T,NewL,ResL,CurI).
replace_even(L,ResL):-replace_even(L,[],ResL,0).


% задание 14
task14:-	read_string(L,_),
		count_digits(L,Count),

		write("count of digits: "),
		write(Count),nl,nl.

% считает количество цифр в строке
count_digits([],0):-!.
count_digits([H|T],Count):-	count_digits(T,CurCount),
				(H>=48,H=<57 ->
				Count is CurCount+1;
				Count=CurCount).

% задание 15
task15:-read_string(List,_),abc(List).

abc([]):-!.
abc([H|T]):-(H\=97,H\=98,H\=99->!,fail;abc(T)).



% задание 16
task16:-	read_string(L,_),
		
		W1=[119, 111, 114, 100],		% word
		W2=[108, 101, 116, 116, 101, 114],	% letter

		replace_words(L,ResL,W1,W2),

		write("modified:"),
		write_string(ResL),nl,nl.
		
% заменяет все вхождения одного слова на другое
replace_words(L,L,[],_,_):-!.
replace_words(L,ResL,[I|T],W,Length):-	remove_word(L,CurL,Length,I),
					insert_word(CurL,NewL,W,I),
					replace_words(NewL,ResL,T,W,Length).
replace_words(L,ResL,W1,W2):-	find_index_in(L,InL,W1),
				reverse(InL,CurInL),
				list_length(W1,Length),
				replace_words(L,ResL,CurInL,W2,Length).
				
% находит все первые индексы вхождения слова
% пример: "gbcabcababc" - "abc" - [4,9]
find_index_in([],[],_,_,_):-!.
find_index_in(L,InL,Word,LenW,I):-	CurLenW is LenW+1,
					build_list(L,CurWord,CurLenW),
					list_same_order(Word,CurWord),
					build_list_after(L,CurL,LenW),
					CurI is I+LenW,					
					find_index_in(CurL,CurInL,Word,LenW,CurI),
					append([I],CurInL,InL),!.
find_index_in([_|T],InL,Word,LenW,I):-	CurI is I+1,
					find_index_in(T,InL,Word,LenW,CurI).							
find_index_in(L,InL,Word):-	list_length(Word,LenW),
				find_index_in(L,InL,Word,LenW,1).

list_same_order([],_):-!.
list_same_order([H|T1],[H|T2]):-list_same_order(T1,T2),!.	
list_same_order(Sublist,[_|T]):-list_same_order(Sublist,T).

% удаляет заданное количество элементов, начиная с заданного индекса
% *(индекс + количество - 1) не должно превышать длину*
remove_word(L,L,0,_):-!.
remove_word(L,ResL,Length,I):-	CurLength is Length-1,
				list_delete_item(L,CurL,I),
				remove_word(CurL,ResL,CurLength,I).

% вставляет слово, начиная с заданной позиции
% *индекс не должен превышать (длина + 1)*
insert_word(L,L,[],_):-!.
insert_word(L,ResL,[H|T],I):-	insert_list(L,CurL,H,I),
				CurI is I+1,
				insert_word(CurL,ResL,T,CurI).