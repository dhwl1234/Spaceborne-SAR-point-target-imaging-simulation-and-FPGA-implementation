tic;
clearvars; clc; close all;
%%��ȡ����
disp('Read Echo Data ...')
filename = 'GF3_MYN_FSII_006061_20171004_HHHV_0000154622_0_HH.caw';

Na     =  16384;%��λ��ά��
Nr     =  31744;  %������ά��

fid   = fopen(filename,'rb');%��ȡ�������ļ�
data  = fread(fid,[2*Na,Nr],'float32');
data  = data(1:2:end,:).' + 1i*data(2:2:end,:).';
fclose(fid);
%%
%--------------------------------------------------------------------------
c      =  299792458;      %����
D      =  15;                      %���߳���
f0     =  5.4e9;                %�״﹤��Ƶ��
lambda =  c/f0;              %����
Fs     =  66.667e6;          
Br     =  60e6;                 %���������
Tp     =  45e-6;               %��������ʱ��
PRF    =  1413.327680;%�ظ�����Ƶ��
Vr     =  7131.568059;     %�״���Ч�ٶ�
R0     =  898819.740047;   %���б��
fdc    =  54.172354;           %����������Ƶ��
Kr     =  -Br/Tp;                   %�����Ƶ��
%%
%------------������ֵ
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
para.Ba 	 = 2*Vr/D;%��λ����������մ���

%%
%%���ݳ���
imag =RDA_Imaging(data,para);
%% �����任
J=abs(imag);
% v=5000;
r=mat2gray(double(J));
% S=log(1+v*r)/(log(v+1));
S=imadjust(r);%�Զ������Աȶ�
figure; 
 imshow(S,[]);
%%
%��������PS����
%  imwrite(uint16(abs(imag)),'CS_GF3_MYN_FSII_006061_20171004_HHHV_0000154622_0_HV.tif');
imwrite(uint16(abs(imag)),'RDA_GF3_MYN_FSII_006061_20171004_HHHV_0000154622_0_HH.tif');
 %%
% figure;imagesc(abs(imag));
% title('ͼ��');imcontrast;
toc;