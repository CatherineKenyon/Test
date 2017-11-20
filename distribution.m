%Finds distribution of tree

[list] = CWList(1000);

levels=[];
for i=1:5
    levels=[levels 2^i];
end

for j=1:length(levels)
    lvl=sort([list(2^j:2^(j*2)-1)]);
end

plot(lvl)


% lvl1=sort([list(1)])
% lvl2=sort([list(2:3)])
% lvl3=sort([list(4:7)])
% lvl4=sort([list(8:15)])
% lvl5=sort([list(16:31)])
% lvl6=sort([list(32:63)])
% lvl7=sort([list(64:127)])
% lvl8=sort([list(128:255)])
% 
% plot(lvl8)



    
