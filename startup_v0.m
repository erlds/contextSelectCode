%Putting the source folder in the matlab path.

clc;
version = 'v0';
disp(['Initializing Image Coder code version ' version ''])

home = pwd;
src = [home '\' version];
disp(['Adding ' src ' to the Matlab Path'])
addpath(src);

src = [home '\' version '\ArithmeticCoding'];
disp(['Adding ' src ' to the Matlab Path'])
addpath(src);

clear home;
clear src;

cd(version);