clear
clc

levels = 12;

[list] = TreeNum(levels+1); 
level=[];
r=rand();
count=0;

for i=1:levels
    lvl=list(2^i:2^(i+1)-1);
    for k=1:length(lvl)
        if lvl(k)<r
            count=count+1;
        end
    end
    
    hold on
    plot(i,count,'r*')
    count=0;
    
    level=[level lvl];
    
end
