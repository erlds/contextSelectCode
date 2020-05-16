% BAC - Binary Arithmetic Coding
% Definitions
% m: Number of bits used in the internal engine. Default: 12 bits
% All internal calculations are performed using uint32 variables.
% The bitstream will be in char
%
% Eduardo Peixoto
% E-mail: eduardopeixoto@ieee.org
% 31/01/2019
function a = getBACEncoder(m)

if (nargin == 0)
    m = 12;
end

MSBMask = uint32(2^(m-1));

a = struct('m',m, ...
           'MSBMask',MSBMask, ...
           'ln',uint32(0),...
           'un',uint32((2^m) - 1),...
           'bitstream',Bitstream());