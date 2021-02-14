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
