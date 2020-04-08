import sequtils
import tables
from strutils import join
from strutils import toLowerAscii

proc isPangram*(text: string): bool =
    # TODO: consider using set
    const letters = @"abcdefghijklmnopqrstuvwxyz"

    # quick win if string is shorter than length of letters set
    if text.len < letters.len:
        result = false

    # initialize hash table
    var lettersTable = initTable[char, int]() #({"a":0})
    for l in letters:
        lettersTable[l] = 0

    # filter out non-letter characters from the text converted to lowercase
    let text_clean = toLowerAscii(text).filterIt(it in letters).join

    # iterate over text and remove key corresponding to each encountered character
    for character in text_clean:
        if lettersTable.hasKey(character):
            lettersTable.del(character)
            # break parsing if all letters found
            if lettersTable.len == 0:
                break

    # the text is panagram if after parsing no keys left in the dictionary
    result = false
    if lettersTable.len == 0:
        result = true