%This function extracts the tail length from the rational's path. 

function [ tlength ] = TailLength( path )

n = length(path);
k = n-2;
tlength = 1;
zigzag = 1;

if path(n-1) ~= path(n)
    tlength = 2;
else
    tlength = 1;
    zigzag = 0;
end


while k >= 1 && zigzag == 1
   if path(k) == path(k+2)
       tlength = tlength+1;
   else
       zigzag = 0;
   end
   k = k-1;
end

