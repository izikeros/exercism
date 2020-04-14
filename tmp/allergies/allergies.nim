# Lessons learned:
# - define object (of the class)
# - define methods for the class (via proc)
# - filter dictionary

import tables
import sequtils
const
    codes = {
        "eggs":1,
        "peanuts":2,
        "shellfish":4,
        "strawberries":8,
        "tomatoes":16,
        "chocolate":32,
        "pollen":64,
        "cats":128}.toTable

    all_in_order = @["eggs", "peanuts", "shellfish", "strawberries",
                             "tomatoes", "chocolate", "pollen", "cats"]

type Allergies* = object
    score*: int

proc isAllergicTo*(allergies: Allergies, allergen_name: string): bool =
    try:
        result = (allergies.score and codes[allergen_name]) > 0
    except KeyError:
        discard

proc lst*(allergies: Allergies): seq[string] =

    var allergies_list: seq[string]
    # NOTE: this line (without extra braces after filterIt) is also valid Nim syntax
    # allergies_list = toSeq(codes.keys).filterIt (allergies.score and codes[it]) != 0
    allergies_list = toSeq(codes.keys).filterIt((allergies.score and codes[it]) != 0)
    
    # return results in expected order
    result = all_in_order.filterIt(it in allergies_list)
