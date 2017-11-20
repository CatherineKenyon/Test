n=14;
[list] = TreeNum(n);
invphi=0.618;
p=[];
z=[];
t=[];
frac=[];
%added comment 

levels=[];
for i=1:12
    levels=[levels 2^i];
end

for j=1:length(levels)
    lvl=sort([list(2^j:2^(j+1)-1)]);
    l=1;
    while lvl(l)<invphi
        l=l+1;
    end
    if abs(invphi-lvl(l))>abs(invphi-lvl(l-1))
        l=l-1;
    end
    p=[p lvl(l)]
    
end

% 
% for i=1:length(list)
%     if abs(list(i)-invphi)<tol
%         p=[p list(i)];
%     end
% end

for k=2:length(p)
    [n,d]=numden(sym(p(k)));
    n=double(n);
    d=double(d);
    [history]=Genealogy(n,d);           %gets the path to rational
    [tlength] = TailLength(history);    %gets the length of zig-zag part
    [zig] = zigzag(history);            %gets the number of zig-zags in tail
    z=[z zig];
    t=[t tlength];
    h=length(history)-tlength;          %subtracts the tail from the path
    hist=history(1:h);              
    [a,b] = TreeEval(hist);             %gives the fraction before zig-zag starts
    frac=[frac a/b];
end


plot(p,'b-')
% plot(t,'b*')                           %plots the length of tail
% plot(z,'r-')                            %plots the number of zig-zags
% plot(frac,'g-')                        %plots the fraction before zig-zag