# Cornea Detection and CNV Grading
This work proposes a robust automated approach to grade Cornea NeoVascularization (CNV) disease based on in-growth vessels. The figure describes the whole automated process. The intuition behind our work is to predict the grade of the corresponding cornea using vessel specific features and a regression network. The first part of our algorithm is to separate the cornea region from other parts of the mice image. While the second part is to learn a regression network how to predict a class or a grade of the disease. For the first part, we utilize Mask R-CNN, the state of the art deep learning network in biomedical segmentation, to detect the cornea region. A set of mice images have been selected and annotated to train the Mask R-CNN. As a result, a binary mask is produced, the white region represents the cornea and the black region represents the background that cover all other parts such as eyelid and lashes. Eliminating cornea's outside region, decreases the errors that can affected by texture and color of those parts and produces more robust classifier. However, mask R-CNN binary mask result is not always a proper circle. For this reason, we fitted a circle on our binary mask result to produce an optimal circular mask. The raw image is masked out using the circular binary mask to produce the extracted cornea region. A set of vessel specific features have been generated based on multiscale Hessian eigenvalues, intensity, oriented second derivatives, and multiscale line detector responses along with a random forest classifier. Random forest algorithm is a supervised statistical classifier that needs to be trained first using a set of cornea images with corresponding grades. The images are divided to 5 grades: No CNV Naive (0), No CNV (1), Mild CNV (2), Moderate CNV (3), and Severe CNV (4). We trained a regression network to learn random forest how to grade images based on the generated features. As a result, we utilize the trained random forest regression model to produce the grades of our testing data. The testing data are a set of images that have been kept aside to assess the quality of our automated learning.

![](/figures/pipeline.png)

# How to use CNV

There are three main folders in our `DeepCNVDELTA` repository:

`src:` contains the algorithm scripts

`data:` contains input images

`output:` contains results, intermediate results and some `*.mat` files that are needed by our algorithm 


There are two parts in the `DeepCNVDELTA` software pipeline, and the source MATLAB files are in the `src` folder.

**Part 1** &#8594; Cornea Segmentation: Extract the cornea from mice raw images using Mask R-CNN

**Part 2** &#8594; RF CNV Grading: Run the classifier to grade the CNV disease.

Part 1 which does cornea segmentation can be skipped if you already have the cornea images extracted and resized to ```400x400``` pixels. 

In each part, there is a `README.md` file that describes the processing modules.


## [Part 1 : Cornea detection](./src/cornea_detection/README.md)

To get cornea detection

1. Put your raw images in a folder called input, the images should be placed as this example:

``` input\Extreme\ET_101_Day_21\image1.png```

2. Run ```main_cornea_data_preparation.m```

This script will prepare your input for Mask R-CNN detection.

3. Setup Mask R-CNN using this website: [Mask_RCNN](https://github.com/matterport/Mask_RCNN)

Put the ```mosaic_cornea_weights``` in log folder, and put your ```\stage_test``` folder in the same folder with the nucleus example and run ```nucleus.py``` 

4. Take the detection masks and place them in 

```output\Output_from_MaskRCNN_masks```

To treat the results generated from mask R-CNN by fitting a circle on mask R-CNN results, you should run 5, and the results will be ready in ```output\Classify_me_circles``` folder for RF CNV Grading

5.```fit_circles_to_maskrcnn_masks_results.m```
 
This script uses [Pratt method](https://www.mathworks.com/matlabcentral/fileexchange/22643-circle-fit-pratt-method) to fit the cicle


## Part 2 : RF CNV Grading

1. Move the output from cornea segmentation which will be located in folder ```output\Classify_me_circles``` to a new folder as shown in the example:

``` output\images\test\ET_101_Day_21\ET_101_Day_21_Image1_Ex ```

If you already have cornea segmentations done and placed in the expected folders, then you can run ``Step 2``:

2. Run ```Grade_cornea_run_me.m```

### Project Collaborators and Contact

**Author:** Yasmin M. Kassim, Suneel Gupta, Rajiv Mohan and Kannappan Palaniappan

Copyright &copy; 2022-2024. Yasmin Kassim, Prof. K. Palaniappan and Curators of the University of Missouri, a public corporation. All Rights Reserved.

**Created by:** Yasmin Kassim  
Department of Electrical Engineering and Computer Science,  
University of Missouri-Columbia  

For more information, contact:

* **Yasmin Kassim**  
226 Naka Hall (EBW)  
University of Missouri-Columbia  
Columbia, MO 65211  
ymkgz8@mail.missouri.edu  


* **Dr. K. Palaniappan**  
205 Naka Hall (EBW)  
University of Missouri-Columbia  
Columbia, MO 65211  
palaniappank@missouri.edu
