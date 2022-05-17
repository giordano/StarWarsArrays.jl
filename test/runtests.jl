using StarWarsArrays
using Test

import StarWarsArrays: StarWarsError, order

@testset "OriginalOrder" begin
    v = StarWarsArray(collect(1:9))
    @test order(v) == OriginalOrder
    @test size(v) == size(parent(v))
    @test v[5] == 2
    @test v[3] == 6
    @test v[7] == 7
    @test_throws BoundsError v[0]
    @test join(split(repr("text/plain", v), '\n')[begin+1:end], '\n') ==
        " 4\n 5\n 6\n 1\n 2\n 3\n 7\n 8\n 9"
    v[4] = -42
    @test v[4] == -42
    @test axes(v) == ([4, 5, 6, 1, 2, 3, 7, 8, 9],)
    @test eachindex(v) == [4, 5, 6, 1, 2, 3, 7, 8, 9]
    @test length(v) == 9
    @test size(v) == (9,)
    for (idx, x) in enumerate(v)
        # Explanation: iterating over `v` should be equivalent to iterating over its parent,
        # because the iteration protocol should follow the order 4, 5, 6, 1, 2, 3, ...
        @test x == parent(v)[idx]
    end

    m = StarWarsArray(reshape(collect(1:81), 9, 9), OriginalOrder)
    @test order(m) == OriginalOrder
    @test size(m) == size(parent(m))
    @test m[5] == 2
    @test m[3,4] == 6
    @test m[7,2] == 43
    @test m[4,4] == 1
    @test_throws BoundsError m[0, 12]
    @test join(split(repr("text/plain", m), '\n')[begin+1:begin+3], '\n') ==
        " 31  40  49  4  13  22  58  67  76\n 32  41  50  5  14  23  59  68  77\n 33  42  51  6  15  24  60  69  78"
    m[4,4] = -42
    @test m[4] == -42
    m[1] = 0
    @test m[1,4] == 0
    @test axes(m) == ([4, 5, 6, 1, 2, 3, 7, 8, 9], [4, 5, 6, 1, 2, 3, 7, 8, 9])
    @test length(m) == 81
    @test size(m) == (9, 9)
    for (idx, x) in enumerate(m)
        @test x == parent(m)[idx]
    end

    @test_throws ArgumentError StarWarsArray(rand(2), OriginalOrder)
    @test_throws ArgumentError StarWarsArray(rand(8, 2), OriginalOrder)
end

@testset "MacheteOrder" begin
    v = StarWarsArray(collect(1:9), MacheteOrder)
    @test order(v) == MacheteOrder
    @test size(v) == (8,)
    @test v[5] == 2
    @test v[3] == 4
    @test v[6] == 5
    @test v[7] == 6
    @test_throws StarWarsError v[1]
    @test_throws BoundsError v[0]
    @test join(split(repr("text/plain", v), '\n')[begin+1:end], '\n') ==
        " 3\n 4\n 1\n 2\n 5\n 6\n 7\n 8"
    v[4] = -42
    @test v[4] == -42
    @test axes(v) == ([3, 4, 1, 2, 5, 6, 7, 8],)
    @test eachindex(v) == [3, 4, 1, 2, 5, 6, 7, 8]
    @test length(v) == 8
    @test size(v) == (8,)
    for (idx, x) in enumerate(v)
        @test x == parent(v)[idx]
    end

    m = StarWarsArray(reshape(collect(1:81), 9, 9), MacheteOrder)
    @test order(m) == MacheteOrder
    @test size(m) == (8, 8)
    @test m[5] == 2
    @test m[3,4] == 4
    @test m[7,2] == 24
    @test m[4,4] == 1
    @test m[9,4] == 8
    @test_throws BoundsError m[0, 12]
    @test_throws BoundsError m[82]
    @test_throws StarWarsError m[1]
    @test_throws StarWarsError m[3, 1]
    rpr = split(repr("text/plain", m), '\n')
    @test rpr[2] == " 21  30  3  12  39  48  57  66"
    @test rpr[6] == " 23  32  5  14  41  50  59  68"
    m[4,4] = -42
    @test m[4] == -42
    m[2] = 0
    @test m[2,4] == 0
    @test axes(m) == ([3, 4, 1, 2, 5, 6, 7, 8], [3, 4, 1, 2, 5, 6, 7, 8])
    @test length(m) == 64
    @test size(m) == (8, 8)
    for (idx, x) in enumerate(m)
        @test x == parent(m)[idx]
    end

    @test_throws ArgumentError StarWarsArray(rand(4), MacheteOrder)
    @test_throws ArgumentError StarWarsArray(rand(6, 2, 9), MacheteOrder)

    @test sprint(showerror, StarWarsArrays.StarWarsError(1, MacheteOrder)) ==
        "StarWarsError: there is no episode 1 in MacheteOrder"
end
