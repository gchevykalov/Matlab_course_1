function [y] = Y( x )
y=3.^(1.1-0.5*x.^2).*sin(log(0.2+1.4*x.^2));
end