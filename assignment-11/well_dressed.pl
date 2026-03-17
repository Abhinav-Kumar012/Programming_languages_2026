shirt(s1).
shirt(s2).

pant(p1).
pant(p2).

color(s1,red).
color(s2,blue).
color(p1,green).
color(p2,voilet).

wears(skc,s1,p1).
wears(ss,s2,p2).

compliments(red,green).
compliments(yellow,voilet).
compliments(blue,orange).

welldressed(X) :- wears(X,S,P), color(S,CS), color(P,CP), (compliments(CP,CS) ; compliments(CS,CP)).