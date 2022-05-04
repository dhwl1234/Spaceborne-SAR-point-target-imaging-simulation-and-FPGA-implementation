%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%               ������
%                RDA
%              ��Ŀ�����
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% ��Ŀ�����

%%
clear;
close all;
clc;
% --------------------------------------------------------------------
% �������
% --------------------------------------------------------------------
R_nc = 20e3;                % ������б��
Vr = 150;                   % �״���Ч�ٶ�
Tr = 2.5e-6;                % ��������ʱ��
Kr = 20e12;                 % �����Ƶ��
f0 = 5.3e9;                 % �״﹤��Ƶ��
BW_dop = 80;                % �����մ���
Fr = 60e6;                  % ���������
Fa = 100;                   % ��λ������
Naz = 256;                 % ���������������ݾ������������������޸�Ϊ1024��
Nrg = 320;                  % �����߲��������������ݾ���������
sita_r_c = (0*pi)/180;	% ����б�ӽǣ�3.5 �ȣ�����ת��Ϊ����
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
NFFT_a = Naz;           % ��λ��FFT����
%%
% --------------------------------------------------------------------
% �趨�����Ŀ���λ��
% �Ծ�������Ϊx��������
% �Է�λ����Ϊy��������
% -------------------------------------------------------------------- 
delta_R0 = 0;       % ��Ŀ��1�Ĳ������Ĵ�Խʱ�̣�����Ϊ��λ��ʱ����㡣
delta_R1 = 120; 	% Ŀ��1��Ŀ��2�ķ�λ�����120m
delta_R2 = 50;      % Ŀ��2��Ŀ��3�ľ��������50m

% Ŀ��1
x1 = R0;            % Ŀ��1�ľ��������
y1 = delta_R0 + x1*tan(sita_r_c);	% Ŀ��1�ķ�λ�����

% Ŀ��2
x2 = x1;            % Ŀ��2��Ŀ��1�ľ����������ͬ
y2 = y1 + delta_R1; % Ŀ��2�ķ�λ�����
% Ŀ��3
x3 = x2 + delta_R2;                 % Ŀ��3��Ŀ��2�о�����ľ���Ϊdelta_R2
y3 = y2 + delta_R2*tan(sita_r_c);  	% Ŀ��3�ķ�λ�����
% �����������飬���ڴ���
x_range = [x1,x2,x3];
y_azimuth = [y1,y2,y3];

% ��������Ŀ����ԵĲ������Ĵ�Խʱ��
nc_1 = (y1-x1*tan(sita_r_c))/Vr;    % Ŀ��1�Ĳ������Ĵ�Խʱ�̡�
nc_2 = (y2-x2*tan(sita_r_c))/Vr;    % Ŀ��2�Ĳ������Ĵ�Խʱ�̡�
nc_3 = (y3-x3*tan(sita_r_c))/Vr;    % Ŀ��3�Ĳ������Ĵ�Խʱ�̡�
nc_target = [nc_1,nc_2,nc_3];       % ��������飬���ڴ���

%% 
% --------------------------------------------------------------------
% ���루��λ����ʱ�䣬Ƶ����ض���
% --------------------------------------------------------------------
% ����
tr = 2 *x1/c + ( -Nrg/2 : (Nrg/2-1) )/Fr;                % ����ʱ����
fr = ( -NFFT_r/2 : NFFT_r/2-1 )*( Fr/NFFT_r );          % ����Ƶ����
% ��λ
ta = ( -Naz/2: Naz/2-1 )/Fa;                            % ��λʱ����
fa = fnc + ( -NFFT_a/2 : NFFT_a/2-1 )*( Fa/NFFT_a );	% ��λƵ����

% ���ɾ��루��λ��ʱ�䣨Ƶ�ʣ�����
tr_mtx = ones(Naz,1)*tr;    % ����ʱ������󣬴�С��Naz*Nrg
ta_mtx = ta'.*ones(1,Nrg);  % ��λʱ������󣬴�С��Naz*Nrg

%% 
% --------------------------------------------------------------------
% ���ɵ�Ŀ��ԭʼ����
% --------------------------------------------------------------------
s_echo = zeros(Naz,Nrg);    % ����������ɵĻز�����

