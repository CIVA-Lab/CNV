%%%%% This program take the images from the stage train folder in CNV that
%%%%% have been prepared using Prepare_masks_MaskRCNN_CNV.m, this folder
%%%%% contains one image without the corresponding mask since it is for testing and also the mask is not available for all images, however, in this case
%%%%% we will prepare a folder that form a mosic for mask rcnn testing.
%%%%% Output: folders have mosiic images for testing
clear all;

opath='.\stage_test_big\';
outputpath='.\stage_test\';

mosic=zeros(600,800,3);

if (~isdir(outputpath))
  mkdir(outputpath)
end
%% the mosaic image will have 16 cornea images (4*4) 
folders = dir(opath);
W=40*5;H=30*5;
r=600;c=800;
i=1;j=1;
m=1;ri=0;rc=0;%maskco=1;
for i_i = 1:numel(folders)
inputf = strcat(opath,filesep,folders(i_i).name);    
inputfolder =strcat(inputf,filesep);    

if folders(i_i).isdir && ~strcmp(folders(i_i).name,'.') && ~strcmp(folders(i_i).name,'..')
    
folders2=dir(strcat(folders(i_i).folder,filesep, folders(i_i).name,filesep));

for j_j=1:3%numel(folders2)

%bigmask=zeros(600,800,1);

if folders2(j_j).isdir && ~strcmp(folders2(j_j).name,'.') && ~strcmp(folders2(j_j).name,'..')
    
ImgPath=strcat(folders2(j_j).folder,filesep,folders2(j_j).name,filesep);
Imglist = dir(fullfile(ImgPath,'*.png'));


img=imread(strcat(ImgPath,Imglist(1).name));
im=imresize(img,[H W]);

% mask=imread(strcat(strcat(folders2(j_j+1).folder,filesep,folders2(j_j+1).name,filesep),Imglist(1).name));
% mask=imresize(mask,[H W]);

Imgname = Imglist(1).name(1:end-4);
outputpath1=strcat(outputpath,'image',int2str(m),'.png');

if size(im,3)==1
   im1=im;
   im(:,:,1)=im1;
   im(:,:,2)=im1;
   im(:,:,3)=im1;
end   

mosic(i:H+rc,j:W+ri,1)=im(:,:,1);
mosic(i:H+rc,j:W+ri,2)=im(:,:,2);
mosic(i:H+rc,j:W+ri,3)=im(:,:,3);

% 
% if j==801 && i~=451   %% when it finish one row
%     i=i+H;
%     j=1;ri=0;rc=rc+H;
% elseif (j==801 && i==451) || (i_i==697 ) %% This second condition is for the last mosaic image as it isn't full
%     
%     if (~isdir(outputpath1))
%     mkdir(outputpath1(1:end-4))
%     end
     outputpath1_im=strcat(outputpath,folders(i_i).name,filesep,'images');
    if (~isdir(outputpath1_im))
    mkdir(outputpath1_im)
    end
%     imwrite(uint8(mosic),strcat(outputpath1_im,filesep,'image',int2str(m),'.png'));
%     m=m+1;%maskco=1;  % m for number of mosiic images, maskco is counter for the numver of masks corresponding to the mosiic image
%     r=600;c=800;
%     i=1;j=1;
%     ri=0;rc=0;mosic=zeros(600,800,3);
% %     if j_j==numel(folders2)
% %        m=1;mosic=zeros(600,800,3);
% %     end
% end
 imwrite(uint8(mosic),strcat(outputpath1_im,filesep,filesep,folders(i_i).name,'.png'));
end
end
end
end

