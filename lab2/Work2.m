%первая часть
%пункт А
P=[1.5 2.1 -5.87 -8.67];
xr=roots(P);
x=linspace(1.5,xr(1,1)-0.0008,1000);
g=G(x);
plot(x,g,'r')
hold on
x=linspace(xr(1,1)+0.0008,2.5,1000);
g=G(x);
plot(x,g,'r')
xlabel('x')
ylabel('y')
title('g(x)')
grid on
line([xr(1,1)-0.001 xr(1,1)],[20 -20],'LineStyle','--')
text(xr(1,1)-0.01, 10, 'Асимптота', 'HorizontalAlignment', 'right')

%пункт Б
figure
P=[1.5 2.1 -5.87 -8.67];
xr=roots(P);
x=linspace(1.8,xr(1,1),500);
g=G(x);
A=10;
B=-10;
for i=1:length(x)
if G(x(i))>A
g(i)=A;
elseif G(x(i))<B
g(i)=B;
end
end
plot(x,g,'r')
hold on
x=linspace(xr(1,1)+0.00001,2.25,500);
g=G(x);
for i=1:length(x)
if G(x(i))>A
g(i)=A;
elseif G(x(i))<B
g(i)=B;
end
end
plot(x,g,'r')
xlabel('x')
ylabel('y')
title('g(x)')
grid on
line([xr(1,1) xr(1,1)],[A B],'LineStyle','--')
text(xr(1,1)-0.001, 1, 'Асимптота', 'HorizontalAlignment', 'right')

%вторая часть
figure
x=linspace(-2.5,0,100);
x1=linspace(0,1.8,100);
y=Y(x);
plot(x,y,'r')
hold on
P=[1.5 2.1 -5.87 -8.67];
plot(x1,polyval(P,x1),'k')
xr=roots(P);
x2=linspace(1.8,xr(1,1),500);
g=G(x2);
A=8;
B=-8;
for i=1:length(x2)
if G(x2(i))>A
g(i)=A;
elseif G(x2(i))<B
g(i)=B;
end
end
plot(x2,g,'m')
hold on
x2=linspace(xr(1,1)+0.0008,2.5,500);
g=G(x2);
for i=1:length(x2)
if G(x2(i))>A
g(i)=A;
elseif G(x2(i))<B
g(i)=B;
end
end
plot(x2,g,'m')
xlabel('x')
ylabel('y')
title('Y&P&G')
grid on
legend('Y(x)','P(x)','G(x)', 'Location', 'northwest')
[xr1,yr1]=fzero(@Y,-1);
line([xr1, -1],[yr1, -0.5])
text(-1, -0.5, 'Корень', 'HorizontalAlignment', 'right')
[xmax1 ymax1]=fminsearch(@Y1,-1);
ymax1=-1*ymax1;
line([xmax1, xmax1],[ymax1, 2])
text(xmax1+0.1, 2.1, 'Максимум', 'HorizontalAlignment', 'right')
P1= polyder(P);
x1r=roots(P1);
p1r=polyval (P, x1r);
line([x1r(2,1), x1r(2,1)],[p1r(2,1), -13])
text(x1r(2,1), -13, 'Минимум', 'HorizontalAlignment', 'left')
plot(xr1,yr1,'bo',xmax1,ymax1,'bo',x1r(2,1),p1r(2,1),'bo')
line([xr(1,1)-0.01 xr(1,1)+0.01],[A B],'LineStyle','--')
text(xr(1,1)-0.01, 1, 'Асимптота', 'HorizontalAlignment', 'right')