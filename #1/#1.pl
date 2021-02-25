man(pavel).
man(alexey).
man(zhenia).


man(ivan).
man(maksim).
man(fedor).
man(sasha).


man(egor).
man(kirill).
man(kolya).


woman(anna).
woman(lydmila).
woman(katya).


woman(liza).
woman(sveta).
woman(dasha).


woman(irina).
woman(anfisa).
woman(valeria).

men(X):-man(X), write(X), write(" "), fail.
women(X):-woman(X), write(X), write(" "), fail.

parent(pavel,ivan).
parent(anna,ivan).

parent(alexey,liza).
parent(alexey,sveta).
parent(alexey,maksim).
parent(alexey,dasha).
parent(lydmila,liza).
parent(lydmila,sveta).
parent(lydmila,maksim).
parent(lydmila,dasha).

parent(katya,fedor).
parent(katya,sasha).
parent(zhenia,fedor).
parent(zhenia,sasha).

parent(ivan,irina).
parent(ivan,anfisa).
parent(ivan,valeria).
parent(liza,irina).
parent(liza,anfisa).
parent(liza,valeria).

parent(dasha,egor).
parent(dasha,kirill).
parent(dasha,kolya).
parent(fedor,egor).
parent(fedor,kirill).
parent(fedor,kolya).

child(X,Y):-parent(Y,X).
children(X):-child(Y,X), write(Y), write(" "), fail.

mother(X,Y):-woman(X), parent(X,Y).
mother(X):-mother(X,Y), write(Y), write(" "), fail.

son(X,Y):-child(X,Y), man(X).
son(X):-son(Y,X), write(Y).

brother(X,Y):-parent(Z,X),parent(Z,Y), man(X), not(Y=X).
brothers(X):-parent(Z,X), woman(Z), child(Y,Z), not(X=Y), man(Y), write(Y), write(" "), fail.

husband(X,Y):-man(X), parent(X,Z), parent(Y,Z).
husband(X):-husband(Y,X), not(Y=X), write(Y).

father(X,Y):- man(X), parent(X,Y).
b_s(X,Y):- mother(Z,X), mother(W,Y), Z=W, father(K,X), father(C,Y), K=C.
b_s(X):- b_s(X,Y), not(Y=X), write(Y), write(" "), fail.

grand_pa(X,Y):- man(X), parent(Z,Y), parent(X,Z).
grand_pas(X):- grand_pa(Y,X), write(Y), write(" "), fail.