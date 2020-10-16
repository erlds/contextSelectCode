%Opens the input image.
imDir = [pwd '\..\Used_Images\'];
imName = 'watch.png';

reconstructedImage = [imName(1:end-4) '_reconstructed.png'];
outputFile = [imName(1:end-4) '_binary.bin'];

img = imread([imDir imName]);

% If the image is already binary, comment the next line
img = binarizeImage(img);

%Generates the contextVector
contextVector = generateContextVector(img);

%Encodes it with contextVector.
rbpp = encodeImage(img, contextVector,outputFile);

%Decodes the bin file
img_dec = decodeImage(outputFile,reconstructedImage);

disp(['Image :              ' imName(1:end-4)])
disp(['Number of contexts:  ' num2str(contextVector) ''])
disp(['Rate :               ' num2str(rbpp,'%1.3f') ' bpp.'])

if (isequal(img,img_dec))
    disp('Decoder :            Success.')
else
    disp('Decoder :            Failed.')
end