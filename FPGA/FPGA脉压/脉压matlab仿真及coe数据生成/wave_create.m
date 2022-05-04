%斜视角为0
%斜率在最近斜率处的一维波形
%%
clear;
close all;
clc;
% %--------------------------------------------------------------------
% --------------------------------------------------------------------
R_nc = 20e3;                % 景中心斜距
Vr = 150;                   % 雷达有效速度
Tr = 2.5e-6;                % 发射脉冲时宽
Kr = 20e12;                 % 距离调频率
f0 = 5.3e9;                 % 雷达工作频率
BW_dop = 80;                % 多普勒带宽
Fr = 60e6;                  % 距离采样率
Fa = 100;                   % 方位采样率
% Naz = 256;                 % 距离线数（即数据矩阵，行数）——这里修改为1024。
Nrg = 320;                  % 距离线采样点数（即数据矩阵，列数）
sita_r_c = (0*pi)/180;	% 波束斜视角，0 度，这里转换为弧度
c = 3e8;                    % 光速

R0 = R_nc*cos(sita_r_c);	% 与R_nc相对应的最近斜距，记为R0
Nr = Tr*Fr;             % 线性调频信号采样点数距离维
BW_range = Kr*Tr;       % 距离向带宽
lamda = c/f0;           % 波长
fnc = 2*Vr*sin(sita_r_c)/lamda;     % 多普勒中心频率，根据公式（4.33）计算。
La_real = 0.886*2*Vr*cos(sita_r_c)/BW_dop; % 方位向天线长度，根据公式（4.36）
beta_bw = 0.886*lamda/La_real;           % 雷达3dB波束
Ls = beta_bw*R_nc;        % 合成孔径长度
a_sr = Fr / BW_range;   % 距离向过采样因子
a_sa = Fa / BW_dop;     % 方位向过采样因子

Mamb = round(fnc/Fa);   % 多普勒模糊
L_range=0.886*c/(2*abs(Kr)*Tr);%距离维理论分辨率
L_azimuth=(0.886*lamda)/(2*beta_bw);%方位维理论分辨率



NFFT_r = Nrg;           % 距离向FFT长度
% NFFT_a = Naz;           % 方位向FFT长度

%%
% --------------------------------------------------------------------
% 设定仿真点目标的位置
% 以距离向作为x轴正方向
% 以方位向作为y轴正方向
% -------------------------------------------------------------------- 
delta_R0 = 0;       % 将目标1的波束中心穿越时刻，定义为方位向时间零点。
% 目标1
x1 = R0;            % 目标1的距离向距离
y1 = delta_R0 + x1*tan(sita_r_c);	% 目标1的方位向距离
% 计算三个目标各自的波束中心穿越时刻
nc_1 = (y1-x1*tan(sita_r_c))/Vr;    % 目标1的波束中心穿越时刻。
% 距离
tr = 2 *x1/c + ( -Nrg/2 : (Nrg/2-1) )/Fr;                % 距离时间轴
fr = ( -NFFT_r/2 : NFFT_r/2-1 )*( Fr/NFFT_r );          % 距离频率轴
%%
 R_n = x1;%在中心垂直方向的距离
 w_range = ((abs(tr-2.*R_n./c))<= (Tr/2));  % 距离向包络，即距离窗
 A0 = 1;                     % 目标回波幅度，都设置为1.
 s_k = round(32767*(A0.*w_range.*exp(-(1j*4*pi*f0).*R_n./c).*exp((1j*pi*Kr).*(tr-2.*R_n./c).^2)));
si=real(s_k);
sq=imag(s_k);
  
  figure;
 subplot(1,2,1);
 plot(si);
 title('回波信号时域实部 s_ I');
  subplot(1,2,2);
 plot(sq);
 title('回波信号时域虚部 s_ Q');
%%
%  S_range=fft(s_k,NFFT_r);
%  figure;
%  subplot(1,2,1);
%  plot(real(S_range));
%  title('频域实部');
%   subplot(1,2,2);
%  plot(imag(S_range));
%  title('频域虚部');
 %%
 %方式一
 %%匹配滤波器
