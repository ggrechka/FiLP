%1 задание
append_element([], X, X).
append_element([H|T1], X, [H|T2]) :- append_element(T1, X, T2).

read_list(N, L) :- read_list(N, 0, [], L), !.
read_list(N, N, L, L) :- !.
read_list(N, CurN, CurL, L) :- CurN1 is CurN + 1, read(X), append_element(CurL, [X], CurL1), read_list(N, CurN1, CurL1, L).

write_list([]) :- !.
write_list([H|T]) :- write(H), write(" "), write_list(T).

%2 задание
sum_ls_down([], Sum, Sum) :- !.
sum_ls_down([Head|Tail], CurSum, Sum) :- CurSum1 is CurSum + Head, sum_ls_down(Tail, CurSum1, Sum).

%3 задание
sum_ls_up([],0) :- !.
sum_ls_up([Head|Tail], Sum) :- sum_ls_up(Tail,Sum1),Sum is (Sum1 + Head).

%4 задание-1
list_el_numb([H|_],H,N,N):-!.
list_el_numb([_|T],L,X,N):-X1 is X+1,list_el_numb(T,L,X1,N).
list_el_numb(List,L,N):-list_el_numb(List,L,0,N).

%4 задание-2
program:-write("Vvedite N: "), read(N),nl,
write("List: "), read_list(N,List),nl,
write("Element: "), read(L),nl,
list_el_numb(List,L,Numb), write(Numb),!;
write("Net Elementov").

%5 задание
programmm:- write("Vvedite N: "), read(N),nl,
write("List: "), read_list(N,List),nl,
write("Vvedite kol-vo elementov: "), read(Numb),nl,
list_el_numb(List,L,Numb), write(L),!.
programmm:- write("Net Elementov c numberom").

%6 задание
min_list_up([H], H):-!.
min_list_up([H|T], Min):-min_list_up(T,Min1),(H < Min1 -> Min is H;Min is Min1).

%7 задание
min_list_down([],Min,Min):-!.
min_list_down([H|T],X,Min):-(H < X -> X1 is H; X1 is X),min_list_down(T,X1,Min).
min_list_down([H|T],Min):- min_list_down(T,H,Min).

%8 задание
program_8:-write("Vvedite N: "), read(N),nl,
write("list: "), read_list(N,List), min_list_down(List,Min),
write("Min element iz list: "), write(Min),!.
program_8:-write("List 0 :(").

%9 задание
member(X,[X|T]):-!.
member(X,[_|T]):-member(X,T).

%10 задание
reverse(L,NewList):-reverse(L,[],NewList).
reverse([],InvL,InvL):-!.
reverse([H|T],CurList,InvL):-reverse(T,[H|CurList],InvL).

%11 задание
sub_list([],_):-!.
sub_list([H|TS],[H|TL]):-sub_list(TS,TL).

p(S,L):-sub_list(S,L),!.
p(S,[_|T]):-p(S,T).

%12 задание
del_number(0,[_|T],T):- !.
del_number(X,[Head|T1],[Head|T2]) :- X1 is X-1,del_number(X1,T1,T2).

%13 задание
remove_equal([],_,[]):-!.
remove_equal([H|T],H,T1):-!,remove_equal(T,H,T1).
remove_equal([H|T],X,[H|T1]):-remove_equal(T,X,T1).

%14 задание
just_once([]):- !.
just_once([H|T]):- not(member(H,T)), just_once(T).

%15 задание
simplification([],[]):-!.
simplification([H|T],T1):-member(H,T),simplification(T,T1),!.
simplification([H|T],[H|T1]):-not(member(H,T)),simplification(T,T1),!.

%16 задание
kolNum([],_,N,N):-!.
kolNum([H|T],X,N,Y):- (H =:= X -> N1 is (N + 1),kolNum(T,X,N1,Y);N1 is N,kolNum(T,X,N1,Y)).
kolNum(L,X,Y):-kolNum(L,X,0,Y).

%17 задание
length_list([],0):-!.
length_list([_|T],X):-length_list(T,X1),X is (X1 + 1).

%1.5 задание
task1_5(List,N):- min_list_up(List,Min), list_el_numb(List, Min, Numb), Numb is N,!.

%1.6 задание
task1_6(List,0,List):-!.
task1_6(List,Count,X):-Count1 is Count-1, task1_6(List,Count1,L1), sdv(L1,X).
task1_6(List,X):-task1_6(List,3,X).

sdv([],L,L):-!.
sdv([H|T],L,[H|L1]):- sdv(T,L, L1).
sdv([H|T],L):-sdv(T,[H],L).

%1.26 задание
num_min([],10000,_,_):-!.
num_min([Head|Tail], Min,I,Num):-I1 is I+1,num_min(Tail,Min1,I1,Num1),(Head<Min1-> Min is Head,Num is I1-2;Min is Min1,Num is Num1).
num_min([Head|Tail],Num):- num_min([Head|Tail],_,0,Num).

%1.29 задание
inter(List,Number1,Number2):-list_el_numb(List,Number1,0),list_el_numb(List,Number2,1).
max_in_interval(List,Interval):-inter(Interval,Num1,Num2),max_list_up(List,Max,_), Max<Num2,Max>Num1.