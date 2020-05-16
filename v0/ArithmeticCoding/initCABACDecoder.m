% Author: Eduardo Peixoto
% E-mail: eduardopeixoto@ieee.org
function cabac = initCABACDecoder(cabac, BACParams)
    
%Gets the parameters.
cabac.BACParams = BACParams;

%Initializes the engine
cabac.BACEngineDecoder = getBACDecoder(BACParams.m);

%Initializes 2D contexts
cabac.BACContexts_2D = initCounts(BACParams.numberOfContexts);
