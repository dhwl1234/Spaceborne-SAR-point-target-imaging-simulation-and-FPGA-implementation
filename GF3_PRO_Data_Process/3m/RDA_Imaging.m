function [sig] =RDA_Imaging(sig,para)
%RDA_Imaging_02
%������Ӵ���
%Ӧ���ǳɹ���
c 		= para.c;
Ba 		= para.Ba;
Br 		= para.B;
f0 		= para.Fc;
Kr 		= para.Kr;	
Fa  	= para.prf;	
Fr 		= para.Fs;	
fdc 	= para.Fdc;
Vr 		= para.Vr;
R0 		= para.Rs;
Tp      = para.Tp;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lambda = c/f0;
[Nr,Na]= size(sig);
% Nr_valid = Tp*Fr;
sub_Nr  = round(Br/Fr*Nr/2)*2;%����Ч�������ݿ��
win1    = zeros(Nr ,1);
win1(end/2-sub_Nr/2+1:end/2+sub_Nr/2) = kaiser(sub_Nr,0.65);

sub_Na = round(Ba/Fa*Na/2)*2;
win2   = zeros(1,Na);
win2(end/2-sub_Na/2+1:end/2+sub_Na/2)=kaiser(sub_Na,0.8).';%��λ��Ӵ�


%%
%dim 1���з��� 2���з���
%��������
Zr = ceil(Tp*Fr);%��������
% sig = cat(1,sig,zeros(Zr,Na));
%%
%����ʱ����
squint_theta = asin(fdc*lambda/2/Vr);%���ö���������Ƶ����б�ӽ�4.33
dly0 = 2*R0/cos(squint_theta)/c;%�ӳ�ʱ��   
t_a  = ((-Na/2:Na/2-1)/Fa);
t_r  = ((-Nr/2:Nr/2-1)/Fr+dly0);     
f_r  = (-Nr/2:Nr/2-1)/Nr*Fr;
f_a  = (-Na/2:Na/2-1)/Na*Fa + fdc;
f_r  = f_r.'*ones(1,Na);
%%
%����ѹ��
S_ref = exp(1i*pi*(f_r.^2)/Kr);
S_range = fftshift(fft(fftshift(sig,1),Nr,1),1);     % ���о�������Ҷ�任����Ƶ�����ˡ�
S_range_c = S_range.*S_ref;  %����Ƶ��ƥ���˲���
S_range_c = S_range_c.*(win1*ones(1,Na));
s_rc = fftshift(ifft(fftshift(S_range_c,1),[],1),1);            % ��ɾ���ѹ�����ص���άʱ��
N_rg = Nr;                        % ��ȫ����ĳ���
s_rc_c = s_rc(1:N_rg,:);                % ȡǰ N_rg�С�
clear S_range_c  S_range S_ref s_rc
%%
%ֵ��ע�������ߵ����Ƿ�λ�����Ǿ�����
%1���з���2���з���
%%%%%%%%%%%%����ѹ��%%%%%%%%%%%%%%
%%%%%%%%%%% FDC_compensition %%%%%%%%%%%%%%%%
ph_fdc = exp(-1i*2*pi*fdc*t_a);
s_rc_c   = s_rc_c.*(ones(N_rg ,1)*ph_fdc);
%%%%%%%%%%%%%%%% a_fft %%%%%%%%%%%%%%%%%%%%%%
S_rd= fftshift(fft(fftshift(s_rc_c,2),[],2),2);%��������������
clear s_rc_c
% S_rd = S_rd.*(ones(N_rg,1)*win2);%��λ��Ӵ�
%%
tr_RCMC = ( -N_rg/2 : (N_rg/2-1) )/Fr+dly0;   % ���µľ����߳����µ�ʱ���ᡣ
R0_RCMC =((c/2).*tr_RCMC*cos(squint_theta )).';       % ������߱仯��R0����ΪR0_RCMC����������RCM��Ka��
delta_Rrd_fn = (R0_RCMC)/(8*Vr^2)*(lambda^2.*((f_a).^2));%�����ҪУ���ľ����㶯
num_range = c/(2*Fr);   % һ�����������Ԫ����Ӧ�ĳ���
delta_Rrd_fn_num = delta_Rrd_fn./num_range; % ÿһ����λ��Ƶ�ʣ���RCM��Ӧ�ľ��������Ԫ��
R = 8;  % sinc��ֵ�˳���
S_rd_rcmc = zeros(N_rg,Na); % �������RCMC���ֵ
% h = waitbar(0,'Sinc��ֵ');
parfor p = 1 : Na
    for q = 1 : N_rg     % ��ʱ������ĳ����� (Nrg-Nr+1)=N_rg        
        delta_Rrd_fn_p = delta_Rrd_fn_num(q,p);%��ÿһ����λ��Ƶ�ʶ��ڵ�RCM��Ӧ�ľ��������Ԫ���ó�
        Rrd_fn_p = q + delta_Rrd_fn_p;%ͬһ����λ��Ƶ�ʶ�Ӧ�ľ�����������RCM��Ӧ�Ĳ�����Ԫ��
        Rrd_fn_p_zheng = ceil(Rrd_fn_p);        % ceil������ȡ����
        %����ʽЧ����ͬ��������⡣һ������ȥ��С����Ϊ����������ʽ�м�Ҫ-1
         ii=Rrd_fn_p-((Rrd_fn_p_zheng-R/2):1:(Rrd_fn_p_zheng+R/2-1));
        rcmc_sinc = sinc(ii);
        rcmc_sinc = (rcmc_sinc/sum(rcmc_sinc)).';   % ��ֵ�˵Ĺ�һ��
        % ����S_rdֻ��������ȡֵ���ҷ�Χ���ޡ���˲�ֵ��Ҫ��������ȡֵ����߽����⡣
        % �����Ҳ�ȡѭ����λ��˼�룬�������ȡֵ������⡣
        if (Rrd_fn_p_zheng-R/2) > N_rg    % ȫ����
            ll = (Rrd_fn_p_zheng-R/2-N_rg:1:Rrd_fn_p_zheng+R/2-1-N_rg).';
        else
            if (Rrd_fn_p_zheng+R/2-1) > N_rg    % ��������
                ll_1 = (Rrd_fn_p_zheng-R/2:1:N_rg);
                ll_2 = (1:1:Rrd_fn_p_zheng+R/2-1-N_rg);
                ll = [ll_1,ll_2].';
            else
                if (Rrd_fn_p_zheng+R/2-1) < 1    % ȫ���磨�����ܷ�����������Ҫ���ǣ�
                    ll = (Rrd_fn_p_zheng-R/2+N_rg:1:Rrd_fn_p_zheng+R/2-1+N_rg).';
                else
                    if (Rrd_fn_p_zheng-R/2) < 1       % ��������
                        ll_1 = (Rrd_fn_p_zheng-R/2+N_rg:1:N_rg);
                        ll_2 = (1:1:Rrd_fn_p_zheng+R/2-1);
                        ll = [ll_1,ll_2].';
                    else
                        ll = (Rrd_fn_p_zheng-R/2:1:Rrd_fn_p_zheng+R/2-1).';
                    end                    
                end
            end
        end   
        rcmc_S_rd = S_rd(ll,p);
        S_rd_rcmc(q,p) = sum( rcmc_sinc.*rcmc_S_rd );  
    end
%     waitbar(p/Na);
end
%  close(h);
%%��λѹ��
S_rd_rcmc = S_rd_rcmc.*(ones(N_rg,1)*win2);%��λ��Ӵ�
fa_azimuth_MF = f_a;         % ��λƵ���ᣬ���ú�RCMC�����õ�Ƶ������ͬ��
Ka = 2*Vr^2*(cos(squint_theta))^3./(lambda.* R0_RCMC.*ones(1,Na));  	% ��λ���Ƶ�ʣ��������б��R0�仯�ġ��鱾P86
Ka_1 = 1./Ka;     
Haz = exp( -1j*pi.*((fa_azimuth_MF).^2.*Ka_1) );	% ��λ��ƥ���˲���
%%
S_rd_c = S_rd_rcmc.*Haz;            % ����ƥ���˲���

sig = fftshift(ifft(fftshift(S_rd_c,2),[],2),2);       	% ��ɷ�λѹ�����䵽ͼ���򡣽�����
clear S_rd_rcmc  S_rd_c
end