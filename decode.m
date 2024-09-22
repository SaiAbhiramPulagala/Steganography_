    clear all;
str = fileread('exp3.txt')
    % ascci code for space is 32
    num = uint8( str ); % a row array
    num=num(:); % make it a column
    n=length(num);
     % Find the last printable character
    count=0;
        for k=1:n
        a=num(k);
        if (a ~= 0 & a ~= 7 & a ~= 9 & a ~= 32)
                        count=count+1;pos=k;
                        % char(a),k
        end
        
        end
        count ;
        pos=pos-1;
 % pos contain last position
 % pos+1 is the position of new line char(32)
 % Embedded steg position is pos+2
pos=pos+2;
weight=[128 64 32 16 8 4 2 1];
message=[];
for i=pos:4:n-3
    a=num(i); b=num(i+1);c=num(i+2); d=num(i+3);
    g(1:8)=0;
     if (a==0) g(1)=0;g(2)=0; end 
      if (a==7) g(1)=0;g(2)=1; end
      if (a==9) g(1)=1;g(2)=0; end 
      if (a==32) g(1)=1;g(2)=1; end

      if (b==0) g(3)=0;g(4)=0; end 
      if (b==7) g(3)=0;g(4)=1; end
      if (b==9) g(3)=1;g(4)=0; end 
      if (b==32) g(3)=1;g(4)=1; end

      if (c==0) g(5)=0;g(6)=0; end 
      if (c==7) g(5)=0;g(6)=1; end
      if (c==9) g(5)=1;g(6)=0; end 
      if (c==32) g(5)=1;g(6)=1; end

      if (d==0) g(7)=0;g(8)=0; end 
      if (d==7) g(7)=0;g(8)=1; end
      if (d==9) g(7)=1;g(8)=0; end 
      if (d==32) g(7)=1;g(8)=1; end
      number=weight*g';
      message=[message char(number)];
end
message


