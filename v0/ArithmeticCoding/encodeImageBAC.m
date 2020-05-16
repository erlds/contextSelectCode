% Author: Eduardo Peixoto
% E-mail: eduardopeixoto@ieee.org
function cabac = encodeImageBAC(A,cabac)

A = double(A);
padA = padarray(A,[3 3]);

maxValueContext = cabac.BACParams.maxValueContext;

currBACContext = getBACContext(false,maxValueContext/2,maxValueContext);

numberOfContexts = cabac.BACParams.numberOfContexts;
contextVector = cabac.BACParams.contextVector;

[sy, sx] = size(A);

for y = 1:1:sy
    for x = 1:1:sx
        currSymbol    = A(y,x);
        contextNumber = get2DContext_v2(padA, [y x], contextVector,numberOfContexts);
        
        %Gets the current count for this context.
        currCount = cabac.BACContexts_2D(contextNumber + 1,:);        
        
        %Gets the current BAC context for this context
        p1s = currCount(2) / (sum(currCount));
        
        if (p1s > 0.5)
            currBACContext.MPS = true;
            currBACContext.countMPS = floor(p1s * maxValueContext);
        else
            currBACContext.MPS = false;
            currBACContext.countMPS = floor((1 - p1s) * maxValueContext);
        end
        
        %Encodes the current symbol using the current context probability.
        cabac.BACEngine = encodeOneSymbolBAC(cabac.BACEngine,currBACContext,currSymbol);
        
        %Updates the context.
        if (currSymbol == false)
            cabac.BACContexts_2D(contextNumber + 1,1) = cabac.BACContexts_2D(contextNumber + 1,1) + 1;
        else
            cabac.BACContexts_2D(contextNumber + 1,2) = cabac.BACContexts_2D(contextNumber + 1,2) + 1;
        end
        
    end
end

cabac.BACEngine = closeBitstreamBAC(cabac.BACEngine);