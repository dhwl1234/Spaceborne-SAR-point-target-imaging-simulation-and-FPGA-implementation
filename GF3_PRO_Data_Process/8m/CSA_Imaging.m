function [sig] =CSA_Imaging(sig,para)
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

lambda = c/f0;
[Nr,Na]= size(sig);

sub_Nr  = round(Br/Fr*Nr/2)*2;%求有效成像数据宽度
win1    = zeros(Nr,1);
win1(end/2-sub_Nr/2+1:end/2+sub_Nr/2) = kaiser(sub_Nr,2.500);

sub_Na = round(Ba/Fa*Na/2)*2;
win2   = zeros(1,Na);
win2(end/2-sub_Na/2+1:end/2+sub_Na/2)=kaiser(sub_Na,2.500).';%方位向加窗
%%
squint_theta = asin(fdc*lambda/2/Vr);%利用多普勒中心频率求斜视角4.33
dly0 = 2*R0/cos(squint_theta)/c;   
t_a  = ((-Na/2:Na/2-1)/Fa);
t_r  = ((-Nr/2:Nr/2-1)/Fr+dly0);         
f_r  = (-Nr/2:Nr/2-1)/Nr*Fr;
f_a  = (-Na/2:Na/2-1)/Na*Fa + fdc;
f_r  = f_r.'*ones(1,Na);
f_a  = ones(Nr,1)*f_a;
%%
%值得注意的是这边的行是方位向，列是距离向
%%%%%%%%%%% FDC_compensition %%%%%%%%%%%%%%%%
ph_fdc = exp(-1i*2*pi*fdc*t_a);
sig    = sig.*(ones(Nr,1)*ph_fdc);
%%%%%%%%%%%%%%%% a_fft %%%%%%%%%%%%%%%%%%%%%%
sig = fftshift(fft(fftshift(sig,2),[],2),2);%进入距离多普勒域
% sig =fft(sig,[],2);
sig = sig.*(ones(Nr,1)*win2);
%%%%%%%%%%%%%% chirp scaling %%%%%%%%%%%%%%%%
R_ref=R0;%距离多普勒域变标方程
R0   = (t_r.'*c/2)*ones(1,Na)*cos(squint_theta);
D    = sqrt(1-(c*f_a/(2*Vr*f0)).^2);
Dref = sqrt(1-(c*fdc/(2*Vr*f0)).^2);
tao  = (2/c)*(R0/Dref+R_ref*(1./D-1/Dref));                                                  
tao2 = tao-2*R_ref./(c*D);
Z    = c*(f_a.^2).*R0./(2*Vr^2*f0^3*D.^3);%k_src
Km   = Kr./(1-Kr*Z);

alpha=Dref./D-1;%变标方程中参数  p191 7.30
Ssc  =exp(1i*pi*Km.*alpha.*(tao2.^2));
sig  =sig.*Ssc;
clear alpha Ssc Z  tao2 tao
%%%%%%%%%%%%%%%%%%%%% range fft %%%%%%%%%%%%%%%%
sig = fftshift(fft(fftshift(sig,1),[],1),1);%方位向傅里叶变化进入二维频域
sig = sig.*(win1*ones(1,Na));
%%%%%%%%%%%%%%% range MF and RCMC %%%%%%%%%%%%%%
ph1=1i*pi*D.*f_r.^2./(Km*Dref);
ph2=1i*4*pi*R_ref*f_r.*(1./D-1./Dref)/c;
sig=sig.*exp(ph1+ph2);

clear ph1 ph2
%%%%%%%%%%%%%%%%%%%%% range ifft %%%%%%%%%%%%%%%
sig = fftshift(ifft(fftshift(sig,1),[],1),1);%距离向傅里叶逆变化
% %%%%%%%%%%%%%%%%%%%%% azimuth MF %%%%%%%%%%%%%

ph3 = 1i*4*pi*R0*f0.*D/c;%方位向匹配滤波
ph4 = -1i*(4*pi*Km/c^2).*(1-D/Dref).*((R0./D-R_ref./D).^2);%附加相位校正
sig =  sig.*exp(ph3+ph4);

clear ph3 ph4 D sref_ka
%%%%%%%%%%%%%%%%%% azimuth_ifft %%%%%%%%%%%%%%%%
sig = fftshift(ifft(fftshift(sig,2),[],2),2);
end