A0 = 1;                     % Ŀ��ز����ȣ�������Ϊ1.
for k = 1:1                % ����k��Ŀ���ԭʼ�ز�����
    R_n = sqrt( (x_range(k).*ones(Naz,Nrg)).^2 + (Vr.*ta_mtx-y_azimuth(k).*ones(Naz,Nrg)).^2 );% Ŀ��k��˲ʱб��
    w_range = ((abs(tr_mtx-2.*R_n./c)) <= ((Tr/2).*ones(Naz,Nrg)));     % ��������磬�����봰
    % =====================================================================    
    % ��λ����磬Ҳ���� ���ߵ�˫�̷���ͼ�������ӡ�
    % ��ʽ1
    % ���úϳɿ׾����ȣ�ֱ�ӹ�����δ�����ʵ����ֻ���������ݷ�Χ��û�������Ӵ���
    w_azimuth = (abs(ta - nc_target(k)) <= (Ls/2)/Vr);    % ������
    w_azimuth = w_azimuth.'*ones(1,Nrg);    % ����Nxaz*Nrg�ľ���
    % ��ʽ2
    % sincƽ���ͺ��������ݹ�ʽ��4.31������    
%     sita = atan( Vr.*(ta_mtx-nc_target(k).*ones(Naz,Nrg))/x_range(k) );%sita�Ǿ���б���õ������ߵļн�
%     w_azimuth = (sinc(0.886.*sita./beta_bw)).^2;    
    % ��ÿ��Ŀ���Ӧ�� �������Ĵ�Խʱ�̣�������֮ǰ�����е�nc��
    
    %��ʽ��������ȷ���
%         sita = atan( Vr.*(ta_mtx-nc_target(k).*ones(Naz,Nrg)-x_range(k)*tan(sita_r_c))/x_range(k) )+sita_r_c;
%          w_azimuth = (sinc(0.886.*sita./beta_bw)).^2;    
%     =====================================================================     
     s_k = A0.*w_range.*w_azimuth.*exp(-(1j*4*pi*f0).*R_n./c).*exp((1j*pi*Kr).*(tr_mtx-2.*R_n./c).^2);
%�����½������ɷ���
%         ka=2*Vr^2/(lamda*x_range(k));
%         s_k = A0.*w_range.*w_azimuth.*exp(-(1j*4*pi/lamda)*x_range(k).*ones(Naz,Nrg)).*exp(-(1j*pi*ka).*(ta_mtx.^2)).*exp((1j*pi*Kr).*(tr_mtx-2.*R_n./c).^2);
    % ��ʽ�������ɵ�ĳһ����sĿ�꣨Ŀ��k���Ļز��źš�
    % ��������ѭ�������ɼ�����Ŀ��Ļز��źţ���Ӽ��ɡ�
    if k == 1
        s_1 = s_k;          % Ŀ��1�Ļز��ź�
    end
    if k == 2   
        s_2 = s_k;          % Ŀ��2�Ļز��ź�
    end
    if k == 3
        s_3 = s_k;          % Ŀ��3�Ļز��ź�
    end
    s_echo = s_echo + s_k;  % ���е�Ŀ��ز��ź�֮��   
end
% dlmwrite('M.txt', s_echo);
% s_echo=dlmread('M.txt');
% s_echo ����������Ҫ��ԭʼ���ݣ���Ŀ��ز��źš�

% ��ͼ
% ͼ1����ԭʼ����
figure('NumberTitle', 'off', 'Name', '��ԭʼ���ݽ��л�ͼ');
subplot(2,2,1);
% mesh(real(s_echo));
 imagesc(real(s_echo));
% plot(real(s_echo));
title('��a��ʵ��');
xlabel('����ʱ�򣨲����㣩');
ylabel('��λʱ�򣨲����㣩');
text(300,-40,'ͼ1��ԭʼ����');       % ��ͼ1��������˵�� 
% text ��������ͼ���ָ������λ�ã�����ı���

subplot(2,2,2);
imagesc(imag(s_echo));
title('��b���鲿');
xlabel('����ʱ�򣨲����㣩');
ylabel('��λʱ�򣨲����㣩');

subplot(2,2,3);
imagesc(abs(s_echo));
title('��c������');
xlabel('����ʱ�򣨲����㣩');
ylabel('��λʱ�򣨲����㣩');

