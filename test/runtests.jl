using StarWarsArrays
using Test

@testset "StarWarsArrays.jl" begin
    v = StarWarsArray(collect(1:9))
    @test size(v) == size(parent(v))
    @test v[5] == 2
    @test v[3] == 6
    @test v[7] == 7
    @test_throws BoundsError v[0]
    v[4] = -42
    @test v[4] == -42

    m = StarWarsArray(reshape(collect(1:81), 9, 9))
    @test size(m) == size(parent(m))
    @test m[5] == 2
    @test m[3,4] == 6
    @test m[7,2] == 43
    @test m[4,4] == 1
    @test_throws BoundsError m[0, 12]
    m[4,4] = -42
    @test m[4] == -42
end
