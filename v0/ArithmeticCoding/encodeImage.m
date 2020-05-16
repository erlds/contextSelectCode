function rateBPP = encodeImage(A,p, filenameOut) 

if (nargin == 2)
    filenameOut = [];
end

if (isscalar(p))
    contextVector = zeros(1,16);
    contextVector(1:p) = 1;
else
    sp = size(p);
    if (isequal(sp,[1 16]))
        contextVector = p;
    elseif (isequal(sp,[16 1]))
        contextVector = p';
    else
        error('The context vector must be a column or row vector with 16 elements');
    end        
end


[sy sx] = size(A);
nPixels = sy * sx;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Initialize BAC Params
BACParams = getBACParams(contextVector);

%Create and initializes a cabac here.
cabac = getCABAC();
cabac = initCABAC(cabac, BACParams);

%Encode the image with the arithmetic coder
cabac = encodeImageBAC(A,cabac);

%Gets the bitstream header.
bitstream = createBitstreamHeader(sy, sx, contextVector);

%Merges all bitstreams.
bitstream = bitstream.merge(cabac.BACEngine.bitstream);

if (isempty(filenameOut) == 0)
    bitstream.flushesToFile(filenameOut);
end

rateBPP = (bitstream.size() + 8) / nPixels;
