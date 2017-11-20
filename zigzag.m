%this function returns the number of zigzags (alternaing) in the direction
%sequence you input 

function [ n ] = zigzag( direction )
n = 0;

for i = 2:length(direction)
    if direction(i) ~= direction(i-1)
        n = n+1;
    end
end

end

