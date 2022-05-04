 Nrg = 320;                  % 距离线采样点数（即数据矩阵，列数）
 Fr = 60e6;                  % 距离采样率
 Tr = 2.5e-6;                % 发射脉冲时宽
 Kr = 20e12;                 % 距离调频率
 Nr = Tr*Fr;             % 线性调频信号采样点数距离维
t_ref = ( -Nr/2 : (Nr/2-1) )/Fr;    % 用来生成距离MF的距离时间轴
s_ref = exp(-(1j*pi*Kr).*((t_ref).^2)); % 复制（发射）脉冲，未加窗。
s_ref = [zeros(1,(Nrg-Nr)/2),s_ref,zeros(1,(Nrg-Nr)/2)];

%%
 figure;
 subplot(1,2,1);
 plot(real(s_ref));
 title('时域信号实部');
  subplot(1,2,2);
 plot(imag(s_ref));
 title('时域信号虚部');