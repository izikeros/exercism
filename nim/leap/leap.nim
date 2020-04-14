# Lessons learned:
# - using modulo operation
# - expressions are also valid function bodies
# - The result variable is initialized to the empty value at the start of each method, and for bool that is false (mentor)

proc isLeapYear*(year: int): bool =
    let div_by_4 = year mod 4 == 0
    let div_by_100 = year mod 100 == 0
    let div_by_400 = year mod 400 == 0

    (div_by_4 and not div_by_100) or (div_by_400)

