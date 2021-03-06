%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                          %
%           Generated by MATLAB 9.6 and Fixed-Point Designer 6.3           %
%                                                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%#codegen
function [s_rc,S_range_c ] = Distance_Plus_Compress_fixpt(s_echo,Nr,Naz,Nrg,Fr,Kr)


fm = get_fimath();

NFFT_r = fi(Nrg, 0, 9, 0, fm);           % 距离向FFT长度
S_range = fi(fft(s_echo,NFFT_r,fi(2, 0, 2, 0, fm)), 1, 14, 8, fm);     % 进行距离向傅里叶变换，零频在两端。
t_ref = fi(fi_div(( fi_div_by_shift(fi_uminus(Nr), 1) : (fi_signed(fi_div_by_shift(Nr, 1))-fi(1, 0, 1, 0, fm)) ), Fr), 1, 14, 32, fm);    % 用来生成距离MF的距离时间轴
t_ref_mtx = fi(ones(fi_toint(Naz),1)*t_ref, 1, 14, 32, fm);      % 矩阵形式
% w_ref = kaiser(Nr,2.5);             % 距离向，构建Kaiser窗，此为列向量。
% w_ref = ones(Naz,1)*(w_ref.');      % 构成矩阵形式，每一行都相同的加窗。


  s_ref = fi(exp((fi(1j*pi, 0, 14, 12, fm)*Kr).*((t_ref_mtx).^2)), 1, 14, 12, fm); % 复制（发射）脉冲，未加窗。
%   s_ref = w_ref.*exp((1j*pi*Kr).*((t_ref_mtx).^2)); % 复制（发射）脉冲，加了窗。
%上述为复制的基带信号，书本P49 公式3.26

s_ref = [s_ref,zeros(fi_toint(Naz),fi_toint(floor(fi_signed(Nrg)-Nr)))];      % 对复制脉冲，后端补零。
 %时域补零相当于频域插值，补零操作增加频域的插值点数。使得曲线看起来更光滑,有更好的分辨率
 
S_ref = fi(fft(s_ref,NFFT_r,fi(2, 0, 2, 0, fm)), 1, 14, 9, fm);            % 复制脉冲的距离傅里叶变换，零频在两端。
H_range = fi(conj(S_ref), 1, 14, 9, fm);                  % 距离向匹配滤波器，零频在两端。%conj函数用于求共轭值，此处生成距离向匹配滤波器
S_range_c = fi(S_range.*H_range, 1, 14, 4, fm);           % 乘以匹配滤波器，零频在两端。    距离压缩就是乘以其匹配滤波器
s_rc = fi(ifft(S_range_c,[],fi(2, 0, 2, 0, fm)), 1, 14, 5, fm);            % 完成距离压缩，回到二维时域
end



function ntype = divideType(a,b)
    coder.inline( 'always' );
    nt1 = numerictype( a );
    nt2 = numerictype( b );
    maxFL = max( [ min( nt1.WordLength, nt1.FractionLength ), min( nt2.WordLength, nt2.FractionLength ) ] );
    FL = max( maxFL, 24 );
    extraBits = (FL - maxFL);
    WL = nt1.WordLength + nt2.WordLength;
    WL = min( WL, 124 );
    if (WL + extraBits)<64
        ntype = numerictype( nt1.Signed || nt2.Signed, WL + extraBits, FL );
    else
        ntype = numerictype( nt1.Signed || nt2.Signed, WL, FL );
    end
end


function c = fi_div(a,b)
    coder.inline( 'always' );
    if isfi( a ) && isfi( b ) && isscalar( b )
        a1 = fi( a, 'RoundMode', 'fix' );
        b1 = fi( b, 'RoundMode', 'fix' );
        c1 = divide( divideType( a1, b1 ), a1, b1 );
        c = fi( c1, numerictype( c1 ), fimath( a ) );
    else
        c = a / b;
    end
end


function y = fi_div_by_shift(a,shift_len)
    coder.inline( 'always' );
    if isfi( a )
        nt = numerictype( a );
        fm = fimath( a );
        nt_bs = numerictype( nt.Signed, nt.WordLength + shift_len, nt.FractionLength + shift_len );
        y = bitsra( fi( a, nt_bs, fm ), shift_len );
    else
        y = a / 2 ^ shift_len;
    end
end


function y = fi_signed(a)
    coder.inline( 'always' );
    if isfi( a ) && ~(issigned( a ))
        nt = numerictype( a );
        new_nt = numerictype( 1, nt.WordLength + 1, nt.FractionLength );
        y = fi( a, new_nt, fimath( a ) );
    else
        y = a;
    end
end


function y = fi_toint(u)
    coder.inline( 'always' );
    if isfi( u )
        nt = numerictype( u );
        s = nt.SignednessBool;
        wl = nt.WordLength;
        y = int32( fi( u, s, wl, 0, hdlfimath ) );
    else
        y = int32( u );
    end
end


function y = fi_uminus(a)
    coder.inline( 'always' );
    if isfi( a )
        nt = numerictype( a );
        new_nt = numerictype( 1, nt.WordLength + 1, nt.FractionLength );
        y = -fi( a, new_nt, fimath( a ) );
    else
        y = -a;
    end
end

function fm = get_fimath()
	fm = fimath('RoundingMethod', 'Floor',...
	     'OverflowAction', 'Wrap',...
	     'ProductMode','FullPrecision',...
	     'MaxProductWordLength', 128,...
	     'SumMode','FullPrecision',...
	     'MaxSumWordLength', 128);
end
