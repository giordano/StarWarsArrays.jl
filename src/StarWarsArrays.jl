module StarWarsArrays

export StarWarsArray

struct StarWarsArray{T,N,P<:AbstractArray} <: AbstractArray{T,N}
    parent::P
end
StarWarsArray(p::P) where {T,N,P<:AbstractArray{T,N}} =
    StarWarsArray{T,N,P}(p)

function index(i::Int)
    if 4 <= i <= 6
        return i - 3
    elseif 1 <= i <= 3
        return i + 3
    else
        return i
    end
end

Base.parent(A::StarWarsArray) = A.parent
Base.size(A::StarWarsArray) = size(parent(A))
Base.getindex(A::StarWarsArray, i::Int) = getindex(parent(A), index(i))
Base.getindex(A::StarWarsArray{T,N}, i::Vararg{Int,N}) where {T,N} =
    getindex(parent(A), index.(i)...)
Base.setindex!(A::StarWarsArray, v, i::Int) = setindex!(parent(A), v, index(i))
Base.setindex!(A::StarWarsArray{T,N}, v, i::Vararg{Int,N}) where {T,N} =
    setindex!(parent(A), v, index.(i)...)

end # module
