tests: $(sort $(patsubst %-tests.pl,test-%,$(wildcard *-tests.pl))) 

test-%: %.pl %-tests.pl
	swipl $*-tests.pl

init-%:
ifeq ($(OS),Windows_NT)
	echo %% $*> $*.pl
	echo :- ensure_loaded($*).> $*-tests.pl
	echo :- initialization(tests, main).>> $*-tests.pl
	echo tests :- true.>> $*-tests.pl
else
	echo "% $*" > $*.pl
	echo ":- ensure_loaded($*)." > $*-tests.pl
	echo ":- initialization(tests, main)." >> $*-tests.pl
	echo "tests :- true." >> $*-tests.pl
endif

commit-solved-p%: test-p% p%.pl p%-tests.pl
	git add p$*.pl p$*-tests.pl
	git commit -m "Problem $* OK"
