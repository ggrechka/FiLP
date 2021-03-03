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