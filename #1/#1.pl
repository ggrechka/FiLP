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
