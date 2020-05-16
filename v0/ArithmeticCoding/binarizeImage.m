function A = binarizeImage(A)

%Binarize the image if is a colored one or have multiples tons of grey
if isa(A,'logical') == 0
    sA = size(A);
    if length(sA) == 3
        if sA(3) == 2
            A = A(:,:,1);
        else
            A = rgb2gray(A);
        end
    end
    A = imbinarize(A);
end
[sy,sx] = size(A);