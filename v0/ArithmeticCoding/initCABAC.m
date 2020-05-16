% Author: Eduardo Peixoto
% E-mail: eduardopeixoto@ieee.org
function cabac = initCABAC(cabac, BACParams)
    
%Gets the parameters.
cabac.BACParams = BACParams;

%Initializes the engine
cabac.BACEngine = getBACEncoder(BACParams.m);

%Initializes 2D contexts
cabac.BACContexts_2D = initCounts(BACParams.numberOfContexts);

