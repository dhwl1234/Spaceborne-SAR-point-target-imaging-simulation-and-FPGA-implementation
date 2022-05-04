
s_echo =dlmread('M.txt');
Naz = 256;                 % 距离线数（即数据矩阵，行数）——这里修改为1024。
Nrg = 320;                  % 距离线采样点数（即数据矩阵，列数）
Fr = 60e6;                  % 距离采样率
Kr = 20e12;                 % 距离调频率
Nr =150;
[s_rc,S_range_c ]=Distance_Plus_Compress(s_echo,Nr,Naz,Nrg,Fr,Kr);