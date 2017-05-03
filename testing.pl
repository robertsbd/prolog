%n_n(X) <- X is a number of the form s(s(..s(X)) or s(s(..s(0)))
n_n(0).
n_n(s(X)) :- n_n(X).

%0 is considered to be an even number. O is the base case reducing by 2 each time
even(0).
even(s(s(X))) :- even(X).

%1 is the base case, reducing by 2 each time
odd(s(0)).
odd(s(s(X))) :- odd(X). 

plus(0, X, X) :- n_n(X).
plus(s(X), Y, s(Z)) :- plus(X, Y,Z ).

%Calculates the fibonnacci number of a given number
fib(0, 0).
fib(s(0), s(0)).
fib(s(s(N)), F) :-
    fib(N,D),
    fib(s(N),E),
    plus(D,E,F).

% get last item in list

last(X, [_|[X]]).
last(X, [_|Ys]) :-
    last(X,Ys).

% produce a list that has doubled elements

double([], []).
double([X|Xs], [X,X|Ys]) :-
    double(Xs, Ys).

%reverse a list
reverse(Xs, R) :- reverse(Xs, [], R).
reverse([X|Xs], Acc, R) :-
    reverse(Xs, [X|Acc], R).
reverse([], Acc, Acc).

%get_element(List, Index, Element)
%get Element of Index from List
get_element([X|_], 0, X).
get_element([_|Xs], N, R) :-
    N1 is N - 1,
    get_element(Xs, N1, R).

get_element2([X|_], 0, X).
get_element2([_|Xs], s(N), R) :-
    get_element2(Xs, N, R).

del2([X|Xs], X, Ys) :- del2(Xs, X, Ys).

%substitue(X, Y, InList, OutList)
%substitutes Y for all occurences of X in InList
substitute(X, Y, [X|L1s], [Y|L2s]) :- % if X is the head of the list
    substitute(X, Y, L1s, L2s).
substitute(X, Y, [Z|L1s], [Z|L2s]) :- % if X is not the head of the list
    X \= Z,
    substitute(X, Y, L1s, L2s).
substitute(_, _, [], []).   % base case

%distinct(Xs, Rs) Xs is a list and Rs is the distinct values of Xs. This does produce multiple version of the returned list so
% could be improved.
distinct2([],[]).
distinct2([X|Xs], Rs) :-
    member(X, Xs),
    distinct2(Xs, Rs).
distinct2([X|Xs], [X|Rs]) :-
    not(member(X, Xs)),
    distinct2(Xs, Rs).


% merge_ordered_lists(List1, List2, MergedList) Will merge two ordered lists into a single ordered list
 
merge_ordered_lists([], [], []).
merge_ordered_lists(Xs, [], Xs).
merge_ordered_lists([], Ys, Ys).
merge_ordered_lists([X|Xs], [Y|Ys], [X|Rs]) :-
    X =< Y,
    merge_ordered_lists(Xs, [Y|Ys], Rs).
merge_ordered_lists([X|Xs],[Y|Ys], [Y|Rs]) :-
    X > Y,
    merge_ordered_lists([X|Xs], Ys, Rs).

% length(List, Length)