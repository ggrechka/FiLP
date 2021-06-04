:- dynamic  group/2.
:- dynamic gender/2.
:- dynamic sales/2.
:- dynamic deadline/2.

read_stroka(A):- get0(X),r_stroka(X,A,[]).
r_stroka(10,A,A):- !.
r_stroka(X,A,B):- append(B,[X],B1),get0(X1),r_stroka(X1,A,B1).

group22(X,Y):- repeat,(group(X,Y)->(nl,write(X),nl,write(Y),write("."),
               retract(group(X,Y)));X=nil,Y=nil).

gender22(X,Y):-repeat,(gender(X,Y)->(nl,write(X),nl,write(Y),write("."),
                retract(gender(X,Y)));X=nil,Y=nil).

sales22(X,Y):- repeat,(sales(X,Y)->(nl,write(X),nl,write(Y),write("."),
              retract(sales(X, Y)));X=nil,Y=nil).

deadline22(X,Y):- repeat,(deadline(X,Y)->(nl,write(X),nl,write(Y),write("."),
               retract(deadline(X,Y)));X=nil,Y=nil).

otdaet:-
  tell('C:/Users/Grechka/Documents/Programs/FiLP/#11/group.txt'),group22(X1,_),X1=nil,told,
  tell('C:/Users/Grechka/Documents/Programs/FiLP/#11/gender.txt'),gender22(X2,_),X2=nil,told,
  tell('C:/Users/Grechka/Documents/Programs/FiLP/#11/sales.txt'),sales22(X3,_),X3=nil,told,
  tell('C:/Users/Grechka/Documents/Programs/FiLP/#11/deadline.txt'),deadline22(X4,_),X4=nil,told.

beret:-
  see('C:/Users/Grechka/Documents/Programs/FiLP/#11/group.txt'),get0(S1),read_chek(S1,1),seen,
  see('C:/Users/Grechka/Documents/Programs/FiLP/#11/gender.txt'),get0(S2),read_chek(S2,2),seen,
  see('C:/Users/Grechka/Documents/Programs/FiLP/#11/sales.txt'),get0(S3),read_chek(S3,3),seen,
  see('C:/Users/Grechka/Documents/Programs/FiLP/#11/deadline.txt'),get0(S4),read_chek(S4,4),seen.

read_chek(-1,_):- !.
read_chek(_,Flag):-read_stroka(Lang),name(X,Lang),read(Y),(
            Flag=1->asserta(group(X,Y));(
            Flag=2->asserta(gender(X,Y));(
            Flag=3->asserta(sales(X,Y));(
            Flag=4->asserta(deadline(X,Y)))))),get0(Sym),read_chek(Sym,Flag).

question1(X1):-	write("What group is the student from?"),nl,
			write("1. First group"),nl,
			write("2. Second group"),nl,
		write("3. Third group"),nl,
			write("4. Fourth group"),nl,
		write("5. Fifth group"),nl,
			read(X1).

question2(X2):-	write("Male or Female?"),nl,
			write("1. Male"),nl,
			write("2. Female"),nl,
			read(X2).

question3(X3):-	write("Is there a discount available?"),nl,
			write("1. 10%"),nl,
			write("2. 20%"),nl,
		write("3. 30%"),nl,
			write("4. 40%"),nl,
			read(X3).

question4(X4):-	write("Does the student meet deadlines?"),nl,
			write("1. Yes"),nl,
			write("2. No"),nl,
			read(X4).

addPers(Pers,X1,X2,X3,X4):-
  append('C:/Users/Grechka/Documents/Programs/FiLP/#11/group.txt'),
  nl,write(Pers),nl,write(X1),write("."),told,

  append('C:/Users/Grechka/Documents/Programs/FiLP/#11/gender.txt'),
  nl,write(Pers),nl,write(X2),write("."),told,

  append('C:/Users/Grechka/Documents/Programs/FiLP/#11/sales.txt'),
  nl,write(Pers),nl,write(X3),write("."),told,

  append('C:/Users/Grechka/Documents/Programs/FiLP/#11/deadline.txt'),
  nl,write(Pers),nl,write(X4),write("."),told.


pr:- beret,question1(X1),question2(X2),question3(X3),question4(X4),
    (group(X,X1),gender(X,X2),sales(X,X3),deadline(X,X4),write(X);
    (write("Pers -> "),read(Pers),asserta(group(Pers,X1)),
     asserta(gender(Pers,X2)),asserta(sales(Pers,X3)),asserta(deadline(Pers,X4)),
    otdaet,nl,write("Pers naiden!"))).
