%Contexts
%          14
%    11  9  6 10 12
% 15  7  4  2  3  8 16
% 13  5  1  ?

function contextNumber = get2DContext(A, sizeA, pixel, numberOfContexts)

y = pixel(1);
x = pixel(2);
sx = sizeA(2);
%A = double(A);

%Initialize all contexts as zeros.
%c = zeros(1,16);
c = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];

%Makes the most important checks.
xht3 = x > 3;
xltsx2 = x < (sx - 2);
yht3 = y > 3;



if (xht3 && xltsx2 && yht3)
    %All contexts exist! Just go get them.
    c(1) = A(y     , x - 1);
    c(2)  = A(y - 1, x    );
    c(3)  = A(y - 1, x + 1);
    c(4)  = A(y - 1, x - 1);
    c(5)  = A(y    , x - 2);
    c(6)  = A(y - 2, x    );
    c(7)  = A(y - 1, x - 2);
    c(8)  = A(y - 1, x + 2);
    c(9)  = A(y - 2, x - 1);
    c(10) = A(y - 2, x + 1);
    c(11) = A(y - 2, x - 2);
    c(12) = A(y - 2, x + 2);
    c(13) = A(y    , x - 3);
    c(14) = A(y - 3, x    );
    c(15) = A(y - 1, x - 3);
    c(16) = A(y - 1, x + 3);    
else
    %Makes all the checks I need.
    xht1 = x > 1;
    xht2 = x > 2;
    
    xltsx = x < sx;
    xltsx1 = x < (sx - 1);
        
    yht1 = y > 1;
    yht2 = y > 2;
        
    %Checks context's existence and gets it.
    %Checks context 1
    if (xht1)
        c(1) = A(y     , x - 1);
    end
    
    %Checks context 2
    if (yht1)
        c(2)  = A(y - 1, x    );
    end
    
    %Checks context 3
    if((yht1) && (xltsx))
        c(3)  = A(y - 1, x + 1);
    end
    
    %Checks context 4
    if ((yht1) && (xht1))
        c(4)  = A(y - 1, x - 1);
    end
    
    %Checks context 5
    if (xht2)
        c(5)  = A(y    , x - 2);
    end
    
    %Checks context 6
    if (yht2)
        c(6)  = A(y - 2, x    );
    end
    
    %Checks context 7
    if ((yht1) && (xht2))
        c(7)  = A(y - 1, x - 2);
    end
    
    %Checks context 8
    if ((yht1) && (xltsx1))
        c(8)  = A(y - 1, x + 2);
    end
    
    %Checks context 9
    if ((yht2) && (xht1))
        c(9)  = A(y - 2, x - 1);
    end
    
    %Checks context 10
    if ((yht2) && (xltsx))
        c(10) = A(y - 2, x + 1);
    end
    
    %Checks context 11
    if ((yht2) && (xht2))
        c(11) = A(y - 2, x - 2);
    end
    
    %Checks context 12
    if ((yht2) && (xltsx1))
        c(12) = A(y - 2, x + 2);
    end
    
    %Checks context 13
    if (xht3)
        c(13) = A(y    , x - 3);
    end
    
    %Checks context 14
    if (yht3)
        c(14) = A(y - 3, x    );
    end
    
    %Checks context 15
    if ((yht1) && (xht3))
        c(15) = A(y - 1, x - 3);
    end
    
    %Checks context 16
    if ((yht1) && (xltsx2))
        c(16) = A(y - 1, x + 3);
    end    
end




p2 = [1 2 4 8 16 32 64 128 256 512 1024 2048 4096 8192 16384 32768];
p2c = p2 .* c;

contextNumber = sum(p2c(1:numberOfContexts));
%context       = c(1:numberOfContexts);













    