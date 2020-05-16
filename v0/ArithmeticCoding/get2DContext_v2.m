%Contexts
%          14
%    11  9  6 10 12
% 15  7  4  2  3  8 16
% 13  5  1  ?

function contextNumber = get2DContext_v2(A, pixel, contextVector, numberOfContexts)

y = pixel(1) + 3;
x = pixel(2) + 3;

%Initialize all contexts as zeros.
%c = zeros(1,16);
c = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];

c(1)  = A(y     , x - 1);
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


idx = find(contextVector == 1);

c2 =c(idx);




p = [1 2 4 8 16 32 64 128 256 512 1024 2048 4096 8192 16384 32768];
p2 = p(1:numberOfContexts);

p2c = p2 .* c2;

contextNumber = sum(p2c);
%context       = c(1:numberOfContexts);













    