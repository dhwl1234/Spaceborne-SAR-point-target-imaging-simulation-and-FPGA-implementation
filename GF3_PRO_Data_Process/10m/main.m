tic;
clearvars; clc; close all;
%%读取数据
disp('Read Echo Data ...')
filename = 'GF3_MYN_FSII_006061_20171004_HHHV_0000154622_0_HH.caw';

Na     =  16384;%方位向维度
Nr     =  31744;  %距离向维度

fid   = fopen(filename,'rb');%读取二进制文件
data  = fread(fid,[2*Na,Nr],'float32');
data  = data(1:2:end,:).' + 1i*data(2:2:end,:).';
fclose(fid);
%%
%--------------------------------------------------------------------------
c      =  299792458;      %光速
D      =  15;                      %天线长度
f0     =  5.4e9;                %雷达工作频率
lambda =  c/f0;              %波长
Fs     =  66.667e6;          
Br     =  60e6;                 %距离向带宽
Tp     =  45e-6;               %发射脉冲时宽
PRF    =  1413.327680;%重复脉冲频率
Vr     =  7131.568059;     %雷达有效速度
R0     =  898819.740047;   %最近斜率
fdc    =  54.172354;           %多普勒中心频率
Kr     =  -Br/Tp;                   %距离调频率
%%
%------------参数赋值
para.c       = c;
para.prf     = PRF;
para.Vr      = Vr;
para.Rs      = R0;
para.R0      = R0;
para.Tp      = Tp;
para.Kr      = Kr;
para.Fc      = f0;
para.Fs      = Fs;
para.B       = Br;
para.D       = D;
para.Fdc     = fdc;
para.lambda  = lambda;
para.Ba 	 = 2*Vr/D;%方位向带宽，多普勒带宽

%%
%%数据成像
imag =RDA_Imaging(data,para);
%% 对数变换
J=abs(imag);
% v=5000;
r=mat2gray(double(J));
% S=log(1+v*r)/(log(v+1));
S=imadjust(r);%自动调整对比度
figure; 
 imshow(S,[]);
%%
%存下来用PS调整
%  imwrite(uint16(abs(imag)),'CS_GF3_MYN_FSII_006061_20171004_HHHV_0000154622_0_HV.tif');
imwrite(uint16(abs(imag)),'RDA_GF3_MYN_FSII_006061_20171004_HHHV_0000154622_0_HH.tif');
 %%
% figure;imagesc(abs(imag));
% title('图像');imcontrast;
toc;