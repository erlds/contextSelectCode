%Verify if it´s ok to stop the entropy loop

function [ok, curr_dif] = verifyStopConditions(best_H,old_H,curr_dif)

    previous_dif = curr_dif;
    curr_dif = abs(best_H-old_H)/old_H;
    
    if (previous_dif < curr_dif || abs(best_H-old_H)<0.0001)
        ok = 0;
    else
        ok = 1;
    end

end
