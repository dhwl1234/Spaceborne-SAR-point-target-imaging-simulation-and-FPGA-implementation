tic;
clearvars; clc; close all;
%%��ȡ����
disp('Read Echo Data ...')
filename = 'GF3_MYN_UFSM_000151_20160820_DH_0000076231_0_HH.caw';

Na     =  16384;%��λ��ά��
Nr     =  8192;  %������ά��

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
Fs     =  133.333e6;          
Br     =  120e6;                 %���������
Tp     =  50.010e-6;               %��������ʱ��
PRF    =  1867.413632;%�ظ�����Ƶ��
Vr     =  7144.158862;     %�״���Ч�ٶ�
R0     =  817585.557762;   %���б��
fdc    =  175.184665;           %����������Ƶ��
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
% imwrite(uint16(abs(imag)),'GF3_MYN_UFSM_000151_20160820_DH_0000076231_0_HH.tif');
% imwrite(uint16(abs(imag)),'RDA_uint16.tif');
 %%
% figure;imagesc(abs(imag));
% title('ͼ��');imcontrast;
toc;