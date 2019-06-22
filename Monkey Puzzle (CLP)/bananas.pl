:- use_module(library(clpfd)).

% Q1
distances([],_,[]).
distances([X|Y],B,[Ds|Next_Ds]) :-
	Ds#=abs(B-X),
	distances(Y,B,Next_Ds).

	
% Q2
triangle([],[]).
triangle([X|Y],Ds) :-
	distances([X|Y],X,[_|L]),
	triangle(Y,U),
	append(L,U,Ds).

	
% Q3
bananas(Vines) :-
	triangle([A,B,C,D],Ds),
	all_different(Ds),
	Vines = [A,B,C,D],
	Vines ins 1..10,
	labeling([],Vines).
	

% Q4
main(Solns) :-
	findall(V,bananas(V),W),
	length(W,Solns).