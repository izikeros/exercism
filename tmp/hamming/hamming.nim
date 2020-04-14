# Lessons learned:
# - use len of string
# - increment varable

proc distance*(a: string, b: string): int =
    if a.len != b.len:
        raise newException(ValueError, "Strings are in different length")

    for i in 0 .. a.len - 1:
        if a[i] != b[i]:
            result.inc