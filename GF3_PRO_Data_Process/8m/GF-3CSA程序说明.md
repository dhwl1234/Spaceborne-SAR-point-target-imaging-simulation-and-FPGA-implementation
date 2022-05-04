# 高分三号卫星数据程序CS成像处理步骤

参数：

```matlab
                                        c      =  299792458;     			%光速
                                        D      =  15;                      	%天线长度
                                        f0     =  5.4e9;               		%雷达工作频率
                                        lambda =  c/f0;             		%波长
                                        Fs     =  66.667e6;          		%距离采样率
                                        Br     =  40e6;                 	%距离向带宽
                                        Tp     =  30e-6;               		%发射脉冲时宽
                                        PRF    =  2727.768685/2;			%重复脉冲频率
                                        Vr     =  7123.930520;     			%雷达有效速度
                                        R0     =  961241.045189;   			%最近斜率
                                        fdc    =  14.251278;           		%多普勒中心频率
                                        Kr     =  -Br/Tp;                   %距离调频率
```

在main函数中输入参数，调用CSA_Image程序进行成像

```matlab
                                        %%
                                        %------------参数赋值
                                        para.c       = c;
                                        para.prf     = PRF;
                                        para.Vr      = Vr;
                                        para.Rs      = R0;
                                        para.R0      = R0;
                                        para.Tp      = Tp;
                                        para.Kr      = Kr;
                                        para.Fc      = f0;
                                        para.Fs      = Fs;
                                        para.B       = Br;
                                        para.D       = D;
                                        para.Fdc     = fdc;
                                        para.lambda  = lambda;
                                        para.Ba 	 = 2*Vr/D;

```

定义方位向维度与距离向维度

```
                                        Na     =  16384;%方位向维度
                                        Nr     =  8192;  %距离向维度
```

读取文件，读取文件类型为二进制读取，32位浮点型数据，在数据中存有实部与虚部，因此在每个维度读取时需要隔两个读取，并且将其转化为复数，行距为两倍的方位向维数，将方位向转化为矩阵的列向

```matlab
fid   = fopen(filename,'rb');%读取二进制文件
data  = fread(fid,[2*Na,Nr],'float32');
data  = data(1:2:end,:).' + 1i*data(2:2:end,:).';
fclose(fid);
```



## CSA成像程序

### 读取参数

```
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
```

### 进行参数转化

​		波长等于光速除以频率、获取数据维数；求距离向有效数据成像宽度，距离向带宽/距离维采样率 乘以一半的距离维度再乘以2，这边除以2再乘以2是因为成像中心左右两侧数据（影响不大）；设置距离向数据窗，数据窗长度为所设置的距离维度长度，方向是矩阵行维度，对方位向数据需要进行加窗操作，加窗方位在数据窗中点两侧，长度为有效数据长度，加kaiser窗,参数为2.5。

```matlab
lambda = c/f0;
[Nr,Na]= size(sig);

sub_Nr  = round(Br/Fr*Nr/2)*2;%求有效成像数据宽度
win1    = zeros(Nr,1);
win1(end/2-sub_Nr/2+1:end/2+sub_Nr/2) = kaiser(sub_Nr,2.500);
```

​		设置方位向数据窗，方位向数据窗与距离维数据窗设置相同，长度为方位维度，方向是矩阵列维度，加窗方位在数据窗中点两侧，长度为有效数据长度，加kaiser窗,参数为2.5。

```matlab
sub_Na = round(Ba/Fa*Na/2)*2;
win2   = zeros(1,Na);
win2(end/2-sub_Na/2+1:end/2+sub_Na/2)=kaiser(sub_Na,2.500).';%方位向加窗
```

​		计算斜视角，利用多普勒中心频率求斜视角，书本P85，利用最近距离求延迟时间，并且设置方位向、距离向的时间轴与频率轴。距离向的时间为中心距离两旁有效数据长度的时间。注意维度，并将频率从向量转化为矩阵形式。f_r需要设置为Nr、1列的形式，f_a需要设置为1行、Na列形式，并乘上相应的单位矩阵，构造数据矩阵。

```matlab
%%
squint_theta = asin(fdc*lambda/2/Vr);%利用多普勒中心频率求斜视角4.33
dly0 = 2*R0/cos(squint_theta)/c;   
t_a  = ((-Na/2:Na/2-1)/Fa);
t_r  = ((-Nr/2:Nr/2-1)/Fr+dly0);         
f_r  = (-Nr/2:Nr/2-1)/Nr*Fr;
f_a  = (-Na/2:Na/2-1)/Na*Fa + fdc;
f_r  = f_r.'*ones(1,Na);
f_a  = ones(Nr,1)*f_a;
```

​		设置方位向中心频率的相位，因为方位向频率轴设置在多普勒中心位置

