# Lessons learned:
# - indexing last element of the array (a[^1])
# - using char type
# - convert to upper/lower case with toUpperAscii, toLowerAscii
# - strip out white spaces with strip()
# - using endswith (hint from mentor)
# - using elif (hint from mentor)
# 
# from other solutions:
# https://exercism.io/tracks/nim/exercises/bob/solutions/75054b65d38148299dc223ba3c9ed5aa
#  from strutils import isEmptyOrWhitespace, isAlphaAscii, isUpperAscii 
#
# https://exercism.io/tracks/nim/exercises/bob/solutions/97489bf0b4804a60976c2533ccfeae23
#  from sequtils import any
#  let yelling = conversation.any(isUpperAscii) and not conversation.any(isLowerAscii)
from strutils import toUpperAscii, toLowerAscii, strip, join, endsWith
import sequtils

const letters = {'a'..'z'}

proc hey*(text: string): string =
    
    let s_text: string = text.strip()
    let hasLetters: bool = toLowerAscii(s_text).filterIt(it in letters).join.len() > 0
    let isShout: bool = toUpperAscii(s_text) == s_text  
    let isEmpty = s_text.len() == 0
    let isQuestion = s_text.endsWith('?')

    result = "Whatever."
    if hasLetters and isShout:
        result = "Whoa, chill out!"
    elif isQuestion:
        result = "Sure."
    
    # Forceful question
    if hasLetters and isShout and isQuestion:
        result = "Calm down, I know what I'm doing!"
    
    if isEmpty:
        result = "Fine. Be that way!"

