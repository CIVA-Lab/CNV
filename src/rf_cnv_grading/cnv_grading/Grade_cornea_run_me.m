
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Program Name: Compute the grading of cornea images
%                
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                
%  Author: Yasmin M. Kassim & Kannappan Palaniappan
%  Copyright(C)2019-2020. Y. Kassim, K. Palaniappan and      
%			  Curators of the University of Missouri, a          
%	             public corporation.
%                 All Rights Reserved.
%
%  Created by
%  Yasmin M. Kassim & Kannappan Palaniappan
%  Department of Electrical Engineering and Computer Science,
%  University of Missouri-Columbia
%  For more information, contact:
%
%      Yasmin Kassim
%      226 Naka Hall (EBW)
%      University of Missouri-Columbia
%      Columbia, MO 65211
%      ymkgz8@mail.missouri.edu
% 
% or
%      Dr. K. Palaniappan
%      205 Naka Hall (EBW)
%      University of Missouri-Columbia
%      Columbia, MO 65211
%      palaniappank@missouri.edu
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Script Grade_cornea_run_me.m
%  Inputs:  
%        Put the patient images under images/test 
%  Outputs:
%        The grade of each image in the test folder as follows:
%      -1  Naive
%       0  No CNV
%       1  Mild
%       2  Moderate
%       3  Severe
%       4  Extreme
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Collaborates with :  Rajiv R. Mohan, Shyam Chaurasia, and Suneel Gupta 
% University of Missouri Veterinary Health Center
addpath '.\scripts';

CNV_RF_Main_per_patients_just_testing