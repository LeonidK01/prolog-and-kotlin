man(akakii).
man(genya).
man(arsenya).
man(petya).
man(zahar).
man(artem).
man(vova).
man(gena).
man(bartameo).
man(losyk).


woman(sveta).
woman(ksyha).
woman(polina).
woman(masha).
woman(katya).
woman(dasha).
woman(ifrosinya).
woman(aleftina).

parent(akakii,masha).
parent(sveta,masha).
parent(akakii,ifrosinya).
parent(sveta,ifrosinya).

parent(genya,petya).
parent(genya,zahar).
parent(ksyha,petya).
parent(ksyha,zahar).

parent(arsenya,katya).
parent(polina,katya).
parent(arsenya,bartameo).
parent(polina,bartameo).

parent(petya,artem).
parent(petya,dasha).
parent(masha,artem).
parent(masha,dasha).

parent(zahar,vova).
parent(zahar,gena).
parent(katya,vova).
parent(katya,gena).

parent(ifrosinya,aleftina).
parent(ifrosinya,losyk).
parent(bartameo,aleftina).
parent(bartameo,losyk).

man:-man(X),write(X),nl, fail.
woman:-woman(X),write(X),nl,fail.
children(X):-parent(X,Y),write(Y),nl,fail.
mother(X,Y):-parent(X,Y),woman(X).
mother(X):-mother(Y,X),write(Y),nl,fail.
father(X,Y):-parent(X,Y),man(X).
father(X):-father(Y,X), write(Y),nl,fail.
brother(X,Y):-man(X),parent(Z,X),parent(Z,Y),woman(Z).
brothers(X):-brother(Y,X),dif(X,Y),write(Y),nl,fail.
sister(X,Y):-woman(X),parent(Z,X),parent(Z,Y),woman(Z).
sisters(X):-sister(Y,X),dif(X,Y),write(Y),nl,fail.
b_s(X,Y):-parent(Z,X),woman(Z),parent(Z,Y),woman(Z).
b_s(X):-b_s(X,Y),dif(X,Y),write(Y),nl,fail.
grand_pa(X,Y):-father(Z,Y),father(X,Z);mother(Z,Y),father(X,Z),!.
grand_pas(X):-grand_pa(Y,X),write(Y),nl,fail.
grand_so(X,Y):-parent(Z,X),parent(Y,Z),man(X),!.
grand_sons(X):-grand_so(Y,X),write(Y),nl,fail.
grand_pa_and_son(X,Y):-grand_pa(X,Y),man(Y);grand_pa(Y,X),man(X),!.
grand_ma_and_son(X,Y):-parent(Z,Y),mother(X,Z),man(Y);parent(Z,X),mother(Y,Z),man(X),!.
uncle(X,Y):-parent(Z,Y),brother(X,Z),dif(Z,X),!.
uncle_vs(X):-uncle(Y,X),write(Y),nl,fail.
aunt(X,Y):-parent(Z,Y),sister(X,Z),dif(Z,X),!.
anut_vs(X):-aunt(Y,X),write(Y),nl,fail.
