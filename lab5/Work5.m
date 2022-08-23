%полином
figure
P=[1.02 -8.49 0.05 8.73 -5.03 6.37 0.32 -2.40 -7.41 11.78 12.03 -9.20];
xr=roots(P);
P1= polyder(P);
x1r=roots(P1);
P2= polyder(P1);
x2r=roots(P2);
P3= polyder(P2);
x3r=roots(P3);
x=linspace(xr(2)-0.1,xr(1)+0.1,200);
plot(x,polyval(P,x))
ylim([-20 20])
grid on
xlabel('x')
ylabel('y')
title('Полином')
hold on
ind=abs(imag(xr))>0;
xr(ind)=NaN;
plot(xr,polyval(P,xr),'r*')
legend('P(x)','Корни','Location', 'northwest')

%уточнение
figure
x=linspace(xr(2)-0.1,xr(3)+0.1,200);
plot(x,polyval(P,x))
ylim([-20 20])
grid on
xlabel('x')
ylabel('y')
title('Полином, уточнение')
hold on
XR=[xr(2) xr(3)];
plot(XR,polyval(P,XR),'r*')
plot(x1r(2),polyval(P,x1r(2)),'kv')
legend('P(x)','Корни','Максимум')
figure
x=linspace(xr(11)-0.1,xr(8)+0.1,200);
plot(x,polyval(P,x))
ylim([-20 20])
grid on
xlabel('x')
ylabel('y')
title('Полином, уточнение')
hold on
XR=[xr(11) xr(8)];
plot(XR,polyval(P,XR),'r*')
plot(x1r(3),polyval(P,x1r(3)),'kv')
legend('P(x)','Корни','Максимум')

%производные
figure
ind=abs(imag(x1r))>0;
x1r(ind)=NaN;
ind=abs(imag(x2r))>0;
x2r(ind)=NaN;
ind=abs(imag(x3r))>0;
x3r(ind)=NaN;
x=linspace(xr(2)-0.1,xr(1)+0.1,200);
subplot(4,1,1)
plot(x,polyval(P,x))
ylim([-25 25])
xlim([-2 8.5])
grid on
xlabel('x')
ylabel('y')
%title('Полином')
hold on
plot(xr,polyval(P,xr),'r*')

subplot(4,1,2)
plot(x,polyval(P1,x))
ylim([-25 25])
xlim([-2 8.5])
grid on
xlabel('x')
ylabel('y')
%title('Производная')
hold on
plot(x1r,polyval(P1,x1r),'r*')

subplot(4,1,3)
plot(x,polyval(P2,x))
ylim([-25 25])
xlim([-2 8.5])
grid on
xlabel('x')
ylabel('y')
%title('Вторая производная')
hold on
plot(x2r,polyval(P2,x2r),'r*')

subplot(4,1,4)
plot(x,polyval(P3,x))
ylim([-25 25])
xlim([-2 8.5])
grid on
xlabel('x')
ylabel('y')
%title('Третья производная')
hold on
plot(x3r,polyval(P3,x3r),'r*')

%погрешность
[xpm1 ypm1]=fminsearch(@Poly1,-1);
[xpm2 ypm2]=fminsearch(@Poly,0);
[xpm3 ypm3]=fminsearch(@Poly1,1);
[xpm4 ypm4]=fminsearch(@Poly,7);
deltaex=[x1r(1)-xpm4 x1r(2)-xpm1 x1r(3)-xpm3 x1r(10)-xpm2];
D(:,1)=[x1r(1); x1r(2); x1r(3); x1r(10)];
D(:,2)=[xpm4; xpm1; xpm3; xpm2];
disp(D)

%погрешность 2
P(2)=P(2)+0.05*P(2)*rand;
xrd=roots(P);
ind=abs(imag(xrd))>0;
xrd(ind)=NaN;
deltaroots=abs(xr-xrd);
deltaroots0=abs(deltaroots./xr).*100;
R(:,1)=xr;
R(:,2)=xrd;
disp(R)