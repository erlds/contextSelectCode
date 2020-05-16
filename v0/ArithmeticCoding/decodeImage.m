function B = decodeImage(filenameIn)

bitstream = Bitstream(0);
bitstream = bitstream.loadBitstream(filenameIn);

%Parse the bitstream header
[sy, sx, contextVector, bitstream] = parseBitstreamHeader(bitstream);

%Initialize BAC Params
BACParams = getBACParams(contextVector);

%Initializes the cabac.
cabac = getCABAC();
cabac = initCABACDecoder(cabac, BACParams);

bitstream                        = bitstream.cutBitstream(bitstream.lengthBitstream - bitstream.p);
cabac.BACEngineDecoder.bitstream = bitstream;

B = zeros(sy,sx,'logical');

[B,cabac] = decodeImageBAC(B, cabac);
