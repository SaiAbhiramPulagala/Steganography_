clear all; clc;
fileID = fopen('exp3.txt','w');

        fprintf(fileID,"My God, I do not clasp the moon in my arms");
        fprintf(fileID,'%s',char(10));
        fprintf(fileID,"Nor do I kiss the morning dew");
        fprintf(fileID,'%s',char(10));
        fprintf(fileID,"It is enough I see you in my dreams");
        fprintf(fileID,'%s',char(10));
        fprintf(fileID,"And  love you as eternity's sweetest melody");
        fprintf(fileID,'%s',char(10));
        % fclose(fileID);
stegword='I am Hiddden';
k=length(stegword);
for i=1:k
    a=stegword(i);
    num = uint8(a);
    abit=int2bit(num,8);
    for K=0:3
        c=abit(K*2+1); 
        d=abit(K*2+2);
        if(c == 0 & d== 0) fprintf(fileID,'%s',char(0)); end
        if (c == 0 & d== 1) fprintf(fileID,'%s',char(7)); end 
        if (c == 1 & d== 0) fprintf(fileID,'%s',char(9));end
        if (c == 1 & d== 1) fprintf(fileID,'%s',char(32));end
    end
end
fclose(fileID);

