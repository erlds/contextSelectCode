%Opens the input image.
A = imread('cameraman.tif');
A = binarizeImage(A);
numberOfContexts = 7;

%Encodes it with numberOfContexts contexts.
tStart = tic;
rbpp = encodeImage(A, numberOfContexts,'cameraman.bin');
timeEncoder = toc(tStart);

tStart = tic;
B = decodeImage('cameraman.bin');
timeDecoder = toc(tStart);

disp('Image :              cameraman.tif')
disp(['Number of contexts:  ' num2str(numberOfContexts) ''])
disp(['Rate :               ' num2str(rbpp,'%1.3f') ' bpp.'])
disp(['Time Encoder :       ' num2str(timeEncoder,'%1.3f') ' seconds.'])
disp(['Time Decoder :       ' num2str(timeDecoder,'%1.3f') ' seconds.'])
if (isequal(A,B))
    disp('Decoder :            Success.')
else
    disp('Decoder :            Failed.')
end

contextVector = generateContextVector(A);

%Encodes it with numberOfContexts contexts.
tStart = tic;
rbpp = encodeImage(A, contextVector,'cameraman2.bin');
timeEncoder = toc(tStart);

tStart = tic;
B = decodeImage('cameraman2.bin');
timeDecoder = toc(tStart);

disp('Image :              cameraman.tif')
disp(['Number of contexts:  ' num2str(contextVector) ''])
disp(['Rate :               ' num2str(rbpp,'%1.3f') ' bpp.'])
disp(['Time Encoder :       ' num2str(timeEncoder,'%1.3f') ' seconds.'])
disp(['Time Decoder :       ' num2str(timeDecoder,'%1.3f') ' seconds.'])
if (isequal(A,B))
    disp('Decoder :            Success.')
else
    disp('Decoder :            Failed.')
end
