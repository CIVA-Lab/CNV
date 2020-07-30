# Cornea Detection and CNV Grading
This work proposes a robust automated approach to grade Cornea NeoVascularization (CNV) disease based on in-growth vessels. The figure describes the whole automated process. The intuition behind our work is to predict the grade of the corresponding cornea using vessel specific features and a regression network. The first part of our algorithm is to separate the cornea region from other parts of the mice image. While the second part is to learn a regression network how to predict a class or a grade of the disease. For the first part, we utilize Mask R-CNN, the state of the art deep learning network in biomedical segmentation, to detect the cornea region. A set of mice images have been selected and annotated to train the Mask R-CNN. As a result, a binary mask is produced, the white region represents the cornea and the black region represents the background that cover all other parts such as eyelid and lashes. Eliminating cornea's outside region, decreases the errors that can affected by texture and color of those parts and produces more robust classifier. However, mask R-CNN binary mask result is not always a proper circle. For this reason, we fitted a circle on our binary mask result to produce an optimal circular mask. The raw image is masked out using the circular binary mask to produce the extracted cornea region. A set of vessel specific features have been generated based on multiscale Hessian eigenvalues, intensity, oriented second derivatives, and multiscale line detector responses along with a random forest classifier. Random forest algorithm is a supervised statistical classifier that needs to be trained first using a set of cornea images with corresponding grades. The images are divided to 5 grades: No CNV Naive (0), No CNV (1), Mild CNV (2), Moderate CNV (3), and Severe CNV (4). We trained a regression network to learn random forest how to grade images based on the generated features. As a result, we utilize the trained random forest regression model to produce the grades of our testing data. The testing data are a set of images that have been kept aside to assess the quality of our automated learning.

# How to use CNV

There are Three main folders in our repository:

**Src:** contains the algorithm scripts.
**Data:** contains input images.
**Output:** contains results, intermediate results and some mat files that are needed by our algorithm. 


There are two parts for this software in ```Src``` folder, you can skip Part 1 (Cornea Detection) if you already have your cornea extracted in 400x400 image size dimention. 

**Part 1 -->** Cornea Detection: Extract the cornea from mice raw images using Mask R-CNN

**Part 2 -->** RF CNV Grading: Run the classifier to grade the CNV disease.

In both parts, there are readme file that describes the needed steps. The description is also placed here


## Part 1 : Cornea detection 

To get cornea detection

1. Put your raw images in a folder called input, the images should be placed as this example:

``` input\Extreme\ET_101_Day 21_04.16.2015\image1.png```

2. Run ```Main_cornea_data_preparation.m```

This script will prepare your input for Mask R-CNN detection.

3. Setup Mask R-CNN using this website: [Mask_RCNN](https://github.com/matterport/Mask_RCNN)

Put the ```mosaic_cornea_weights``` in log folder, and put your ```Output\stage_test``` folder in the same folder with the nucleus example and run ```nucleus.py``` 

4. Take the detection masks and place them in 

```Output/Output_from_MaskRCNN_masks```

To treat the results generated from mask R-CNN by fitting a circle on mask R-CNN results, you should run 5, and the results will be ready in ```Output/Classify_me_circles``` folder for RF CNV Grading

5.```fit_circles_to_maskrcnn_masks_results.m```
 
This script uses [Pratt method](https://www.mathworks.com/matlabcentral/fileexchange/22643-circle-fit-pratt-method) to fit the cicle


## Part 2 : RF CNV Grading

1. Put your output from Cornea detection which is located in Output\Classify_me_circles in a folder called images as this example:

``` Output\images\test\ET_101_Day 21_04.16.2015\ET_101_Day 21_04.16.2015_Image1_Ex ```

If you already have your cornea images extracted, you can directly put them inside the folder and run 2

2. Run ```Grade_cornea_run_me.m```

### Project Collaborators and Contact

**Author:** Yasmin M. Kassim

Copyright &copy; 2020. Yasmin Kassim and Prof. K. Palaniappan and Curators of the University of Missouri, a public corporation. All Rights Reserved.

**Created by:** Ph.D. student: Yasmin Kassim  
Department of Electrical Engineering and Computer Science,  
University of Missouri-Columbia  

For more information, contact:

* **Yasmin Kassim**  
226 Engineering Building West  
University of Missouri-Columbia  
Columbia, MO 65211  
ymkgz8@mail.missouri.edu  


* **Prof. K. Palaniappan**  
29 Engineering Building West  
University of Missouri-Columbia  
Columbia, MO 65211  
palaniappank@missouri.edu  

### Collaborators: 
* Dr. Suneel Gupta - University of Missouri Veterinary Health Center
* Dr. Shyam Chaurasia - University of Missouri Veterinary Health Center
* Dr. Rajiv R. Mohan - University of Missouri Veterinary Health Center
