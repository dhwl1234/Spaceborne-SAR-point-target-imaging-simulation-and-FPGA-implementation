clearvars; clc; close all;
%%读取数据
disp('Read Echo Data ...')
filename = 'GF3_MYN_SM_999996_20160815_AHV_0000075521_0_HH.caw';

Na     =  16384;%方位向维度
Nr     =  8192;  %距离向维度

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
Br     =  40e6;                 %距离向带宽
Tp     =  30e-6;               %发射脉冲时宽
PRF    =  2727.768685/2;%重复脉冲频率
Vr     =  7123.930520;     %雷达有效速度
R0     =  961241.045189;   %最近斜率
fdc    =  14.251278;           %多普勒中心频率
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
imag =CSA_Imaging(data,para);
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
% imwrite(uint16(abs(imag)),'CSA_uint16.tif');
% imwrite(uint16(abs(imag)),'RDA_uint16.tif');
 %%
% figure;imagesc(abs(imag));
% title('图像');imcontrast;