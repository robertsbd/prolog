/* Define a binary tree data structure */

binary_tree(void).
binary_tree(tree(Element, Left, Right)) :-
    binary_tree(Left), binary_tree(Right).

/* test for a member */

tree_member(X, tree(X, Left, Right)).
tree_member(X, tree(Y, Left, Right)) :- tree_member(X, Left).
tree_member(X, tree(Y, Left, Right)) :- tree_member(X, Right).