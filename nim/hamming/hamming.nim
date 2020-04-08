proc distance*(a: string, b: string): int =
    if a.len != b.len:
        raise newException(ValueError, "Strings are in different length")

    # tried with:
    #   for i in 0 .. <a.len:
    # but doesn't work
    let l: int = a.len - 1
    for i in 0 .. l:
        if a[i] != b[i]:
            result.inc