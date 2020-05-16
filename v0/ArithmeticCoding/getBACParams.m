% Author: Eduardo Peixoto
% E-mail: eduardopeixoto@ieee.org
function bac_params = getBACParams(contextVector)

numberOfContexts = sum(contextVector);

bac_params = struct('m',16,...
                    'maxValueContext',4096,...
                    'numberOfContexts',numberOfContexts,...
                    'contextVector',contextVector);
                   