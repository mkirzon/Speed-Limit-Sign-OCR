% EE569 Homework Assignment #4
% P1a: OCR Classifier
% Date: November 10, 2015
% Name: Mark Kirzon
% ID: 859-285-7654
% email: kirzon@usc.edu
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear; clc; close all;

% Read in images for OCR
dim_train =  [256, 512];
dim_ideal1 = [759, 620];
dim_ideal2 = [400, 250];
dim_night =  [360, 267];
dim_shade =  [361, 215];
[I_train_bin, I_train_or] = im_2_binary('Training.raw', dim_train, 50, 1, false);
[I_ideal1_bin, I_ideal1_or] = im_2_binary('Test_ideal1.raw', dim_ideal1, 50, 1, false);
[I_ideal2_bin, I_ideal2_or] = im_2_binary('Test_ideal2.raw', dim_ideal2, 150, 1, false);
[I_night_bin, I_night_or] = im_2_binary('Test_night.raw', dim_night, 90, 1, true);
[I_shade_bin, I_shade_or] = im_2_binary('Test_shade.raw', dim_shade, 50, 1, false);

% Visualize Original Data and binarized data
imshow_original_binary(I_train_or, I_train_bin, 'Training');
imshow_original_binary(I_ideal1_or, I_ideal1_bin, 'Test ideal1');
imshow_original_binary(I_ideal2_or, I_ideal2_bin, 'Test ideal2');
imshow_original_binary(I_night_or, I_night_bin, 'Test night');
imshow_original_binary(I_shade_or, I_shade_bin, 'Test shade');

%% Find characters and compute features
[char_list_train, max_height] = im_2_char_features(I_train_bin, dim_train);
char_list_ideal1 = im_2_char_features(I_ideal1_bin, dim_ideal1, max_height);
char_list_ideal2 = im_2_char_features(I_ideal2_bin, dim_ideal2, max_height);
char_list_night = im_2_char_features(I_night_bin, dim_night, max_height);
char_list_shade = im_2_char_features(I_shade_bin, dim_shade, max_height);

% Visualize bounding boxes
draw_bounds(I_train_or, char_list_train, 'train');
draw_bounds(I_ideal1_or, char_list_ideal1, 'ideal1');
draw_bounds(I_ideal2_or, char_list_ideal2, 'ideal2');
draw_bounds(I_night_or, char_list_night, 'night');
draw_bounds(I_shade_or, char_list_shade, 'shade');

% Add actual character values
add_char_obj_actual_train;
add_char_obj_actual_ideal1;
add_char_obj_actual_ideal2;
add_char_obj_actual_night;
add_char_obj_actual_shade;

%% Display / Visualize features
view_results_menu(char_list_train);
view_results_menu(char_list_ideal1);
view_results_menu(char_list_ideal2);
view_results_menu(char_list_night);
view_results_menu(char_list_shade);

%% Run Decision Tree
char_list_train = run_decisionTree(char_list_train);
char_list_ideal1 = run_decisionTree(char_list_ideal1);
char_list_ideal2 = run_decisionTree(char_list_ideal2);
char_list_night = run_decisionTree(char_list_night);
char_list_shade = run_decisionTree(char_list_shade);

%% Output results to Cell Array (for viewing in matlab variable explorer, used for manually building decision tree)
cell_output_train = charlist_2_cellarray(char_list_train);
cell_output_ideal1 = charlist_2_cellarray(char_list_ideal1);
cell_output_ideal2 = charlist_2_cellarray(char_list_ideal2);
cell_output_night = charlist_2_cellarray(char_list_night);
cell_output_shade = charlist_2_cellarray(char_list_shade);

%% Error rate
clc;
char_list_error_rate(char_list_train, 'Training');
char_list_error_rate(char_list_ideal1, 'Ideal1');
char_list_error_rate(char_list_ideal2, 'Ideal2');
char_list_error_rate(char_list_night, 'Night');
char_list_shade(end) = []; % Remove the object containing the letters 
char_list_error_rate(char_list_shade, 'Shade');

