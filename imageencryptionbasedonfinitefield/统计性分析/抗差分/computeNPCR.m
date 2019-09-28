clc;close all;
clear all;

i=imread('encamera256.bmp');
 i1=imread('changeencamera256.bmp');
NPCR1=npcrcc(i1,i)
UACI1=uacicc(i1,i)
