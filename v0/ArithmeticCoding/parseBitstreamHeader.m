% Author: Eduardo Peixoto
% E-mail: eduardopeixoto@ieee.org
function [sy, sx, contextVector, bitstream] = parseBitstreamHeader(bitstream)

vsy = zeros(1,16,'logical');
vsx = zeros(1,16,'logical');
vContextVector = zeros(1,16,'logical');

for k = 1:1:16
    [bitstream, bit] = bitstream.read1Bit();
    vsy(k) = bit;
end

for k = 1:1:16
    [bitstream, bit] = bitstream.read1Bit();
    vsx(k) = bit;
end

for k = 1:1:16
    [bitstream, bit] = bitstream.read1Bit();
    vContextVector(k) = bit;
end

sy = sum([32768 16384 8192 4096 2048 1024 512 256 128 64 32 16 8 4 2 1] .* double(vsy));
sx = sum([32768 16384 8192 4096 2048 1024 512 256 128 64 32 16 8 4 2 1] .* double(vsx));
contextVector = double(vContextVector);
