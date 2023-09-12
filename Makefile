tests: test-p001 test-p002 test-p003 test-p004 test-p005

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
	