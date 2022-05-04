%%
%���������µ�RDA,���Ǹ߶�
%����ѡȡ���ϳɿ׾��״�����㷨��ʵ�֡�P90ҳ�����״����ֵ
%��c���Ρ�10m���߼����£����������SEASAT��J-RES,ERS,RADARSAT-1��ENVISATң���������ò�������
%%
clear;
close all;
clc;
%%
%�������

c=3e8;%����
R_nc =850e3;%������б��850KM
H =800e3;%���Ƿ��и߶�
f0 = 5.3e9;%�״﹤��Ƶ��5.3Ghz
%  lambda = 0.057;%����
 lambda = c/f0;
%���������
Tr =40e-6;%��������ʱ�� 40us
Kr = 0.5e12;%0.5Mhz/s��λ���Ƶ��
BW_range = Kr*Tr;%20MHZ��λ�����
Fr =24e6;%�����������
L_range_stripe = 50e3;% б���������50KM


%��λ�����
Vr = 7100;%�״���Ч�ٶ�

Ka =2095;%��λ���Ƶ��
La = 10;%���߳���10m
Ls=4.8e3;%���صĺϳɿ׾����ȱȻ��ؼ��㷽ʽ��ͬ���úϳɽ���ϳɿ׾�����
% Ls=beta_bw_syn*R_nc;
Ta = 0.64;%��λ��ʱ��Ŀ������ʱ��
BW_dop = 1338;%�����մ���
Fa = 1700;%��λ�������PRF

%%
%��������
Vs = Vr*1.06;%����õ������ٶ�
Vg = Vr*0.94; 
beta_bw = 0.886*lambda/La;%��λ�������
beta_bw_syn = Vs/Vg*beta_bw;%�ϳɽ�
theta_r_c =2.3*pi/180;%3�ȵ�б��
fnc = 2*Vr*sin(theta_r_c)/lambda;     % ����������Ƶ�ʣ����ݹ�ʽ��4.33�����㡣
Mamb = round(fnc/Fa);   % ������ģ��
L_range=0.886*c/(2*abs(Kr)*Tr);%����ά���۷ֱ���
%  L_azimuth=La/2;%��λά���۷ֱ���
 L_azimuth=(0.886*lambda)/(2*beta_bw_syn);%��λά���۷ֱ���
R0=R_nc*cos(theta_r_c);%���Ǹ߶ȵ����б��
Nr = Tr*Fr;             % ���Ե�Ƶ�źŲ�����������ά
%���þ�����
% Nrg = ceil((2*R0/c+Tr*Fr)*1.5);% ��Ч�������߸����������֮һ�Ŀ��
Nrg = ceil(L_range_stripe/c*Fr);
Naz = ceil(Ls/Vr*Fa*1.5);% ��Ч����1.5������

%���ø���Ҷ�仯�ĳ���
NFFT_r = Nrg;           % ������FFT����
NFFT_a = Naz;           % ��λ��FFT����

%%
%%
% --------------------------------------------------------------------
% �趨�����Ŀ���λ��
% �Ծ�������Ϊx��������
% �Է�λ����Ϊy��������
% -------------------------------------------------------------------- 
delta_R0 = 0;       % ��Ŀ��1�Ĳ������Ĵ�Խʱ�̣�����Ϊ��λ��ʱ����㡣


% Ŀ��1
x1 = R0;            % Ŀ��1�ľ��������
y1 = delta_R0 + x1*tan(theta_r_c);	% Ŀ��1�ķ�λ�����

% �����������飬���ڴ���
x_range = [x1];
y_azimuth = [y1];

% ��������Ŀ����ԵĲ������Ĵ�Խʱ��
nc_1 = (y1-x1*tan(theta_r_c))/Vr;    % Ŀ��1�Ĳ������Ĵ�Խʱ�̡�

nc_target = [nc_1];       % ��������飬���ڴ���
%% 
% --------------------------------------------------------------------
% ���루��λ����ʱ�䣬Ƶ����ض���
% --------------------------------------------------------------------
% ����
tr = 2 *R0/c + ( -Nrg/2 : (Nrg/2-1) )/Fr;                % ����ʱ����
fr = ( -NFFT_r/2 : NFFT_r/2-1 )*( Fr/NFFT_r );          % ����Ƶ����
% ��λ
ta = ( -Naz/2: Naz/2-1 )/Fa;                            % ��λʱ����
fa = fnc + ( -NFFT_a/2 : NFFT_a/2-1 )*( Fa/NFFT_a );	% ��λƵ����

