function [I] = simpson_adaptief( f,a,b,e )
I1 = simpson(f,a,b,2);
I2 = simpson(f,a,b,4);
if abs(I1 - I2) < e
    I = I2;
else 
    I = simpson_adaptief(f,a,(a+b)/2,e) + simpson_adaptief(f,(a+b)/2,b,e);
end
end

