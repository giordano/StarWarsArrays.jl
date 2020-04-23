# StarWarsArrays.jl

[![Build Status](https://travis-ci.com/giordano/StarWarsArrays.jl.svg?branch=master)](https://travis-ci.com/giordano/StarWarsArrays.jl)
[![Build Status](https://ci.appveyor.com/api/projects/status/github/giordano/StarWarsArrays.jl?svg=true)](https://ci.appveyor.com/project/giordano/StarWarsArrays-jl)
[![Codecov](https://codecov.io/gh/giordano/StarWarsArrays.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/giordano/StarWarsArrays.jl)
[![Coveralls](https://coveralls.io/repos/github/giordano/StarWarsArrays.jl/badge.svg?branch=master)](https://coveralls.io/github/giordano/StarWarsArrays.jl?branch=master)

## Introduction

`StarWarsArrays.jl` is a [Julia](https://julialang.org/) package to provide
arrays indexed as the order of the Star Wars movies.  Thus, index 4 points to
the first element of the parent array, index 2 points to its fifth element, and
index 9 points to the nineth element.  The ordering applies to all dimensions of
the array.  `StarWarsArrays.jl` also supports [Machete
Order](https://www.nomachetejuggling.com/2011/11/11/the-star-wars-saga-suggested-viewing-order/).

This package is inspired by the Reddit thread ["Oof level of an array,
nice."](https://www.reddit.com/r/ProgrammerHumor/comments/clna6k/oof_level_of_an_array_nice/).

## Installation

The latest version of `StarWarsArrays.jl` is available for Julia v1.0 and
later releases, and can be installed with [Julia built-in package
manager](https://julialang.github.io/Pkg.jl/stable/).  In a Julia session, after
entering the package manager mode with `]`, run the command

```julia
pkg> add https://github.com/giordano/StarWarsArrays.jl
```

## Usage

```julia
julia> using StarWarsArrays

julia> v = StarWarsArray(collect(1:9))
9-element StarWarsArray{Int64,1,Array{Int64,1},StarWarsArrays.OriginalOrder}:
 4
 5
 6
 1
 2
 3
 7
 8
 9

julia> v[4]
1

julia> v[2]
5

julia> v[9]
9

julia> v[5] = 42
42

julia> v
9-element StarWarsArray{Int64,1,Array{Int64,1},StarWarsArrays.OriginalOrder}:
  4
  5
  6
  1
 42
  3
  7
  8
  9

julia> m = StarWarsArray(reshape(collect(1:81), 9, 9))
9×9 StarWarsArray{Int64,2,Array{Int64,2},StarWarsArrays.OriginalOrder}:
 31  40  49  4  13  22  58  67  76
 32  41  50  5  14  23  59  68  77
 33  42  51  6  15  24  60  69  78
 28  37  46  1  10  19  55  64  73
 29  38  47  2  11  20  56  65  74
 30  39  48  3  12  21  57  66  75
 34  43  52  7  16  25  61  70  79
 35  44  53  8  17  26  62  71  80
 36  45  54  9  18  27  63  72  81

julia> m[5]
2

julia> m[5,1]
29

julia> m[5,4]
2

julia> m[5,8]
65

julia> m[3,2] = -1
-1

julia> m
9×9 StarWarsArray{Int64,2,Array{Int64,2},StarWarsArrays.OriginalOrder}:
 31  40  49  4  13  22  58  67  76
 32  41  50  5  14  23  59  68  77
 33  -1  51  6  15  24  60  69  78
 28  37  46  1  10  19  55  64  73
 29  38  47  2  11  20  56  65  74
 30  39  48  3  12  21  57  66  75
 34  43  52  7  16  25  61  70  79
 35  44  53  8  17  26  62  71  80
 36  45  54  9  18  27  63  72  81
```

The second of `StarWarsArray` allows you to specify the order.  Here is how to
use `MacheteOrder`:

```julia
julia> using StarWarsArrays

julia> v = StarWarsArray(collect(1:9), MacheteOrder)
8-element view(::Array{Int64,1}, [3, 4, 1, 2, 5, 6, 7, 8]) with eltype Int64:
 3
 4
 1
 2
 5
 6
 7
 8

julia> v[4]
1

julia> v[3]
4

julia> v[1]
ERROR: StarWarsError: there is no episode 1 in order MacheteOrder
[...]

julia> m = StarWarsArray(reshape(collect(1:81), 9, 9), MacheteOrder)
8×8 view(::Array{Int64,2}, [3, 4, 1, 2, 5, 6, 7, 8], [3, 4, 1, 2, 5, 6, 7, 8]) with eltype Int64:
 21  30  3  12  39  48  57  66
 22  31  4  13  40  49  58  67
 19  28  1  10  37  46  55  64
 20  29  2  11  38  47  56  65
 23  32  5  14  41  50  59  68
 24  33  6  15  42  51  60  69
 25  34  7  16  43  52  61  70
 26  35  8  17  44  53  62  71

julia> m[5,4]
2

julia> m[2,9]
66

julia> m[1,6]
ERROR: StarWarsError: there is no episode 1 in MacheteOrder
[...]
```

## License

The `StarWarsArrays.jl` package is licensed under the MIT "Expat" License.  The
original author is Mosè Giordano.

## Disclaimer

Star Wars is the sole and exclusive property of Lucasfilm Limited.

`StarWarsArrays.jl` is in no way affiliated with or endorsed by Lucasfilm
Limited or any of its subsidiaries, employees, or
associates. `StarWarsArrays.jl` offers no suggestion that the work presented on
this web page is "official" or produced or sanctioned by the owner or any
licensees of the aforementioned trademark.
