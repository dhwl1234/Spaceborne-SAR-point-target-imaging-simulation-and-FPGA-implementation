clear all;
clc
temp_data=load('S_range_real.txt');
%�ļ����֣�ֱ�Ӹ����޸ļ���
%'H_range_real.txt'
%'H_range_imag.txt'
%'S_range_real.txt'
%'S_range_real.txt'
% temp_data_hex=num2hex(temp_data);
%temp_data=hex2num(temp_data_hex);
[row,column]=size(temp_data);
fid=fopen('S_range_real.coe','wt'); %�򿪻����½�coe�����λ�ú��ļ���
fprintf(fid,'MEMORY_INITIALIZATION_RADIX=16;\n'); 
fprintf(fid,'MEMORY_INITIALIZATION_VECTOR=\n');
for i=1:1:row
    for j=1:1:column
        fprintf(fid,'%bX',temp_data(i,j)); %��ʼд���������bX��x��Ҫ��д�����Զ�װ��
        if (i==row&&j==column)
            fprintf(fid,';');
        else
            fprintf(fid,',');
            fprintf(fid,'\n');
        end
    end
end
fclose(fid);