% ���ɾ��루��λ��ʱ�䣨Ƶ�ʣ�����
tr_mtx = ones(Naz,1)*tr;    % ����ʱ������󣬴�С��Naz*Nrg
ta_mtx = ta'.*ones(1,Nrg);  % ��λʱ������󣬴�С��Naz*Nrg

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
t_ref = ( -Nr/2 : (Nr/2-1) )/Fr;    % �������ɾ���MF�ľ���ʱ����
t_ref_mtx = ones(Naz,1)*t_ref;      % ������ʽ
w_ref = kaiser(Nr,2.5);             % �����򣬹���Kaiser������Ϊ��������
w_ref = ones(Naz,1)*(w_ref.');      % ���ɾ�����ʽ��ÿһ�ж���ͬ�ļӴ���


  s_ref = exp((1j*pi*Kr).*((t_ref_mtx).^2)); % ���ƣ����䣩���壬δ�Ӵ���
%   s_ref = w_ref.*exp((1j*pi*Kr).*((t_ref_mtx).^2)); % ���ƣ����䣩���壬���˴���
%����Ϊ���ƵĻ����źţ��鱾P49 ��ʽ3.26

s_ref = [s_ref,zeros(Naz,floor(Nrg-Nr))];      % �Ը������壬��˲��㡣
 %ʱ�����൱��Ƶ���ֵ�������������Ƶ��Ĳ�ֵ������ʹ�����߿��������⻬,�и��õķֱ���
 
S_ref = fft(s_ref,NFFT_r,2);            % ��������ľ��븵��Ҷ�任����Ƶ�����ˡ�
H_range = conj(S_ref);                  % ������ƥ���˲�������Ƶ�����ˡ�%conj������������ֵ���˴����ɾ�����ƥ���˲���
S_range_c = S_range.*H_range;           % ����ƥ���˲�������Ƶ�����ˡ�    ����ѹ�����ǳ�����ƥ���˲���
s_rc = ifft(S_range_c,[],2);            % ��ɾ���ѹ�����ص���άʱ��
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

R0_RCMC = (c/2).*tr_RCMC*cos(theta_r_c);       % ������߱仯��R0����ΪR0_RCMC����������RCM��Ka��

delta_Rrd_fn = lambda^2.*((fa.').^2)*(R0_RCMC)/(8*Vr^2);%�����ҪУ���ľ����㶯

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
 Ka = 2*Vr^2*(cos(theta_r_c))^3./(lambda.* R0_RCMC);  	% ��λ���Ƶ�ʣ��������б��R0�仯�ġ��鱾P86
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
% �������Ӧ��ָ�꣺PSLR��ISLR��IRW

NN = 20;
% �ֱ�õ�ÿ����Ŀ�����Ƭ�Ŵ�����Ƭ������Ƭ������Ӧ��ָ��
% Ŀ��1����Ŀ�������� �� tg_1_x��tg_1_y ��
% ����б�ӽ�ʱ����λ��λ��Ҫͨ�����µķ�ʽ���㡣���³������������Ҳ���ݣ����£�
tg_1_x = rem( R_nc*tan(theta_r_c)/Vr*Fa , Naz );
if tg_1_x < Naz/2
    tg_1_x = tg_1_x + (Naz/2+1);
else
    tg_1_x = tg_1_x - (Naz/2+1);
end
tg_1_x = round(tg_1_x);    	% �������룬�õ�����ֵ����Ϊ��Ŀ��ķ�λ�������ꡣ
% ����õ��� tg_1_x ���ǵ�Ŀ�����ķ�λ���λ�ã����꣩��
% tg_1_x = 417;
tg_1_y = round(N_rg/2);
target_1 = target_analysis_2( s_ac(tg_1_x-NN:tg_1_x+NN,tg_1_y-NN:tg_1_y+NN),Fr,Fa,Vr,L_range,L_azimuth);
% 
% % Ŀ��2����Ŀ�������� ��tg_2_x��target_2_y��
% tg_2_x = tg_1_x + delta_R1/Vr*Fa;
% tg_2_y = tg_1_y;
% % target_2 = target_analysis_2( s_ac(tg_2_x-NN:tg_2_x+NN,tg_2_y-NN:tg_2_y+NN),Fr,Fa,Vr);
% 
% % Ŀ��3����Ŀ�������ڣ�tg_3_x��tg_3_y��
% tg_3_x = tg_2_x + delta_R2*tan(sita_r_c)/Vr*Fa;
% tg_3_x = fix(tg_3_x);
% tg_3_y = tg_2_y + 2*delta_R2/c*Fr;
% % target_3 = target_analysis_2( s_ac(tg_3_x-NN:tg_3_x+NN,tg_3_y-NN:tg_3_y+NN),Fr,Fa,Vr);




