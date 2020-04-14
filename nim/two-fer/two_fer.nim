# Lessons learned:
# - string formatting like in f string. You can replace fmt with '&'.

import strformat
proc twoFer*(name: string ="you"): string =
    result = fmt"One for {name}, one for me."