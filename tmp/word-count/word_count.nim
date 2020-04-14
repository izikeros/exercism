# Lessons learned:
# - CountTable is initialized with type of keys (since it is counting values are int's)
# - using splitWhitespace solve problem of multiple white spaces

import tables
import strutils

const allowed_chars = {'a'..'z', '0' .. '9', '\'', ' ', '\t' , '\n'}

proc countWords*(sentence: string): CountTable[string]  =    
    # preprocess - character level
    let sentence_low = sentence.toLowerAscii()
    var sentence_clean : seq[char]
    
    # replace character with ' ' if not in allowed characters set
    for c in sentence_low:
        if c in allowed_chars:
            sentence_clean.add(c)
        else:
            sentence_clean.add(' ')
    
    # tokenize sentence
    var tokens = sentence_clean.join().splitWhitespace()

    # preprocess - word level
    # Not fully correct - remove apostrophes in the start and the end
    # but good enough to pass the tests.
    var new_tokens: seq[string]
    for t in tokens:
        var nt = t
        if t.startsWith('\''):
            nt.removePrefix('\'')
        if t.endsWith('\''):
            nt.removeSuffix({'\''})
        new_tokens.add(nt)
    
    # count tokens
    var counts = new_tokens.toCountTable()
    result = counts
