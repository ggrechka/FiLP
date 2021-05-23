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


%4 задание
pr_ein4:- Employees = [_,_,_],

in_list(Employees,[_,sles,younger,no]),
in_list(Employees,[borisov,_,_,yes]),

in_list(Employees,[semenov,_,_,_]),
in_list(Employees,[ivanov,_,_,_]),
in_list(Employees,[_,tok,_,_]),
in_list(Employees,[_,svar,_,_]),
in_list(Employees,[_,_,older,_]),
in_list(Employees,[_,_,middle-aged,_]),
in_list(Employees,[_,_,_,not-stated]),

not(in_list(Employees,[_,tok,older,_])),
not(in_list(Employees,[semenov,tok,_,_])),
not(in_list(Employees,[semenov,_,younger,_])),

write(Employees).

%5 задание
pr_ein5:- Drinks = [_,_,_,_],

in_list(Drinks,[bottle,_]),
in_list(Drinks,[glass,_]),
in_list(Drinks,[jug,_]),
in_list(Drinks,[can,_]),

in_list(Drinks,[_,milk]),
in_list(Drinks,[_,lemonade]),
in_list(Drinks,[_,kvas]),
in_list(Drinks,[_,water]),

not(in_list(Drinks,[bottle,milk])),
not(in_list(Drinks,[bottle,water])),
not(in_list(Drinks,[jug,lemonade])),
not(in_list(Drinks,[jug,kvas])),
not(in_list(Drinks,[can,lemonade])),
not(in_list(Drinks,[can,water])),
not(in_list(Drinks,[glass,milk])),
not(in_list(Drinks,[can,milk])),

write(Drinks).

%6 задание
pr_ein6:- Professions = [_,_,_,_],
in_list(Professions,[pavlov,_]),
in_list(Professions,[levickiy,_]),
in_list(Professions,[voronov,_]),
in_list(Professions,[saharov,_]),


in_list(Professions,[_,writer]),
in_list(Professions,[_,dancer]),
in_list(Professions,[_,artist]),
in_list(Professions,[_,singer]),

not(in_list(Professions,[voronov,singer])),
not(in_list(Professions,[levickiy,singer])),
not(in_list(Professions,[voronov,artist])),
not(in_list(Professions,[pavlov,writer])),
not(in_list(Professions,[pavlov,artist])),
not(in_list(Professions,[saharov,writer])),
not(in_list(Professions,[voronov,writer])),


write(Professions).

%7 задача
pr_ein7:- Athletes = [_,_,_],
    
	in_list(Athletes,[michael,_,basketball]),
	in_list(Athletes,[simon,israel,_]),
	in_list(Athletes,[richard,_,_]),
	
	in_list(Athletes,[_,amerika,_]),
	in_list(Athletes,[_,australia,_]),
	
	in_list(Athletes,[_,_,tennis]),
	in_list(Athletes,[_,_,cricket]),
	
	
	not(in_list(Athletes,[michael,amerika,_])),
	not(in_list(Athletes,[simon,_,tennis])),
	
	in_list(Athletes,[Who1,australia,_]),
	in_list(Athletes,[richard,_,Who2]),
	write(Athletes), nl,
	write(Who1), write(" - australia"), nl,
	write(Who2), write(" - Richard sport"), nl.



%8 задача

naprotiv(A,B,[_,A,_,B]).
naprotiv(B,A,[A,_,B,_]).
naprotiv(B,A,[_,A,_,B]).

task_8:- Players = [_,_,_,_],
    in_list(Players,[kuznecov,_]),
    in_list(Players,[tokarev,_]),
    in_list(Players,[slesarev,_]),
    in_list(Players,[rezchikov,_]),
    in_list(Players,[_,kuznec]),
    in_list(Players,[_,tokar]),
    in_list(Players,[_,slesar]),
    in_list(Players,[_,rezchik]),

    not(in_list(Players,[rezchikov,rezchik])),
    not(in_list(Players,[kuznecov,kuznec])),
    not(in_list(Players,[tokarev,tokar])),
    not(in_list(Players,[slesarev,slesar])),

    naprotiv([kuznecov,_],[_,slesar],Players),
    naprotiv([rezchikov,_],[_,rezchik],Players),

    sprava_next([slesarev,_],[_,tokar],Players),

    sleva_next([_,kuznec],[Who,_],Players),
    write("On the left from kuznec - "),write(Who),nl,
    write(Players).
