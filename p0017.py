"""
Number letter counts
Problem 17

https://projecteuler.net/problem=17
"""


def sol():
    under_ten = get_under_ten()
    total_of_one_to_ninety_nine = get_total_of_one_to_ninety_nine(under_ten)
    total_of_one_hundred_until_thousand = get_total_of_one_hundred_until_thousand(
        under_ten, total_of_one_to_ninety_nine
    )
    print(
        total_of_one_to_ninety_nine
        + total_of_one_hundred_until_thousand
        + len("one")
        + len("thousand")
    )


def get_under_ten():
    return [
        "one",
        "two",
        "three",
        "four",
        "five",
        "six",
        "seven",
        "eight",
        "nine",
    ]


def get_total_of_one_to_ninety_nine(under_ten):
    ten_to_nineteen = [
        "ten",
        "eleven",
        "twelve",
        "thirteen",
        "fourteen",
        "fifteen",
        "sixteen",
        "seventeen",
        "eighteen",
        "nineteen",
    ]
    twenty_to_ninety_step_10 = [
        "twenty",
        "thirty",
        "forty",
        "fifty",
        "sixty",
        "seventy",
        "eighty",
        "ninety",
    ]
    total_length_of_under_ten = sum([len(i) for i in under_ten])
    total_length_of_ten_to_nineteen = sum([len(i) for i in ten_to_nineteen])
    total_length_of_twenty_to_ninety_nine = 0
    for ten_time in twenty_to_ninety_step_10:
        tmp = len(ten_time) * 10
        tmp += total_length_of_under_ten
        total_length_of_twenty_to_ninety_nine += tmp
    return (
        total_length_of_under_ten
        + total_length_of_ten_to_nineteen
        + total_length_of_twenty_to_ninety_nine
    )


def get_total_of_one_hundred_until_thousand(under_ten, total_of_one_to_ninety_nine):
    result = 0
    hundred_length = len("hundred")
    and_length = len("and")
    for num in under_ten:
        tmp = (len(num) + len("hundred")) * 100
        tmp += and_length * 99
        tmp += total_of_one_to_ninety_nine
        result += tmp
    return result


if __name__ == "__main__":
    sol()
