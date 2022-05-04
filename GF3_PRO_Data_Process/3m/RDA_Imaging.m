function [sig] =RDA_Imaging(sig,para)
%RDA_Imaging_02
%距离向加窗，
%应该是成功的
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
sub_Nr  = round(Br/Fr*Nr/2)*2;%求有效成像数据宽度
win1    = zeros(Nr ,1);
win1(end/2-sub_Nr/2+1:end/2+sub_Nr/2) = kaiser(sub_Nr,0.65);

sub_Na = round(Ba/Fa*Na/2)*2;
win2   = zeros(1,Na);
win2(end/2-sub_Na/2+1:end/2+sub_Na/2)=kaiser(sub_Na,0.8).';%方位向加窗


%%
%dim 1是列方向 2是行方向
%距离向补零
Zr = ceil(Tp*Fr);%距离向补零
% sig = cat(1,sig,zeros(Zr,Na));
%%
%设置时间轴
squint_theta = asin(fdc*lambda/2/Vr);%利用多普勒中心频率求斜视角4.33
dly0 = 2*R0/cos(squint_theta)/c;%延迟时间   
t_a  = ((-Na/2:Na/2-1)/Fa);
t_r  = ((-Nr/2:Nr/2-1)/Fr+dly0);     
f_r  = (-Nr/2:Nr/2-1)/Nr*Fr;
f_a  = (-Na/2:Na/2-1)/Na*Fa + fdc;
f_r  = f_r.'*ones(1,Na);
%%
%距离压缩
S_ref = exp(1i*pi*(f_r.^2)/Kr);
S_range = fftshift(fft(fftshift(sig,1),Nr,1),1);     % 进行距离向傅里叶变换，零频在两端。
S_range_c = S_range.*S_ref;  %乘上频域匹配滤波器
S_range_c = S_range_c.*(win1*ones(1,Na));
s_rc = fftshift(ifft(fftshift(S_range_c,1),[],1),1);            % 完成距离压缩，回到二维时域。
N_rg = Nr;                        % 完全卷积的长度
s_rc_c = s_rc(1:N_rg,:);                % 取前 N_rg列。
clear S_range_c  S_range S_ref s_rc
%%
%值得注意的是这边的行是方位向，列是距离向
%1是列方向，2是行方向
%%%%%%%%%%%%距离压缩%%%%%%%%%%%%%%
%%%%%%%%%%% FDC_compensition %%%%%%%%%%%%%%%%
ph_fdc = exp(-1i*2*pi*fdc*t_a);
s_rc_c   = s_rc_c.*(ones(N_rg ,1)*ph_fdc);
%%%%%%%%%%%%%%%% a_fft %%%%%%%%%%%%%%%%%%%%%%
S_rd= fftshift(fft(fftshift(s_rc_c,2),[],2),2);%进入距离多普勒域
clear s_rc_c
% S_rd = S_rd.*(ones(N_rg,1)*win2);%方位向加窗
%%
tr_RCMC = ( -N_rg/2 : (N_rg/2-1) )/Fr+dly0;   % 在新的距离线长度下的时间轴。
R0_RCMC =((c/2).*tr_RCMC*cos(squint_theta )).';       % 随距离线变化的R0，记为R0_RCMC，用来计算RCM和Ka。
delta_Rrd_fn = (R0_RCMC)/(8*Vr^2)*(lambda^2.*((f_a).^2));%求出需要校正的距离徙动
num_range = c/(2*Fr);   % 一个距离采样单元，对应的长度
delta_Rrd_fn_num = delta_Rrd_fn./num_range; % 每一个方位向频率，其RCM对应的距离采样单元数
R = 8;  % sinc插值核长度
S_rd_rcmc = zeros(N_rg,Na); % 用来存放RCMC后的值
% h = waitbar(0,'Sinc插值');
parfor p = 1 : Na
    for q = 1 : N_rg     % 此时距离向的长度是 (Nrg-Nr+1)=N_rg        
        delta_Rrd_fn_p = delta_Rrd_fn_num(q,p);%将每一个方位向频率对于的RCM对应的距离采样单元数拿出
        Rrd_fn_p = q + delta_Rrd_fn_p;%同一个方位向频率对应的距离采样点加上RCM对应的采样单元数
        Rrd_fn_p_zheng = ceil(Rrd_fn_p);        % ceil，向上取整。
        %与下式效果相同，更好理解。一个数减去更小的数为更大所以下式中间要-1
         ii=Rrd_fn_p-((Rrd_fn_p_zheng-R/2):1:(Rrd_fn_p_zheng+R/2-1));
        rcmc_sinc = sinc(ii);
        rcmc_sinc = (rcmc_sinc/sum(rcmc_sinc)).';   % 插值核的归一化
        % 由于S_rd只有整数点取值，且范围有限。因此插值中要考虑它的取值溢出边界问题。
        % 这里我采取循环移位的思想，用来解决取值溢出问题。
        if (Rrd_fn_p_zheng-R/2) > N_rg    % 全右溢
            ll = (Rrd_fn_p_zheng-R/2-N_rg:1:Rrd_fn_p_zheng+R/2-1-N_rg).';
        else
            if (Rrd_fn_p_zheng+R/2-1) > N_rg    % 部分右溢
                ll_1 = (Rrd_fn_p_zheng-R/2:1:N_rg);
                ll_2 = (1:1:Rrd_fn_p_zheng+R/2-1-N_rg);
                ll = [ll_1,ll_2].';
            else
                if (Rrd_fn_p_zheng+R/2-1) < 1    % 全左溢（不可能发生，但还是要考虑）
                    ll = (Rrd_fn_p_zheng-R/2+N_rg:1:Rrd_fn_p_zheng+R/2-1+N_rg).';
                else
                    if (Rrd_fn_p_zheng-R/2) < 1       % 部分左溢
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
%%方位压缩
S_rd_rcmc = S_rd_rcmc.*(ones(N_rg,1)*win2);%方位向加窗
fa_azimuth_MF = f_a;         % 方位频率轴，采用和RCMC中所用的频率轴相同。
Ka = 2*Vr^2*(cos(squint_theta))^3./(lambda.* R0_RCMC.*ones(1,Na));  	% 方位向调频率，是随最近斜距R0变化的。书本P86
Ka_1 = 1./Ka;     
Haz = exp( -1j*pi.*((fa_azimuth_MF).^2.*Ka_1) );	% 方位向匹配滤波器
%%
S_rd_c = S_rd_rcmc.*Haz;            % 乘以匹配滤波器

sig = fftshift(ifft(fftshift(S_rd_c,2),[],2),2);       	% 完成方位压缩，变到图像域。结束。
clear S_rd_rcmc  S_rd_c
end