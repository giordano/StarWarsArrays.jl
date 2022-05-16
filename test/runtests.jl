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
    v[4] = -42
    @test v[4] == -42

    m = StarWarsArray(reshape(collect(1:81), 9, 9), OriginalOrder)
    @test order(m) == OriginalOrder
    @test size(m) == size(parent(m))
    @test m[5] == 2
    @test m[3,4] == 6
    @test m[7,2] == 43
    @test m[4,4] == 1
    @test_throws BoundsError m[0, 12]
    m[4,4] = -42
    @test m[4] == -42
    m[1] = 0
    @test m[1,4] == 0
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
    v[4] = -42
    @test v[4] == -42
    @test axes(v) == ([3, 4, 1, 2, 5, 6, 7, 8],)

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

    @test sprint(showerror, StarWarsArrays.StarWarsError(1, MacheteOrder)) ==
        "StarWarsError: there is no episode 1 in MacheteOrder"
end
