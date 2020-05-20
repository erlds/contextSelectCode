%Opens the input image.
im_dir = 'C:\Users\evari\Desktop\Mestrado_PPGEE\contextSelectAlgorithm\Used_Images\';
im_name = 'goldhill.png';
A = imread([im_dir im_name]);
A = binarizeImage(A);
numberOfContexts = 7;

%Encodes it with numberOfContexts contexts.
tStart = tic;
rbpp = encodeImage(A, numberOfContexts,[im_name(1:end-4) '.bin']);
timeEncoder = toc(tStart);

tStart = tic;
B = decodeImage([im_name(1:end-4) '.bin']);
timeDecoder = toc(tStart);

disp(['Image :              ' im_name(1:end-4)])
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
rbpp = encodeImage(A, contextVector,[im_name(1:end-4) '2.bin']);
timeEncoder = toc(tStart);

tStart = tic;
B = decodeImage([im_name(1:end-4) '2.bin']);
timeDecoder = toc(tStart);

disp(['Image :              ' im_name(1:end-4)])
disp(['Number of contexts:  ' num2str(contextVector) ''])
disp(['Rate :               ' num2str(rbpp,'%1.3f') ' bpp.'])
disp(['Time Encoder :       ' num2str(timeEncoder,'%1.3f') ' seconds.'])
disp(['Time Decoder :       ' num2str(timeDecoder,'%1.3f') ' seconds.'])
if (isequal(A,B))
    disp('Decoder :            Success.')
else
    disp('Decoder :            Failed.')
end
