%% Import Images
img2 = imread('bright.jpg');

%% Convert to Grey/Binary
img2gray = rgb2gray(img2);

%% Remove noise 
nonoise = medfilt2(img2gray);
imshow(nonoise)

%% Crop image
cropped = imcrop(nonoise, [135 61 361 356]);

%% Threshold image
imgThresh2 = cropped > 100;
imshow(imgThresh2);

%% Fill in images and clean up noise
imgFilled = bwareaopen(imgThresh2, 10);
imshow(imgFilled);

%% Overlay images
imgBoth = imoverlay(cropped, imgFilled, [1 0 0]);
imshow(imgBoth);