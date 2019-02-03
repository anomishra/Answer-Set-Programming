
% Vertex
vertex(1;2;3;4;5).

% edge
edge(1,2;1,3;1,4).
edge(2,4;2,5).
edge(3,2;3,4).
edge(4,5).

% in directed graph, every node has a path itself
connected (X,X) :- vertex(X).

% ASP for an edge connection
connected(X,Y) :- edge(X,Y).
%-connected(X,Y) :- not connected(X,Y).
% blocked
blocked(X,Y) :-  edge(X,Z), connected(Z,Y), not connected(X,Y).

#show blocked/2.
#show connected/2.
