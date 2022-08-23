function [ g ] = G( x )
P=[1.5 2.1 -5.87 -8.67];
g=Y(x)./polyval(P,x);
end

