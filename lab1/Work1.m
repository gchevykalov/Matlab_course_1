%Пункт А для функции
x = linspace(-4,4,81);
y = Y(x);
plot(x,y,'r-')
grid on
xlabel('x')
ylabel('y')
title('Y(x)=3^{1.1-0.5x^2}sin(ln(0.2+1.4x^2))')
[xr1,yr1]=fzero(@Y,-1)
[xr2,yr2]=fzero(@Y,1)
[xmin ymin]=fminsearch(@Y,0)
[xmax1 ymax1]=fminsearch(@Y1,-1)
ymax1=-1*ymax1
[xmax2 ymax2]=fminsearch(@Y1,1)
ymax2=-1*ymax2
A=[xr1 xr2 xmax1 xmax2 xmin];
hold on
plot(A,Y(A),'bo')
line([xr1, -1],[yr1, -0.5])
line([xr2, 1],[yr2, -0.5])
text(-1, -0.5, 'Корень', 'HorizontalAlignment', 'right')
text(1, -0.5, 'Корень', 'HorizontalAlignment', 'left')
line([xmin, 0.4],[ymin, ymin])
text(0.4, ymin, 'Минимум', 'HorizontalAlignment', 'left')
line([xmax1, xmax1],[ymax1, 1.2])
line([xmax2, xmax2],[ymax2, 1.2])
text(xmax1+0.1, 1.3, 'Максимум', 'HorizontalAlignment', 'right')
text(xmax2-0.1, 1.3, 'Максимум', 'HorizontalAlignment', 'left')
%Пункт А для полинома
figure
P=[1.5 2.1 -5.87 -8.67];
x = linspace(-4,3,71);
plot(x,polyval(P,x), 'r-')
grid on
xlabel('x')
ylabel('y')
title('P(x)=1.5x^3+2.1x^2-5.87x-8.67')
xr=roots(P)
pr=polyval (P, xr)
P1= polyder(P);
x1r=roots(P1)
p1r=polyval (P, x1r)
P2= polyder(P1);
x2r=roots(P2)
p2r=polyval(P,x2r)
B=[xr(1,1) xr(2,1) xr(3,1) x1r(1,1) x1r(2,1) x2r];
hold on
plot(B(1,:),polyval(P,B(1,:)),'bo')
line([x2r, x2r],[p2r, -15])
text(x2r, -15, 'Точка перегиба', 'HorizontalAlignment', 'right')
line([x1r(1,1), x1r(1,1)],[p1r(1,1), 10])
text(x1r(1,1), 11, 'Максимум', 'HorizontalAlignment', 'right')
line([x1r(2,1), x1r(2,1)],[p1r(2,1), -20])
text(x1r(2,1), -20, 'Минимум', 'HorizontalAlignment', 'left')
line([xr(1,1), 1.5],[pr(1,1), 10])
text(1.5, 10, 'Корень', 'HorizontalAlignment', 'right')
line([xr(2,1), -2.5],[pr(2,1), 0])
text(-2.5, 0, 'Корень', 'HorizontalAlignment', 'right')
line([xr(3,1), -1],[pr(3,1), 0])
text(-1, 0, 'Корень', 'HorizontalAlignment', 'left')
%Пункт Б для функции
figure
X=[xr1 xr2 xmax1 xmax2 xmin];
x = linspace(-4,4,81);
y = Y(x);
subplot(2,2,1)
plot(x,y,'b-')
grid on
xlabel('x')
ylabel('y')
title('Y(x)')
hold on
plot(X(1,:),Y(X(1,:)),'ro')
subplot(2,2,2)
plot(x,y,'r--')
grid on
xlabel('x')
ylabel('y')
title('Y(x)')
hold on
plot(X(1,:),Y(X(1,:)),'bx')
subplot(2,2,3)
stairs(x,y,'k:')
grid on
xlabel('x')
ylabel('y')
title('Y(x)')
hold on
plot(X(1,:),Y(X(1,:)),'gv')
subplot(2,2,4)
stairs(x,y,'m-.')
grid on
xlabel('x')
ylabel('y')
title('Y(x)')
hold on
plot(X(1,:),Y(X(1,:)),'b*')
%Пункт Б для полинома
figure
X1=[xr(1,1) xr(2,1) xr(3,1) x1r(1,1) x1r(2,1) x2r];
x = linspace(-4,4,81);
P=[1.5 2.1 -5.87 -8.67];
subplot(2,2,1)
plot(x,polyval(P,x),'b-')
grid on
xlabel('x')
ylabel('y')
title('P(x)')
hold on
plot(X1(1,:),polyval(P,X1(1,:)),'ro')
subplot(2,2,2)
plot(x,polyval(P,x),'r--')
grid on
xlabel('x')
ylabel('y')
title('P(x)')
hold on
plot(X1(1,:),polyval(P,X1(1,:)),'bx')
subplot(2,2,3)
stairs(x,polyval(P,x),'k:')
grid on
xlabel('x')
ylabel('y')
title('P(x)')
hold on
plot(X1(1,:),polyval(P,X1(1,:)),'gv')
subplot(2,2,4)
stairs(x,polyval(P,x),'m-.')
grid on
xlabel('x')
ylabel('y')
title('P(x)')
hold on
plot(X1(1,:),polyval(P,X1(1,:)),'b*')
%Пункт В
figure
x = linspace(-4,4,81);
y=Y(x);
subplot(2,2,1)
plot(x,polyval(P,x),'b-')
axis([-3,3,-15,15])
grid on
xlabel('x')
ylabel('y')
title('P(x)')
hold on
plot(B(1,:),polyval(P,B(1,:)),'ro')
subplot(2,2,2)
plot(x, y,'b--')
grid on
xlabel('x')
ylabel('y')
title(' Y(x)')
hold on
plot(A(1,:),Y(A(1,:)),'r^')
subplot(2,2,3)
plot(x,polyval(P,x),'r:')
axis([-3,3,-15,15])
grid on
xlabel('x')
ylabel('y')
title('P(x)')  
subplot(2,2,4)
plot(x, y,'r-.')
grid on
xlabel('x')
ylabel('y')
title(' Y(x)')