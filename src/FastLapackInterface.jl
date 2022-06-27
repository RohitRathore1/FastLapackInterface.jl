module FastLapackInterface

import Base.strides

using Base: require_one_based_indexing
using LinearAlgebra
using LinearAlgebra: BlasInt, BlasFloat, checksquare, chkstride1
using LinearAlgebra.BLAS: @blasfunc
using LinearAlgebra.LAPACK: chklapackerror, chkargsok, chkstride1, chktrans, chkside
using LinearAlgebra.LAPACK

@static if VERSION < v"1.7"
    using LinearAlgebra.LAPACK: liblapack
else
    const liblapack = "libblastrampoline"
end

include("lu.jl")
export LUWs
include("qr.jl")
export QRWs, QRWYWs, QRpWs
include("schur.jl")
export SchurWs, GeneralizedSchurWs
end #module
#import LinearAlgebra: USE_BLAS64, LAPACKException