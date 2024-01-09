
% Data collection

clc;clear;
addpath('./data');
for c = 1:53
    load(['sub',num2str(c),'.mat']);
    data{c}.AIF = aif;
    data{c}.mask = mask;
    data{c}.S0 = S0;
    data{c}.smap = smap;
end

%% Generate DRO

option = [];
[simImg,mask,parMap,smap,S0] = gen_DRO(data,option);

close all;
figure(100)
for i = 1:size(simImg,3)
    imshow(simImg(:,:,i),[0,max(simImg(:))],'InitialMagnification',1600);
    frame = getframe(100);
    img = frame2im(frame);
    [imind cm] = rgb2ind(img,256);
end

%% Display masks

disp_mask(mask,S0,1);

%% Radial k-space data generation

spokes_per_frame = 13;
n_lvl = 0.05;
kdata = gen_kspace_data(simImg,smap,spokes_per_frame,n_lvl);




