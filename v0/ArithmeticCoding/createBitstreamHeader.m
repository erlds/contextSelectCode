%function bitstream_header = createBitstreamHeader(sy, sx, contextVector)
%
% The header uses:
%  16 bits for the image witdth
%  16 bits for the image height
%  16 bits for the contextVector
%
% Author: Eduardo Peixoto
% E-mail: eduardopeixoto@ieee.org
function bitstream_header = createBitstreamHeader(sy, sx, contextVector)

bitstream_header = Bitstream(48);

vsy = (bitand(uint16(sy),uint16([32768 16384 8192 4096 2048 1024 512 256 128 64 32 16 8 4 2 1])) ~= 0);
vsx = (bitand(uint16(sx),uint16([32768 16384 8192 4096 2048 1024 512 256 128 64 32 16 8 4 2 1])) ~= 0);
contextVector = logical(contextVector);

for (i = 1:1:16)
    bitstream_header = bitstream_header.putBit(vsy(i));
end

for (i = 1:1:16)
    bitstream_header = bitstream_header.putBit(vsx(i));
end

for (i = 1:1:16)
    bitstream_header = bitstream_header.putBit(contextVector(i));
end
