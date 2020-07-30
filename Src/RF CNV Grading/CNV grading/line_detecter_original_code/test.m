function test
image_path_training='./test_images/';
image_path_for_writing='./results/';
flist=dir(fullfile(image_path_training,'*.png'));
n=length(flist);

for i=1:n
    
img=imread(fullfile(image_path_training,flist(i).name));
mask=ones(600,800);

W = 15;
step = 2;
segmentedimg = im_seg(img,mask,W,step);

image_name_to_write=strcat(image_path_for_writing,flist(i).name);
imwrite(segmentedimg,image_name_to_write);
end
end