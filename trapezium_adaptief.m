function [I] = trapezium_adaptief( f,a,b,e )
I1 = trapezium(f,a,b,1/e);
I2 = simpson(f,a,b,1/e);
if abs(I1 - I2) < e
    I = I2;
else 
    I = trapezium(f,a,(a+b)/2,1/e) + trapezium(f,(a+b)/2,1/e);
end
end

