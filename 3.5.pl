
leaf(A) :- atomic(A).
tree(leaf(_), leaf(_)).
tree(tree(_, _), leaf(_)).
tree(leaf(_), tree(_, _)).
tree(tree(_, _), tree(_, _)).

swap(leaf(L), leaf(L)).
swap(tree(B1, B2), tree(B3, B4)) :- swap(B2, B3), swap(B1, B4).