```matlab
ph_fdc = exp(-1i*2*pi*fdc*t_a);
sig    = sig.*(ones(Nr,1)*ph_fdc);
```

​		进行方位向的傅里叶变化，2代表行向量方向，1代表列方向，用fftshift（fft（fftshift））的原因是因为fft快速傅里叶变化是从零频开始的，但是频率轴设置其实频率不是零频，是-fa/2，因此需要将数据进行搬移，使快速傅里叶变化的起始点位于数据的零频位置。

​		在进行方位向傅里叶变化之后，数据矩阵变进入了距离多普勒域，对数据进行方位向的加窗

```matlab
sig = fftshift(fft(fftshift(sig,2),[],2),2);%进入距离多普勒域
% sig =fft(sig,[],2);
sig = sig.*(ones(Nr,1)*win2);
```

进行chirp scaling算法操作，步骤如下

1. 方位向傅里叶变化将数据变换到距离多普勒域
2. 通过相位相乘实现chirp scaling操作，使所有目标的轨迹一致化（第一次相位相乘）
3. 通过距离向快速傅里叶变换将数据变换至二维频域
4. 通过参考函数与数据相乘，完成距离压缩、二次距离压缩、和一致距离徙动矫正（二次相位相乘）、
5. 通过距离向的快速傅里叶逆变化将数据变化回距离多普勒域
6. 通过与随距离变化的匹配滤波器进行相位相乘，实现方位压缩，并且进行相位矫正（第三次相位相乘）
7. 进行方位向快速傅里叶逆变化将数据变化回二维时域，得到SAR图像

​		求距离徙动参数D、D_ref,Km,Z,tao等参数p187----p189

```matlab
%%%%%%%%%%%%%% chirp scaling %%%%%%%%%%%%%%%%
R_ref=R0;%距离多普勒域变标方程
R0   = (t_r.'*c/2)*ones(1,Na)*cos(squint_theta);
D    = sqrt(1-(c*f_a/(2*Vr*f0)).^2);
Dref = sqrt(1-(c*fdc/(2*Vr*f0)).^2);
tao  = (2/c)*(R0/Dref+R_ref*(1./D-1/Dref));                                                  
tao2 = tao-2*R_ref./(c*D);
Z    = c*(f_a.^2).*R0./(2*Vr^2*f0^3*D.^3);%k_src
Km   = Kr./(1-Kr*Z);

alpha=Dref./D-1;%变标方程中参数 p191 7.30
Ssc  =exp(1i*pi*Km.*alpha.*(tao2.^2));

sig  =sig.*Ssc;
clear alpha Ssc Z  tao2 tao
```

距离向快速傅里叶变化，进行距离向加窗、补偿相位等距离处理

ph1与ph2两个相位相加与数据矩阵相乘，同时完成距离压缩，二次距离压缩以及一致距离徙动的矫正

距离处理步骤：

1. 将距离多普勒中的信号与变标方程相乘
2. 通过距离向快速傅里叶变换将数据变换到二维频域
3. 进行距离匹配滤、二次距离压缩、和一致距离徙动矫正。(这些操作合成为一个二维频域中的相位相乘，可以加入距离平滑窗抑制旁瓣)
4. 通过距离向快速傅里叶逆变换回距离多普勒域

```matlab
%%%%%%%%%%%%%%%%%%%%% range fft %%%%%%%%%%%%%%%%
sig = fftshift(fft(fftshift(sig,1),[],1),1);%方位向傅里叶变化进入二维频域
sig = sig.*(win1*ones(1,Na));
%%%%%%%%%%%%%%% range MF and RCMC %%%%%%%%%%%%%%
ph1=1i*pi*D.*f_r.^2./(Km*Dref);
ph2=1i*4*pi*R_ref*f_r.*(1./D-1./Dref)/c;
sig=sig.*exp(ph1+ph2);

clear ph1 ph2
```

方位处理步骤：

1. 方位向匹配滤波
2. 附加相位矫正
3. 方位向快速傅里叶逆变换

```matlab
%%%%%%%%%%%%%%%%%%%%% range ifft %%%%%%%%%%%%%%%
sig = fftshift(ifft(fftshift(sig,1),[],1),1);%方位向傅里叶逆变化
% %%%%%%%%%%%%%%%%%%%%% azimuth MF %%%%%%%%%%%%%

ph3 = 1i*4*pi*R0*f0.*D/c;
ph4 = -1i*(4*pi*Km/c^2).*(1-D/Dref).*((R0./D-R_ref./D).^2);
sig =  sig.*exp(ph3+ph4);

clear ph3 ph4 D sref_ka
%%%%%%%%%%%%%%%%%% azimuth_ifft %%%%%%%%%%%%%%%%
sig = fftshift(ifft(fftshift(sig,2),[],2),2);
```

CSA成像结束



















