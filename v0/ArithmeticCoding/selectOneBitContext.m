function [currContextVector, best_H] = selectOneBitContext(currContextVector,countContexts,pos_bin_ind,best_H)

idx = find(currContextVector == 0);


currBestContext = 0;
for (j = 1:1:length(idx))
    candidate_ContextVector = currContextVector;
    candidate_ContextVector(idx(j)) = 1;
    
    Curr_HByContext = calcHContextsBits(countContexts,candidate_ContextVector,pos_bin_ind);
    
    if (Curr_HByContext < best_H)
        best_H = Curr_HByContext;
        currBestContext = idx(j);
    end
end
currContextVector(currBestContext) = 1;
