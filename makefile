compile: scanner.o listing.o
	g++ -o compile scanner.o listing.o
	
scanner.o: scanner.c listing.h tokens.h
	g++ -c scanner.c

scanner.c: scanner.l
	flex scanner.l
	mv lex.yy.c scanner.c

listing.o: listing.cc listing.h
	g++ -c listing.cc
