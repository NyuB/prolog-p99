# Prolog 99 problems

Prolog learning using https://www.ic.unicamp.br/~meidanis/courses/mc336/2009s2/prolog/problemas/

A copy of the page is placed in [problems](problems/99.html).

## Extra problems

[Exercism](https://exercism.org/tracks/prolog) exercices
+ [zebra puzzle](zebra.pl)

## Platform

All tests and implementations done with **swipl** on **Windows**. Should work with **swipl** on **Linux** too, no guarantee for other Prolog implementations.

## Tests

```bash
# run all *-tests.pl files
make tests
```

```bash
# run a specific ???-tests.pl file
make test-p027
```

## Generate problem skeleton

```bash
# creates ???.pl and ???-tests.pl
make init-p027
```

## Commit a solution

```bash
# run p???-tests.pl then commit p???.pl and p???-tests.pl with a default message
make commit-solved-p027
```