 Nrg = 320;                  % �����߲��������������ݾ���������
 Fr = 60e6;                  % ���������
 Tr = 2.5e-6;                % ��������ʱ��
 Kr = 20e12;                 % �����Ƶ��
 Nr = Tr*Fr;             % ���Ե�Ƶ�źŲ�����������ά
t_ref = ( -Nr/2 : (Nr/2-1) )/Fr;    % �������ɾ���MF�ľ���ʱ����
s_ref = exp(-(1j*pi*Kr).*((t_ref).^2)); % ���ƣ����䣩���壬δ�Ӵ���
s_ref = [zeros(1,(Nrg-Nr)/2),s_ref,zeros(1,(Nrg-Nr)/2)];

%%
 figure;
 subplot(1,2,1);
 plot(real(s_ref));
 title('ʱ���ź�ʵ��');
  subplot(1,2,2);
 plot(imag(s_ref));
 title('ʱ���ź��鲿');