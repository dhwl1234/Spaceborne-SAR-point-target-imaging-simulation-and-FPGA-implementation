function [s_rc,S_range_c ] = Distance_Plus_Compress(s_echo,Nr,Naz,Nrg,Fr,Kr)


NFFT_r = Nrg;           % 距离向FFT长度

S_range = fft(s_echo,NFFT_r,2);     % 进行距离向傅里叶变换，零频在两端。

%将数据存下来
% dlmwrite('S_range_real.txt', real(S_range),'precision', 64);
% dlmwrite('S_range_imag.txt', imag(S_range),'precision', 64);
% S_range_test=dlmread('S_range_real.txt')+dlmread('S_range_imag.txt')*1i;%测试
% S_range = S_range_test; 
t_ref = ( -Nr/2 : (Nr/2-1) )/Fr;    % 用来生成距离MF的距离时间轴
t_ref_mtx = ones(Naz,1)*t_ref;      % 矩阵形式
% w_ref = kaiser(Nr,0.5);             % 距离向，构建Kaiser窗，此为列向量。
% w_ref = ones(Naz,1)*(w_ref.');      % 构成矩阵形式，每一行都相同的加窗。

  s_ref = exp((1j*pi*Kr).*((t_ref_mtx).^2)); % 复制（发射）脉冲，未加窗。
%   s_ref = w_ref.*exp((1j*pi*Kr).*((t_ref_mtx).^2)); % 复制（发射）脉冲，加了窗。
%上述为复制的基带信号，书本P49 公式3.26

s_ref = [s_ref,zeros(Naz,floor(Nrg-Nr))];      % 对复制脉冲，后端补零。
 %时域补零相当于频域插值，补零操作增加频域的插值点数。使得曲线看起来更光滑,有更好的分辨率
 
S_ref = fft(s_ref,NFFT_r,2);            % 复制脉冲的距离傅里叶变换，零频在两端。
H_range = conj(S_ref);                  % 距离向匹配滤波器，零频在两端。%conj函数用于求共轭值，此处生成距离向匹配滤波器

% dlmwrite('H_range_real.txt', real(H_range),'precision', 64);
% dlmwrite('H_range_imag.txt', imag(H_range),'precision', 64);
%  H_range_test=dlmread('H_range_real.txt')+dlmread('H_range_imag.txt')*1i;%测试
%  H_range =  H_range_test;
%  
 S_range_c = S_range.*H_range;           % 乘以匹配滤波器，零频在两端。    距离压缩就是乘以其匹配滤波器
%测试
 % S_range_c_real=load("Result_Save_real.txt");
% S_range_c_imag=load("Result_Save_imag.txt");
% S_range_c=S_range_c_real+S_range_c_imag.*1i;
s_rc = ifft(S_range_c,[],2);            % 完成距离压缩，回到二维时域
end

