function H = calcHContextsBits(countContexts,contextVector,pos_bin_ind)

contextVector = flip(contextVector);
numberOfContexts = sum(contextVector);
final_count = zeros(2^numberOfContexts,2);

idx = find(contextVector == 1);
pos_sel = bin2dec(pos_bin_ind(:,idx));

if numberOfContexts == 16
    final_count = countContexts;
else
    for k = 1:2^numberOfContexts
        parcial_ind_sel = find(pos_sel == (k-1));
        final_count(k,:) = sum(countContexts(parcial_ind_sel,:));
    end
end

countByContext = sum(final_count,2);
pByContext = countByContext / sum(countByContext);

HByContext = zeros(size(countByContext));
for (k = 1:1:length(HByContext))
    if (countByContext(k) > 0)
        currP = final_count(k,:) / countByContext(k);
        if ((currP(1) ~= 0) && (currP(2) ~= 0))
            HByContext(k) = sum(- currP .* log2(currP));
        end
    end
end

H = sum(pByContext .* HByContext);