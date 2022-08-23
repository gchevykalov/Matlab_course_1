%пункт А
%элипсоид
a=9.61;
b=4.66;
c=7.87;
x0=-0.31;
y0=1.77;
z0=-1.99;
u=linspace(0,2*pi,100);
v=linspace(0,2*pi,100);
[U V]=meshgrid(u,v);
X=a*sin(U).*cos(V)+x0;
Y=b*sin(U).*sin(V)+y0;
Z=c*cos(U)+z0;
mesh(X,Y,Z)
colormap('spring')

%однополостной гиперболоид
figure
a=2.22;
b=0.84;
c=-0.74;
x0=1.08;
y0=1.27;
z0=0.96;
u=linspace(-2,2,200);
v=linspace(-pi,pi,200);
[U V]=meshgrid(u,v);
X=a*cosh(U).*cos(V)+x0;
Y=b*cosh(U).*sin(V)+y0;
Z=c*sinh(U)+z0;
surf(X,Y,Z)
colormap('winter')
shading interp

%пункт Б
figure
a=2.22;
b=0.84;
c=-0.74;
x0=1.08;
y0=1.27;
z0=0.96;
subplot(2,2,1)
u=linspace(-2,2,50);
v=linspace(-pi,pi,50);
[U V]=meshgrid(u,v);
X=a*cosh(U).*cos(V)+x0;
Y=b*cosh(U).*sin(V)+y0;
Z=c*sinh(U)+z0;
mesh(X,Y,Z)
view(-40,30)
subplot(2,2,2)
[n, m]=size(Z);
C=zeros(n,m,3);
for j=1:m
    C(j,:,:)=winter(n);
end
surf(X,Y,Z,C)
shading interp
view(-40,20)
subplot(2,2,3)
[n, m]=size(Z);
C=zeros(n,m,3);
for j=1:m
    C(j,:,:)=summer(n);
end
surf(X,Y,Z,C)
shading interp
view(-100,50)
subplot(2,2,4)
contour3(X,Y,Z)
view(0,10)

%пункт В
figure
a=9.61;
b=4.66;
c=7.87;
x0=-0.31;
y0=1.77;
z0=-1.99;
subplot(2,2,1)
u=linspace(0,2*pi,100);
v=linspace(0,2*pi,100);
[U V]=meshgrid(u,v);
X=a*sin(U).*cos(V)+x0;
Y=b*sin(U).*sin(V)+y0;
Z=c*cos(U)+z0;
surfl(X,Y,Z,[40,10])
shading interp
view(20,25)
subplot(2,2,2)
surfl(X,Y,Z,[40,10])
shading interp
view(-35,35)
subplot(2,2,3)
surfl(X,Y,Z,[-40,-10])
shading interp
view(20,25)
subplot(2,2,4)
surfl(X,Y,Z,[-40,-10])
view(-35,35)
shading interp
colormap('gray')