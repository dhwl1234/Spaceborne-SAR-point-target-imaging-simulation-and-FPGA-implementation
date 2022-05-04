tic;
clearvars; clc; close all;
%%读取数据
disp('Read Echo Data ...')
filename = 'GF3_MYN_UFSM_000151_20160820_DH_0000076231_0_HH.caw';

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
Fs     =  133.333e6;          
Br     =  120e6;                 %距离向带宽
Tp     =  50.010e-6;               %发射脉冲时宽
PRF    =  1867.413632;%重复脉冲频率
Vr     =  7144.158862;     %雷达有效速度
R0     =  817585.557762;   %最近斜率
fdc    =  175.184665;           %多普勒中心频率
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
% imwrite(uint16(abs(imag)),'GF3_MYN_UFSM_000151_20160820_DH_0000076231_0_HH.tif');
% imwrite(uint16(abs(imag)),'RDA_uint16.tif');
 %%
% figure;imagesc(abs(imag));
% title('图像');imcontrast;
toc;