
s_echo =dlmread('M.txt');
Naz = 256;                 % ���������������ݾ������������������޸�Ϊ1024��
Nrg = 320;                  % �����߲��������������ݾ���������
Fr = 60e6;                  % ���������
Kr = 20e12;                 % �����Ƶ��
Nr =150;
[s_rc,S_range_c ]=Distance_Plus_Compress(s_echo,Nr,Naz,Nrg,Fr,Kr);