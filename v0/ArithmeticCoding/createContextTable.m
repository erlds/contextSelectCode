function countContexts = createContextTable(A)

sizeA   = size(A);
[sy sx] = size(A);
Max_Num_Cont = 16;
countContexts = zeros(2^Max_Num_Cont,2);

for (y = 1:1:sy)
    for (x = 1:1:sx)
        currSymbol = char(A(y,x) + 48);
        contextNumber = get2DContext(A, sizeA, [y x], Max_Num_Cont);
        
        %Updates the context.
        if (currSymbol == '0')
            countContexts(contextNumber + 1,1) = countContexts(contextNumber + 1,1) + 1;
        else
            countContexts(contextNumber + 1,2) = countContexts(contextNumber + 1,2) + 1;
        end
        
    end
end