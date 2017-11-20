%This returns the path taken to get from 1/1 to a/b. 0=left, 1=right 

function [ history ] = Genealogy( a,b )

history = -1*ones(1,max(a,b));
index = 1;


while a~=b   
    if a*b == 0
        history(index-1) = -1;
        a =b;      
    elseif a>b
        temp = floor(a/b);
        temp_vec = ones(1,temp);
        history(index:index+temp-1) = temp_vec;
        index = index+temp;
        a = a-temp*b;
    else
        temp = floor(b/a);
        temp_vec = zeros(1,temp);
        history(index:index+temp-1) = temp_vec;
        index = index+temp;
        b = b-temp*a;
    end    
end

history = history(1:index-2);
history = fliplr(history);

end


%check to see if reverse direction is b/a 