# StarWarsArrays.jl

[![Build Status](https://travis-ci.com/giordano/StarWarsArrays.jl.svg?branch=master)](https://travis-ci.com/giordano/StarWarsArrays.jl)
[![Build Status](https://ci.appveyor.com/api/projects/status/github/giordano/StarWarsArrays.jl?svg=true)](https://ci.appveyor.com/project/giordano/StarWarsArrays-jl)
[![Codecov](https://codecov.io/gh/giordano/StarWarsArrays.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/giordano/StarWarsArrays.jl)
[![Coveralls](https://coveralls.io/repos/github/giordano/StarWarsArrays.jl/badge.svg?branch=master)](https://coveralls.io/github/giordano/StarWarsArrays.jl?branch=master)

## Introduction

`StarWarsArrays.jl` is a [Julia](https://julialang.org/) package to provide
arrays indexed as the order of the Star Wars movies.  Thus, index 4 points to
the first element of the parent array, index 2 points to its fifth element, and
index 9 points to the nineth element.

This package is inspired by the Reddit thread ["Oof level of an array,
nice."](https://www.reddit.com/r/ProgrammerHumor/comments/clna6k/oof_level_of_an_array_nice/).

## Installation

The latest version of `StarWarsArrays.jl` is available for Julia v1.0 and
later releases, and can be installed with [Julia built-in package
manager](https://julialang.github.io/Pkg.jl/stable/).  In a Julia session, after
entering the package manager mode with `]`, run the command

```julia
pkg> add https://github.com/giordano/StarWarsArrays
```

## Usage

```julia
julia> using StarWarsArrays

julia> v = StarWarsArray(collect(1:9))
9-element StarWarsArray{Int64,1,Array{Int64,1}}:
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
9-element StarWarsArray{Int64,1,Array{Int64,1}}:
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
9×9 StarWarsArray{Int64,2,Array{Int64,2}}:
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
9×9 StarWarsArray{Int64,2,Array{Int64,2}}:
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
