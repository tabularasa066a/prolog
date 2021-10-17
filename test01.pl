human(taro).
human(jiro).
human(hanako).
human(yosiko).

dog(pochi).
dog(john).
dog(nana).
dog(mimi).

male(taro).
male(jiro).
male(pochi).
male(john).

female(hanako).
female(yosiko).
female(nana).
female(mimi).

marriageble(A,B) :- male(A), female(B).
marriageble(A,B) :- male(B), female(A).

mortal(A) :- human(A).
mortal(A) :- dog(A).
