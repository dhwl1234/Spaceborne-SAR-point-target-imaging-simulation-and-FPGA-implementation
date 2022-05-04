%б�ӽ�Ϊ0
%б�������б�ʴ���һά����
%%
clear;
close all;
clc;
% %--------------------------------------------------------------------
% --------------------------------------------------------------------
R_nc = 20e3;                % ������б��
Vr = 150;                   % �״���Ч�ٶ�
Tr = 2.5e-6;                % ��������ʱ��
Kr = 20e12;                 % �����Ƶ��
f0 = 5.3e9;                 % �״﹤��Ƶ��
BW_dop = 80;                % �����մ���
Fr = 60e6;                  % ���������
Fa = 100;                   % ��λ������
% Naz = 256;                 % ���������������ݾ������������������޸�Ϊ1024��
Nrg = 320;                  % �����߲��������������ݾ���������
sita_r_c = (0*pi)/180;	% ����б�ӽǣ�0 �ȣ�����ת��Ϊ����
c = 3e8;                    % ����

R0 = R_nc*cos(sita_r_c);	% ��R_nc���Ӧ�����б�࣬��ΪR0
Nr = Tr*Fr;             % ���Ե�Ƶ�źŲ�����������ά
BW_range = Kr*Tr;       % ���������
lamda = c/f0;           % ����
fnc = 2*Vr*sin(sita_r_c)/lamda;     % ����������Ƶ�ʣ����ݹ�ʽ��4.33�����㡣
La_real = 0.886*2*Vr*cos(sita_r_c)/BW_dop; % ��λ�����߳��ȣ����ݹ�ʽ��4.36��
beta_bw = 0.886*lamda/La_real;           % �״�3dB����
Ls = beta_bw*R_nc;        % �ϳɿ׾�����
a_sr = Fr / BW_range;   % ���������������
a_sa = Fa / BW_dop;     % ��λ�����������

Mamb = round(fnc/Fa);   % ������ģ��
L_range=0.886*c/(2*abs(Kr)*Tr);%����ά���۷ֱ���
L_azimuth=(0.886*lamda)/(2*beta_bw);%��λά���۷ֱ���



NFFT_r = Nrg;           % ������FFT����
% NFFT_a = Naz;           % ��λ��FFT����

%%
% --------------------------------------------------------------------
% �趨�����Ŀ���λ��
% �Ծ�������Ϊx��������
% �Է�λ����Ϊy��������
% -------------------------------------------------------------------- 
delta_R0 = 0;       % ��Ŀ��1�Ĳ������Ĵ�Խʱ�̣�����Ϊ��λ��ʱ����㡣
% Ŀ��1
x1 = R0;            % Ŀ��1�ľ��������
y1 = delta_R0 + x1*tan(sita_r_c);	% Ŀ��1�ķ�λ�����
% ��������Ŀ����ԵĲ������Ĵ�Խʱ��
nc_1 = (y1-x1*tan(sita_r_c))/Vr;    % Ŀ��1�Ĳ������Ĵ�Խʱ�̡�
% ����
tr = 2 *x1/c + ( -Nrg/2 : (Nrg/2-1) )/Fr;                % ����ʱ����
fr = ( -NFFT_r/2 : NFFT_r/2-1 )*( Fr/NFFT_r );          % ����Ƶ����
%%
 R_n = x1;%�����Ĵ�ֱ����ľ���
 w_range = ((abs(tr-2.*R_n./c))<= (Tr/2));  % ��������磬�����봰
 A0 = 1;                     % Ŀ��ز����ȣ�������Ϊ1.
 s_k = round(32767*(A0.*w_range.*exp(-(1j*4*pi*f0).*R_n./c).*exp((1j*pi*Kr).*(tr-2.*R_n./c).^2)));
si=real(s_k);
sq=imag(s_k);
  
  figure;
 subplot(1,2,1);
 plot(si);
 title('�ز��ź�ʱ��ʵ�� s_ I');
  subplot(1,2,2);
 plot(sq);
 title('�ز��ź�ʱ���鲿 s_ Q');
%%
%  S_range=fft(s_k,NFFT_r);
%  figure;
%  subplot(1,2,1);
%  plot(real(S_range));
%  title('Ƶ��ʵ��');
%   subplot(1,2,2);
%  plot(imag(S_range));
%  title('Ƶ���鲿');
 %%
 %��ʽһ
 %%ƥ���˲���
t_ref = ( -Nr/2 : (Nr/2-1) )/Fr;    % �������ɾ���MF�ľ���ʱ����
%  
%   s_ref = exp((1j*pi*Kr).*((t_ref).^2)); % ���ƣ����䣩���壬δ�Ӵ���
%   s_ref = [s_ref,zeros(1,floor(Nrg-Nr))];      % �Ը������壬��˲��㡣
s_ref = exp(-(1j*pi*Kr).*((t_ref).^2)); % ���ƣ����䣩���壬δ�Ӵ���
s_ref = round(32767*[zeros(1,(Nrg-Nr)/2),s_ref,zeros(1,(Nrg-Nr)/2)]);
hi=real(s_ref);
hq=imag(s_ref);
%%
  figure;
 subplot(1,2,1);
 plot(hi);
 title('ƥ���˲���ʱ���ź�ʵ�� I');
  subplot(1,2,2);
 plot(hq);
 title('ƥ���˲���ʱ���ź��鲿 Q');
%%
 
sihi=conv(si,hi);
sqhq=conv(sq,hq);
sihq=conv(si,hq);
sqhi=conv(sq,hi);
  
figure
subplot(2,2,1);
plot(sihi);
title('si��hi�������');
subplot(2,2,2);
plot(sqhq);
title('sq��hq�������');
subplot(2,2,3);
plot(sihq);
title('si��hq�������');
subplot(2,2,4);
plot(sqhi);
title('sq��hi�������');

s_3=(sihi-sqhq)+j*(sihq+sqhi);
s4=(abs(s_3));

%%
   figure;
 subplot(1,2,1);
 plot(real( s_3));
 title('����ѹ��֮��ʱ���ź�ʵ�� I');
  subplot(1,2,2);
 plot(imag(s_3));
 title('����ѹ��֮��ʱ���ź��鲿 Q');
 figure
 plot(s4);
 title('����ѹ�����');
%  
% %%
% %����ز�IQͨ������
% fid=fopen('si.coe','w'); %�򿪻����½�coe�����λ�ú��ļ���
% fprintf(fid,'MEMORY_INITIALIZATION_RADIX=10;\n'); 
% fprintf(fid,'MEMORY_INITIALIZATION_VECTOR=\n');
% for coen=1:length(si)-1
%     fprintf(fid,'%d,\n',si(coen));
% end
% fprintf(fid,'%d;',si(length(si)));
% fclose all;
% 
% 
% fid=fopen('sq.coe','w'); %�򿪻����½�coe�����λ�ú��ļ���
% fprintf(fid,'MEMORY_INITIALIZATION_RADIX=10;\n'); 
% fprintf(fid,'MEMORY_INITIALIZATION_VECTOR=\n');
% for coen=1:length(sq)-1
%     fprintf(fid,'%d,\n',sq(coen));
% end
% fprintf(fid,'%d;',sq(length(sq)));
% fclose all;
% 
%  %%
%  %�����˲���ϵ���ļ�
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
 