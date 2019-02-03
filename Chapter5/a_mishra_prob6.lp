class(saxophone).
class(selmerMarkVI).
is_subclass(selmerMarkVI, saxophone).

object(jake).
object(mo).

is_a(jake, selmerMarkVI).
is_a(mo, selmerMarkVI).


%% Subclass Relation:
subclass(C1,C2) :- is_subclass(C1,C2).

subclass(C1,C2) :- is_subclass(C1,C3),
                   subclass(C3,C2).

-subclass(C1,C2) :- class(C1),
                    class(C2),
                    not subclass(C1,C2).

%% Class Membership:
member(X,C) :- is_a(X,C).
member(X,C) :- is_a(X,C0),
               subclass(C0,C).

siblings(C1,C2) :- is_subclass(C1,C),
                   is_subclass(C2,C),
                   C1 != C2.

-member(X,C2) :- member(X,C1),
                 siblings(C1,C2),
                 C1 != C2.

part_of(d_key, X):- member(X, saxophone).
part_of(spring, X):- part_of(d_key, X).

% normally, spring are not broken
-broken(X,spring):- member(X,saxophone), not ab(d(X)), not broken(X,spring).

%provided information of mo
broken(mo,spring).
ab(d(mo)).

% condition for broken saxophone
broken_sax(X):- member(X, saxophone), broken(X,spring).
-broken_sax(X):- member(X, saxophone), not broken_sax(X).

% ?broken_sax(mo), ?broken_sax(jake)
#show broken_sax/1.
#show -broken_sax/1.
