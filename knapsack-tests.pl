:- ensure_loaded(knapsack).
:- initialization(tests, main).

tests :-
    maximum_value([], 100, 0),
    \+ maximum_value([item(101,1)], 100, 0),
    maximum_value(
                [
                    item(2, 5),
                    item(2, 5),
                    item(2, 5),
                    item(2, 5),
                    item(10, 21)
                ],
                10,
                21
            ),
    maximum_value(
                [
                    item(2, 20),
                    item(2, 20),
                    item(2, 20),
                    item(2, 20),
                    item(10, 50)
                ],
                10,
                80
            ),
    maximum_value(
                [
                    item(5, 10),
                    item(4, 40),
                    item(6, 30),
                    item(4, 50)
                ],
                10,
                90
            ),
    maximum_value(
                [
                    item(25, 350),
                    item(35, 400),
                    item(45, 450),
                    item(5, 20),
                    item(25, 70),
                    item(3, 8),
                    item(2, 5),
                    item(2, 5)
                ],
                104,
                900
            ),
    maximum_value(
                [
                    item(70, 135),
                    item(73, 139),
                    item(77, 149),
                    item(80, 150),
                    item(82, 156),
                    item(87, 163),
                    item(90, 173),
                    item(94, 184),
                    item(98, 192),
                    item(106, 201),
                    item(110, 210),
                    item(113, 214),
                    item(115, 221),
                    item(118, 229),
                    item(120, 240)
                ],
                750,
                1458
            ),
    true.
