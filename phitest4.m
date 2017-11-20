clear
clc
close all;

invPhi = 0.618;
n = 100;
bestGoods = ones(3,n);
bestGoods(:,2) = [0.5;1;2];

for i = 3:n
    frac = (1:i-1)./ones(1,i-1)/i;
    k = 1;
    
    while k<(i-1)
        if abs(frac(k)-invPhi) > abs(frac(k+1)-invPhi)
            good = frac(k+1);
            bestNum = k+1;
            bestDenom = i;
        end
        k = k+1;

    end
    bestGoods(1,i) = good;
    bestGoods(2,i) = bestNum;
    bestGoods(3,i) = bestDenom; 
end

%%
z=[];
t=[];
frac=[];
for j=5:n
    [path]=Genealogy(bestGoods(2,j),bestGoods(3,j));
    [tlength] = TailLength(path);
    [zig] = zigzag(path); 
    z=[z zig];
    t=[t tlength];
    h=length(path)-tlength;          
    hist=path(1:h);              
    [a,b] = TreeEval(hist);
    frac=[frac a/b];
end

    
plot(z,'r-')
    
%%
% plot(1:n, bestGoods(1,:))
 
%%
for k=1:n
    