subplot(2,2,4);
imagesc(angle(s_echo));
title('��d����λ');
xlabel('����ʱ�򣨲����㣩');
ylabel('��λʱ�򣨲����㣩');
% colormap(gray);

%%dimΪ1ʱ��ʾ��ά��dimΪ2ʱ��ʾ��ά

figure('NumberTitle', 'off', 'Name', '��ԭʼ���ݱ任�������������Ͷ�άƵ��֮����л�ͼ');

subplot(2,2,1);
imagesc(abs(fft(s_echo,[],1)));%%
title('RD Ƶ�׷���');
text(200,-40,'ͼ2��ԭʼ���ݱ仯�������������Ͷ�άƵ������');       % ��ͼ2��������˵�� 
subplot(2,2,2);
imagesc(angle(fft(s_echo,[],1)));
title('RD Ƶ����λ');
subplot(2,2,3);
imagesc(abs(fft2(s_echo)));
title('��άƵ�׷���');
subplot(2,2,4);
imagesc(angle(fft2(s_echo)));
title('��άƵ����λ');
% colormap(gray);

%%
% --------------------------------------------------------------------
% ����ѹ��
% --------------------------------------------------------------------
S_range = fft(s_echo,NFFT_r,2);     % ���о�������Ҷ�任����Ƶ�����ˡ�
%fft(X,[],2)�Ƕ�X�ĵڶ���ά�ȣ�Ҳ����row������Ҷ�任���У�
%
% ��ͼ
% ͼ2��������Ƶ�򣬷�λʱ��Ƶ�ף�δ����ѹ����
figure('NumberTitle', 'off', 'Name', '��ԭʼ���ݱ任������άƵ��֮����л�ͼ');

subplot(1,2,1);
% mesh(real(S_range));
imagesc(real(S_range));
title('��a��ʵ��');
xlabel('����Ƶ�򣨲����㣩');
ylabel('��λʱ�򣨲����㣩');
text(280,-60,'ͼ2������Ƶ��');       % ��ͼ2��������˵��
text(340,-10,'δѹ��');       
text(200,-40,'ͼ3��ԭʼ���ݱ仯����άƵ������');       % ��ͼ2��������˵�� 
subplot(1,2,2);
% mesh(abs(S_range));
imagesc(abs(S_range));
title('��b������');
xlabel('����Ƶ�򣨲����㣩');
ylabel('��λʱ�򣨲����㣩');
%}
%%
%�Իز����ݽ��д���
%�����ɾ�����ƥ���˲���
% ====================================================
% ���÷�ʽ2
% ʱ�������壬ĩ�˲��㣬fft����ȡ�����
% t_ref = ( -Nr/2 : (Nr/2-1) )/Fr;    % �������ɾ���MF�ľ���ʱ����
% t_ref_mtx = ones(Naz,1)*t_ref;      % ������ʽ
% w_ref = kaiser(Nr,2.5);             % �����򣬹���Kaiser������Ϊ��������
% w_ref = ones(Naz,1)*(w_ref.');      % ���ɾ�����ʽ��ÿһ�ж���ͬ�ļӴ���
% 
% 
%   s_ref = exp((1j*pi*Kr).*((t_ref_mtx).^2)); % ���ƣ����䣩���壬δ�Ӵ���
% %   s_ref = w_ref.*exp((1j*pi*Kr).*((t_ref_mtx).^2)); % ���ƣ����䣩���壬���˴���
% %����Ϊ���ƵĻ����źţ��鱾P49 ��ʽ3.26
% 
% s_ref = [s_ref,zeros(Naz,floor(Nrg-Nr))];      % �Ը������壬��˲��㡣
%  %ʱ�����൱��Ƶ���ֵ�������������Ƶ��Ĳ�ֵ������ʹ�����߿��������⻬,�и��õķֱ���
%  
% S_ref = fft(s_ref,NFFT_r,2);            % ��������ľ��븵��Ҷ�任����Ƶ�����ˡ�
% H_range = conj(S_ref);                  % ������ƥ���˲�������Ƶ�����ˡ�%conj������������ֵ���˴����ɾ�����ƥ���˲���
% S_range_c = S_range.*H_range;           % ����ƥ���˲�������Ƶ�����ˡ�    ����ѹ�����ǳ�����ƥ���˲���
% s_rc = ifft(S_range_c,[],2);            % ��ɾ���ѹ�����ص���άʱ��
[s_rc,S_range_c ] = Distance_Plus_Compress(s_echo,Nr,Naz,Nrg,Fr,Kr);
% s_rc�ĳ���Ϊ��Naz*Nrg��δȥ����������
%%
% ��s_rc����ȥ���������Ĳ������鱾P22ҳ����
% ����������Ϊ��2*��Nr-1��
% ���ǽ�ȡ�ĳ��ȣ���Nrg-Nr+1������Ϊ N_rg����ȫ����ĳ���
N_rg = Nrg-Nr+1;                        % ��ȫ����ĳ���
N_rg = floor(N_rg);
s_rc_c = zeros(Naz,N_rg);               % �������ȥ���������������
s_rc_c = s_rc(:,1:N_rg);                % ȡǰ N_rg�С�
% ====================================================
%%
%
% ��ͼ
% ͼ3��������Ƶ�򣬷�λʱ��Ƶ�ף��Ѿ���ѹ����
figure('NumberTitle', 'off', 'Name', '����ѹ��֮���ͼ��');
subplot(1,2,1);
% mesh(real(S_range_c));
imagesc(real(S_range_c));
title('��a��ʵ��');
xlabel('����Ƶ�򣨲����㣩');
ylabel('��λʱ�򣨲����㣩');
text(280,-60,'ͼ3������Ƶ��');       % ��ͼ3��������˵��
text(340,-10,'��ѹ��');       

subplot(1,2,2);
% mesh(abs(S_range_c));
imagesc(abs(S_range_c));
title('��b������');
xlabel('����Ƶ�򣨲����㣩');
ylabel('��λʱ�򣨲����㣩');
%}
%
% ��ͼ
% ͼ4������άʱ����ɾ���ѹ����
figure('NumberTitle', 'off', 'Name', '����ѹ��֮��ص�ʱ���ͼ��');
subplot(1,2,1);
% mesh(real(s_rc_c));  
 imagesc(real(s_rc_c));  %���⼰�����£���ֱ��ʹ��ȥ����������Ľ��
