%If you enter TreeNum(n,1), you will get a list of length (2^n)-1 numerators.
%If you enter TreeNum(n,2), you will get a list of length (2^n)-1 denominators. 
%If you enter TreeNum(n), you will get a list of length (2^n)-1 fractions.
function [ list ] = TreeNum( n,pos )

n = (2^n)-1;
num = zeros(1,n);
denom = zeros(1,n);
num(1) = 1;
denom(1) = 1;



for i =2:n
    if mod(i,2) == 0
        num(i) = num(i/2);
        denom(i) = denom(i/2)+num(i/2);
    else
        num(i) = num((i-1)/2)+denom((i-1)/2);
        denom(i) = denom((i-1)/2);
    end
    
    if nargin>1
        if pos ==1
            list = num;
        elseif pos == 2
            list = denom;
        end
    else
        list = num./denom;
    end
 
end

end