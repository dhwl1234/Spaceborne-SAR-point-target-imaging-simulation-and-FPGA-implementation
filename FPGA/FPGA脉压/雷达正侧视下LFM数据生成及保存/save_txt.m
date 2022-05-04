function [] = save_txt(a)
fid=fopen('echo.txt','w');%写入文件路径
[m,n]=size(a);
for i=1:1:m
       for j=1:1:n
             if j==n
                 fprintf(fid,'%gn',a(i,j));
%                        fprintf(fp,['%f+%f','i'],real(a),imag(a));
           else
%                fprintf(fid,'%gt',a(i,j));
                        fprintf(fid,['%f+%f','i'],real(a(i,j)),imag(a(i,j)));
             end
       end
end
fclose(fid);
end

