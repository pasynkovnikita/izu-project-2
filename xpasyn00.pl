% Zadani c. 30:
% Napiste program resici ukol dany predikatem u30(LIN,VOUT), kde LIN je
% vstupni ciselny seznam s nejmene jednim prvkem a VOUT je promenna, ve
% ktere se vraci prumerna hodnota absolutnich hodnot cisel v seznamu LIN.

% Testovaci predikaty:                                 		% VOUT
u30_1:- u30([5,3,-18,2,-9,-13,17],VOUT),write(VOUT).		% 9.57...
u30_2:- u30([5,2],VOUT),write(VOUT).				% 3.5
u30_3:- u30([-18.3,-9.2,-13.1],VOUT),write(VOUT).		% 13.53...
u30_r:- write('Zadej LIN: '),read(LIN),
	u30(LIN,VOUT),write(VOUT).

% Reseni:
u30(LIN,VOUT):- list_sum(LIN,SUM,LENGTH), VOUT is SUM/LENGTH.

% function for absolute value to replace built-in predicate abs()
absolute(X,X_abs) :- X < 0 -> X_abs is -X ; X_abs = X.

% function for sum of list with length to replace built-in predicate length()
list_sum([],0,0).
list_sum([H|T],SUM,LENGTH) :- list_sum(T,SUM_2,LENGTH_2),
absolute(H,ABS_H),
SUM is SUM_2 + ABS_H,
LENGTH is LENGTH_2 + 1.


