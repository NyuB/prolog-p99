test-%: %.pl %-tests.pl
	swipl $*-tests.pl