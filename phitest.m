n=15;
[list] = TreeNum(n);
tol=0.001;
invphi=0.618;
p=[];
z=[];
t=[];
frac=[];

for i=1:length(list)
    if abs(list(i)-invphi)<tol
        p=[p list(i)];
    end
end

for k=1:length(p)
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

%%

%plot(t,'b*')                           %plots the length of tail
plot(z,'r-')                            %plots the number of zig-zags
%plot(frac,'g-')                        %plots the fraction before zig-zag


        
