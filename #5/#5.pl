%1 задание
sub_posl([],_):-!.
sub_posl(_,[]):-fail,!.
sub_posl([],_):-!.
sub_posl(_,[]):-fail,!.
sub_posl([H|Sub_list],[H|List]):-sub_posl(Sub_list,List),!.
sub_posl(Sub_list,[_|List]):-sub_posl(Sub_list,List).

sub_set([],[]).
sub_set([H|Sub_set],[H|Set]):-sub_set(Sub_set,Set).
sub_set(Sub_set,[H|Set]):-sub_set(Sub_set,Set).

in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).


sprava_next(A,B,[C]):-fail.
sprava_next(A,B,[A|[B|Tail]]).
sprava_next(A,B,[_|List]):-sprava_next(A,B,List).

sleva_next(A,B,[C]):-fail.
sleva_next(A,B,[B|[A|Tail]]).
sleva_next(A,B,[_|List]):-sleva_next(A,B,List).

%est li sosed
next_to(A,B,List):-sprava_next(A,B,List).
next_to(A,B,List):-sleva_next(A,B,List).

el_no(List,Num,El):-el_no(List,Num,1,El).
el_no([H|_],Num,Num,H):-!.
el_no([_|Tail],Num,Ind,El):-Ind1 is Ind+1,el_no(Tail,Num,Ind1,El).

pr_ein:- Houses=[_,_,_,_,_],

		in_list(Houses,[red,english,_,_,_]),
		in_list(Houses,[_,spanish,_,dog,_]),
		in_list(Houses,[green,_,coffee,_,_]),
		in_list(Houses,[_,ukrain,tea,_,_]),
		sprava_next([green,_,_,_,_],[white,_,_,_,_],Houses),
		in_list(Houses,[_,_,_,ulitka,old_gold]),
		in_list(Houses,[yellow,_,_,_,kool]),
		el_no(Houses,3,[_,_,milk,_,_]),
		el_no(Houses,1,[_,norway,_,_,_]),
		next_to([_,_,_,_,chester],[_,_,_,fox,_],Houses),
		next_to([_,_,_,_,kool],[_,_,_,horse,_],Houses),
		in_list(Houses,[_,_,orange,_,lucky]),
		in_list(Houses,[_,japan,_,_,parlament]),
		next_to([_,norway,_,_,_],[blue,_,_,_,_],Houses),


		in_list(Houses,[_,WHO1,water,_,_]),
		in_list(Houses,[_,WHO2,_,zebra,_]),
		write(Houses), nl,
		write(WHO1), write("  water "), nl,
    		write(WHO2), write(" zebra "), nl.

%2 задание
pr_ein2:-Hair=[_,_,_],

in_list(Hair,[belokurov,_]),
in_list(Hair,[chernov,_]),
in_list(Hair,[rizhov,_]),
in_list(Hair,[_,brunet]),
in_list(Hair,[_,red]),
in_list(Hair,[_,blond]),
not(in_list(Hair,[belokurov,blond])),
not(in_list(Hair,[belokurov,brunet])),
not(in_list(Hair,[rizhov,red])),
not(in_list(Hair,[chernov,brunet])),
write(Hair).

%3 задание

pr_ein3:- Style=[_,_,_],

in_list(Style,[anya,_,_]),
in_list(Style,[nata,_,_]),
in_list(Style,[valya,_,_]),
in_list(Style,[_,white,_]),
in_list(Style,[_,green,_]),
in_list(Style,[_,blue,_]),
in_list(Style,[_,_,white]),
in_list(Style,[_,_,green]),
in_list(Style,[_,_,blue]),

in_list(Style,[nata,_,green]),

(in_list(Style,[anya,green,green]);
in_list(Style,[anya,white,white]);
in_list(Style,[anya,blue,blue])),
not(in_list(Style,[valya,white,_])),
not(in_list(Style,[valya,_,white])),
not(in_list(Style,[valya,white,white])),
not(in_list(Style,[valya,green,green])),
not(in_list(Style,[valya,white,white])),
not(in_list(Style,[valya,blue,blue])),
not(in_list(Style,[nata,green,green])),
not(in_list(Style,[nata,white,white])),
not(in_list(Style,[nata,blue,blue])),

write(Style).