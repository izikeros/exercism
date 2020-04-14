# Lessons learned:
# - using hash table
# - having constans on module-level instead of function-level
# - using exception on hash-table KeyError
# - one can use also array of tuples but it is less convenient than hash table:
#    const ptime = @[("Mercury",0.2408467), ("Venus",0.61519726), ("Earth", 1.0), ("Mars",1.8808158), 
#              ("Jupiter",11.862615), ("Saturn",29.447498), ("Uranus",84.016846), ("Neptune",164.79132)]

import tables
from strutils import toLowerAscii

const
    # planet to Earth's year ratio 
    year_factor = {
        "mercury":0.2408467,
        "venus":0.61519726,
        "earth":1.0,
        "mars":1.8808158,
        "jupiter":11.862615,
        "saturn":29.447498,
        "uranus":84.016846,
        "neptune":164.79132}.toTable
    # Earth's year in seconds
    earth_y_s=31557600

proc age*(planet: string, age_seconds: int64): float=
    # convert planet name to lower case, to match lowercase keys in the table
    let planet_l = planet.toLowerAscii()

    # covert age in seconds to Earth years
    let earth_years: float = float(age_seconds) / float(earth_y_s)

    # convert earth ears to given planet's year
    try :
        result = earth_years / year_factor[planet_l]
    except KeyError: 
        raise newException(ValueError,"Unknown planet")
    