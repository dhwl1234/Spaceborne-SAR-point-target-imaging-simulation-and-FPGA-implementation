function [s_rc,S_range_c ] = Distance_Plus_Compress(s_echo,Nr,Naz,Nrg,Fr,Kr)


NFFT_r = Nrg;           % ������FFT����

S_range = fft(s_echo,NFFT_r,2);     % ���о�������Ҷ�任����Ƶ�����ˡ�

%�����ݴ�����
% dlmwrite('S_range_real.txt', real(S_range),'precision', 64);
% dlmwrite('S_range_imag.txt', imag(S_range),'precision', 64);
% S_range_test=dlmread('S_range_real.txt')+dlmread('S_range_imag.txt')*1i;%����
% S_range = S_range_test; 
t_ref = ( -Nr/2 : (Nr/2-1) )/Fr;    % �������ɾ���MF�ľ���ʱ����
t_ref_mtx = ones(Naz,1)*t_ref;      % ������ʽ
% w_ref = kaiser(Nr,0.5);             % �����򣬹���Kaiser������Ϊ��������
% w_ref = ones(Naz,1)*(w_ref.');      % ���ɾ�����ʽ��ÿһ�ж���ͬ�ļӴ���

  s_ref = exp((1j*pi*Kr).*((t_ref_mtx).^2)); % ���ƣ����䣩���壬δ�Ӵ���
%   s_ref = w_ref.*exp((1j*pi*Kr).*((t_ref_mtx).^2)); % ���ƣ����䣩���壬���˴���
%����Ϊ���ƵĻ����źţ��鱾P49 ��ʽ3.26

s_ref = [s_ref,zeros(Naz,floor(Nrg-Nr))];      % �Ը������壬��˲��㡣
 %ʱ�����൱��Ƶ���ֵ�������������Ƶ��Ĳ�ֵ������ʹ�����߿��������⻬,�и��õķֱ���
 
S_ref = fft(s_ref,NFFT_r,2);            % ��������ľ��븵��Ҷ�任����Ƶ�����ˡ�
H_range = conj(S_ref);                  % ������ƥ���˲�������Ƶ�����ˡ�%conj������������ֵ���˴����ɾ�����ƥ���˲���

% dlmwrite('H_range_real.txt', real(H_range),'precision', 64);
% dlmwrite('H_range_imag.txt', imag(H_range),'precision', 64);
%  H_range_test=dlmread('H_range_real.txt')+dlmread('H_range_imag.txt')*1i;%����
%  H_range =  H_range_test;
%  
 S_range_c = S_range.*H_range;           % ����ƥ���˲�������Ƶ�����ˡ�    ����ѹ�����ǳ�����ƥ���˲���
%����
 % S_range_c_real=load("Result_Save_real.txt");
% S_range_c_imag=load("Result_Save_imag.txt");
% S_range_c=S_range_c_real+S_range_c_imag.*1i;
s_rc = ifft(S_range_c,[],2);            % ��ɾ���ѹ�����ص���άʱ��
end

