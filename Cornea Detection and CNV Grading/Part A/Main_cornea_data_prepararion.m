

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Program Name: Main cornea data preperation
%                
%  Author: Yasmin Kassim
%  Copyright (C) 2020. Yasmin Kassim and Curators of the
%                      University of Missouri, a public corporation.
%                      All Rights Reserved.
%  Created by
%  PhD student: Yasmin Kassim
%  Department of Electrical Engineering and Computer Science,
%  University of Missouri-Columbia
%  For more information, contact:
%
%      Yasmin Kassim
%      226 Engineering Building West
%      University of Missouri-Columbia
%      Columbia, MO 65211
%      ymkgz8@mail.missouri.edu
% 
% or
%      Dr. K. Palaniappan
%      329 Engineering Building West
%      University of Missouri-Columbia
%      Columbia, MO 65211
%      palaniappank@missouri.edu
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Script Main cornea data preperation.m
%  Inputs:  
%        Put the patient images under input\stage\patient\image1.png
%        Ex: .\input\Extreme\ET_101_Day 21_04.16.2015\image1.png
%        Prepare data for mask R-CNN
%        
%  Outputs: Data prepared to be input for mask R-CNN in stage_test
%        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 

Prepare_masks_MaskRCNN_testing_withnames_stages

% This function will genertate small images for cornea detection using mask
% rcnn
create_small_CNV_for_testing

