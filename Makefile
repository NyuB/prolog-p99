tests: test-p001 test-p002 test-p003 test-p004 test-p005

test-%: %.pl %-tests.pl
	swipl $*-tests.pl