t_ref = ( -Nr/2 : (Nr/2-1) )/Fr;    % 用来生成距离MF的距离时间轴
%  
%   s_ref = exp((1j*pi*Kr).*((t_ref).^2)); % 复制（发射）脉冲，未加窗。
%   s_ref = [s_ref,zeros(1,floor(Nrg-Nr))];      % 对复制脉冲，后端补零。
s_ref = exp(-(1j*pi*Kr).*((t_ref).^2)); % 复制（发射）脉冲，未加窗。
s_ref = round(32767*[zeros(1,(Nrg-Nr)/2),s_ref,zeros(1,(Nrg-Nr)/2)]);
hi=real(s_ref);
hq=imag(s_ref);
%%
  figure;
 subplot(1,2,1);
 plot(hi);
 title('匹配滤波器时域信号实部 I');
  subplot(1,2,2);
 plot(hq);
 title('匹配滤波器时域信号虚部 Q');
%%
 
sihi=conv(si,hi);
sqhq=conv(sq,hq);
sihq=conv(si,hq);
sqhi=conv(sq,hi);
  
figure
subplot(2,2,1);
plot(sihi);
title('si与hi卷积波形');
subplot(2,2,2);
plot(sqhq);
title('sq与hq卷积波形');
subplot(2,2,3);
plot(sihq);
title('si与hq卷积波形');
subplot(2,2,4);
plot(sqhi);
title('sq与hi卷积波形');

s_3=(sihi-sqhq)+j*(sihq+sqhi);
s4=(abs(s_3));

%%
   figure;
 subplot(1,2,1);
 plot(real( s_3));
 title('脉冲压缩之后时域信号实部 I');
  subplot(1,2,2);
 plot(imag(s_3));
 title('脉冲压缩之后时域信号虚部 Q');
 figure
 plot(s4);
 title('脉冲压缩结果');
%  
% %%
% %保存回波IQ通道数据
% fid=fopen('si.coe','w'); %打开或者新建coe，存放位置和文件名
% fprintf(fid,'MEMORY_INITIALIZATION_RADIX=10;\n'); 
% fprintf(fid,'MEMORY_INITIALIZATION_VECTOR=\n');
% for coen=1:length(si)-1
%     fprintf(fid,'%d,\n',si(coen));
% end
% fprintf(fid,'%d;',si(length(si)));
% fclose all;
% 
% 
% fid=fopen('sq.coe','w'); %打开或者新建coe，存放位置和文件名
% fprintf(fid,'MEMORY_INITIALIZATION_RADIX=10;\n'); 
% fprintf(fid,'MEMORY_INITIALIZATION_VECTOR=\n');
% for coen=1:length(sq)-1
%     fprintf(fid,'%d,\n',sq(coen));
% end
% fprintf(fid,'%d;',sq(length(sq)));
% fclose all;
% 
%  %%
%  %保存滤波器系数文件
%  hi_coefile=fopen('hi.coe','w');
%  fprintf(hi_coefile,'radix = 10 ; \n');
%  fprintf(hi_coefile,'Coefficient_Width = 16 ;\n');
%  fprintf(hi_coefile,'CoefData = \n');
% for coen = 1:length(hi)-1
%     fprintf(hi_coefile,'%d,\n',hi(coen));
% end
%  fprintf(hi_coefile,'%d;',hi(length(hi)));
%  fclose all;
%  
%  hq_coefile=fopen('hq.coe','w');
%  fprintf(hq_coefile,'radix = 10 ; \n');
%  fprintf(hq_coefile,'Coefficient_Width = 16 ;\n');
%  fprintf(hq_coefile,'CoefData = \n');
% for coen = 1:length(hq)-1
%     fprintf(hq_coefile,'%d,\n',hq(coen));
% end
%  fprintf(hq_coefile,'%d;',hq(length(hq)));
%  fclose all;
 