max(X,Y,X):- X>=Y.
max(_,Y,Y).

max(X, Y, U, X):-X>=Y, X>=U.
max(_,Y, U, Y):- Y>=U.
max(_,_,U,U).

%рекурсия вверх
fact(1,1):-!.
fact(N,X):- N1 is N-1, fact(N1,X1), X is X1*N.


%рекурсия вниз
fact(1, CurX, CurX):-!.
fact(N,CurX,X):-CurX1 is CurX*N, N1 is N-1, fact(N1, CurX1, X).
factorial(N,X):-fact(N,1,X). 

%рекурсия вверх
fib(0,0):-!.
fib(1,1):-!.
fib(2,1):-!.
fib(N,X):- N1 is N-1, N2 is N-2, fib(N1,X1), fib(N2,X2), X is X1+X2.