title('��a��ʵ��');
xlabel('����ʱ�򣨲����㣩');
ylabel('��λʱ�򣨲����㣩');
text(150,-60,'ͼ4����άʱ��');       % ��ͼ4��������˵��
text(172,-10,'���ѹ��');       

subplot(1,2,2);
% mesh(abs(s_rc_c));
imagesc(abs(s_rc_c));
title('��b������');
xlabel('����ʱ�򣨲����㣩');
ylabel('��λʱ�򣨲����㣩');
%}

%%
% --------------------------------------------------------------------
% �任������������򣬽��о����㶯У��
% --------------------------------------------------------------------
s_rc_c = s_rc_c.*exp(-1j*2*pi*fnc.*(ta.'*ones(1,N_rg)));    % ���ݰ���
S_rd = fft(s_rc_c,NFFT_a,1);            % ��λ����Ҷ�任���������������
% ====================================================================
% ���÷�λƵ���ᡪ���ؼ��㣡����
fa = fnc + fftshift(-NFFT_a/2:NFFT_a/2-1)/NFFT_a*Fa;    % ��λƵ����������á�
% =====================================================================
tr_RCMC = 2*x1/c + ( -N_rg/2 : (N_rg/2-1) )/Fr;   % ���µľ����߳����µ�ʱ���ᡣ

R0_RCMC = (c/2).*tr_RCMC*cos(sita_r_c);       % ������߱仯��R0����ΪR0_RCMC����������RCM��Ka��

delta_Rrd_fn = lamda^2.*((fa.').^2)*(R0_RCMC)/(8*Vr^2);%�����ҪУ���ľ����㶯

num_range = c/(2*Fr);   % һ�����������Ԫ����Ӧ�ĳ���
delta_Rrd_fn_num = delta_Rrd_fn./num_range; % ÿһ����λ��Ƶ�ʣ���RCM��Ӧ�ľ��������Ԫ��
% h = waitbar(0,'Sinc��ֵ');
R = 8;  % sinc��ֵ�˳���
S_rd_rcmc = zeros(NFFT_a,N_rg); % �������RCMC���ֵ
for p = 1 : NFFT_a
    for q = 1 : N_rg     % ��ʱ������ĳ����� (Nrg-Nr+1)=N_rg        
        delta_Rrd_fn_p = delta_Rrd_fn_num(p,q);%��ÿһ����λ��Ƶ�ʶ��ڵ�RCM��Ӧ�ľ��������Ԫ���ó�
        Rrd_fn_p = q + delta_Rrd_fn_p;%ͬһ����λ��Ƶ�ʶ�Ӧ�ľ�����������RCM��Ӧ�Ĳ�����Ԫ��
        Rrd_fn_p_zheng = ceil(Rrd_fn_p);        % ceil������ȡ����
        %����ʽЧ����ͬ��������⡣һ������ȥ��С����Ϊ����������ʽ�м�Ҫ-1
         ii=Rrd_fn_p-((Rrd_fn_p_zheng-R/2):1:(Rrd_fn_p_zheng+R/2-1));
%          ii = ( Rrd_fn_p-(Rrd_fn_p_zheng-R/2):-1:Rrd_fn_p-(Rrd_fn_p_zheng+R/2-1));        
        rcmc_sinc = sinc(ii);
        rcmc_sinc = rcmc_sinc/sum(rcmc_sinc);   % ��ֵ�˵Ĺ�һ��
        % ii ��sinc��ֵ���̵ı���;
        % g(x)=sum(h(ii)*g_d(x-ii)) = sum(h(ii)*g_d(ll));
        %����дΪg(x)=sum(g_d(x)*sinc(x-i))P31       
        
        % ����S_rdֻ��������ȡֵ���ҷ�Χ���ޡ���˲�ֵ��Ҫ��������ȡֵ����߽����⡣
        % �����Ҳ�ȡѭ����λ��˼�룬�������ȡֵ������⡣
        if (Rrd_fn_p_zheng-R/2) > N_rg    % ȫ����
            ll = (Rrd_fn_p_zheng-R/2-N_rg:1:Rrd_fn_p_zheng+R/2-1-N_rg);
        else
            if (Rrd_fn_p_zheng+R/2-1) > N_rg    % ��������
                ll_1 = (Rrd_fn_p_zheng-R/2:1:N_rg);
                ll_2 = (1:1:Rrd_fn_p_zheng+R/2-1-N_rg);
                ll = [ll_1,ll_2];
            else
                if (Rrd_fn_p_zheng+R/2-1) < 1    % ȫ���磨�����ܷ�����������Ҫ���ǣ�
                    ll = (Rrd_fn_p_zheng-R/2+N_rg:1:Rrd_fn_p_zheng+R/2-1+N_rg);
                else
                    if (Rrd_fn_p_zheng-R/2) < 1       % ��������
                        ll_1 = (Rrd_fn_p_zheng-R/2+N_rg:1:N_rg);
                        ll_2 = (1:1:Rrd_fn_p_zheng+R/2-1);
                        ll = [ll_1,ll_2];
                    else
                        ll = (Rrd_fn_p_zheng-R/2:1:Rrd_fn_p_zheng+R/2-1);
                    end                    
                end
            end
        end   
        rcmc_S_rd = S_rd(p,ll);
        S_rd_rcmc(p,q) = sum( rcmc_sinc.*rcmc_S_rd );
    end
end
% S_rd_rcmc ����RCMC��ľ����������Ƶ�ס�
% close(h);
% ��ͼ
% ͼ5���������������δRCMC��
figure('NumberTitle', 'off', 'Name', 'δ�����㶯У��֮���ͼ��');
subplot(1,2,1);
imagesc(real(S_rd));
title('��a��ʵ��');
xlabel('����ʱ�򣨲����㣩');
ylabel('��λƵ�򣨲����㣩');
text(150,-60,'ͼ5�������������');       % ��ͼ5��������˵��
text(172,-10,'δRCMC');       
subplot(1,2,2);
imagesc(abs(S_rd));
title('��b������');
xlabel('����ʱ�򣨲����㣩');
ylabel('��λƵ�򣨲����㣩');

% ��ͼ
% ͼ6���������������RCMC��Ľ��
figure('NumberTitle', 'off', 'Name', '�����㶯У��֮���ͼ��');
subplot(1,2,1);
imagesc(real(S_rd_rcmc));
title('��a��ʵ��');
xlabel('����ʱ�򣨲����㣩');
ylabel('��λƵ�򣨲����㣩');
text(150,-60,'ͼ6�������������');       % ��ͼ6��������˵��
text(172,-10,'��RCMC');       

subplot(1,2,2);
imagesc(abs(S_rd_rcmc));
title('��b������');
xlabel('����ʱ�򣨲����㣩');
ylabel('��λƵ�򣨲����㣩');
%}

%%
% --------------------------------------------------------------------
% ��λѹ��
% --------------------------------------------------------------------
fa_azimuth_MF = fa;         % ��λƵ���ᣬ���ú�RCMC�����õ�Ƶ������ͬ��
Ka = 2*Vr^2*(cos(sita_r_c))^3./(lamda.* R0_RCMC);  	% ��λ���Ƶ�ʣ��������б��R0�仯�ġ��鱾P86
Ka_1 = 1./Ka;                                       % Ϊ�˷�����㣬��ȡ������
Haz = exp( -1j*pi.*(((fa_azimuth_MF).').^2*Ka_1) );	% ��λ��ƥ���˲���
% ����Ҫע�⣬���ɵ�MF����Ƶ�Ȳ��������ˣ�Ҳ���������ĵġ�
% ������Ƶ������ʲô���ģ���ϵ������ע��fa�Ĺ��ɡ�
% �����Ƶ����;����������ķ�λƵ���Ƕ�Ӧ�ġ�
%%
%��λ��ѹ���Ӵ���������
w_ref_a = kaiser(N_rg,2.5);             % ��λ�򣬹���Kaiser������Ϊ��������
w_ref_a = ones(Naz,1)*(w_ref_a.');      % ���ɾ�����ʽ��ÿһ�ж���ͬ�ļӴ���
Haz=fft(ifft(Haz).*w_ref_a);
%%
S_rd_c = S_rd_rcmc.*Haz;            % ����ƥ���˲���

s_ac = ifft(S_rd_c,[],1);       	% ��ɷ�λѹ�����䵽ͼ���򡣽�����

% ��ͼ
% ͼ7����������
figure('NumberTitle', 'off', 'Name', '������λ��ѹ��֮��ص���άʱ��ͼ��');
% mesh(abs(s_ac));
 imagesc(abs(s_ac));
title('��Ŀ�����');
xlabel('����ʱ�򣨲����㣩');
ylabel('��λʱ�򣨲����㣩');     

%%
% ����ͨ�����ú������õ�������Ŀ����Ե���Ƭ��������������
% ͬʱ�Ե�Ŀ����������������Ƭ����λ����Ƭ
% �������Ӧ��ָ�꣺PSLR��ISLR��IRW,չ��ϵ��

NN =32;
% �ֱ�õ�ÿ����Ŀ�����Ƭ�Ŵ�����Ƭ������Ƭ������Ӧ��ָ��
% % % Ŀ��1����Ŀ�������� ����Naz/2+1����86��
target_1 = target_analysis( s_ac((Naz/2+1)-NN:(Naz/2+1)+NN,86-NN:86+NN),Fr,Fa,Vr,L_range,L_azimuth);
% 
% % % Ŀ��2����Ŀ�������� ����Naz/2+1+delta_R1/Vr*Fa��,86��
% tg_2_delatx = (Naz/2+1 + delta_R1/Vr*Fa);
% target_2 = target_analysis( s_ac(tg_2_delatx-NN:tg_2_delatx+NN,86-NN:86+NN),Fr,Fa,Vr);
% 
% % % Ŀ��3
% tg_3_delatx = tg_2_delatx + delta_R2*tan(sita_r_c)/Vr*Fa;
% tg_3_delaty = 2*delta_R2/c*Fr;
% target_3 = target_analysis( s_ac(tg_3_delatx-NN:tg_3_delatx+NN,86+tg_3_delaty-NN:86+tg_3_delaty+NN),Fr,Fa,Vr);
% 
% 
