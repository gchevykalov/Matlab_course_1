%декартовы координаты
%эллипсоид в декартовых координатах
figure
a=9.61;
b=4.66;
c=7.87;
x0=-0.31;
y0=1.77;
z0=-1.99;
x=linspace(-10,10,150);
y=linspace(-10,10,150);
[X,Y]=meshgrid(x,y);
Z1=sqrt(c^2*(1-(Y-y0).^2/b^2-(X-x0).^2/a^2))+z0;
Z2=-sqrt(c^2*(1-(Y-y0).^2/b^2-(X-x0).^2/a^2))+z0;
ind=abs(imag(Z1))>1.5;
Z1(ind)=NaN;
ind=abs(imag(Z1))<1.5;
Z1(ind)=real(Z1(ind));
ind=abs(imag(Z2))>1.5;
Z2(ind)=NaN;
ind=abs(imag(Z2))<1.5;
Z2(ind)=real(Z2(ind));
mesh(X,Y,Z1)
hold on
mesh(X,Y,Z2)

%однополостной гиперболоид в декартовых координатах
ag=2.22;
bg=0.84;
cg=-0.74;
xg0=1.08;
yg0=1.27;
zg0=0.96;
xg=linspace(-20,20,100);
yg=linspace(-20,20,100);
[Xg,Yg]=meshgrid(xg,yg);
Zg1=sqrt(cg^2*((Yg-yg0).^2/bg^2+(Xg-xg0).^2/ag^2-1))+zg0;
Zg2=-sqrt(cg^2*((Yg-yg0).^2/bg^2+(Xg-xg0).^2/ag^2-1))+zg0;
ind=abs(imag(Zg1))>0.5;
Zg1(ind)=NaN;
ind=abs(imag(Zg1))<0.5;
Zg1(ind)=real(Zg1(ind));
ind=Zg1>5;
Zg1(ind)=NaN;
ind=abs(imag(Zg2))>0.5;
Zg2(ind)=NaN;
ind=abs(imag(Zg2))<0.5;
Zg2(ind)=real(Zg2(ind));
ind=Zg2<-5;
Zg2(ind)=NaN;
colormap('winter')
[n, m]=size(Zg1);
C=zeros(n,m,3);
for j=1:m
    C(j,:,:)=spring(n);
end
surf(Xg,Yg,Zg1,C)
hold on
[n, m]=size(Zg2);
C1=zeros(n,m,3);
for j=1:m
    C1(j,:,:)=spring(n);
end
surf(Xg,Yg,Zg2,C1)
shading interp

view(-40,80)

figure
mesh(X,Y,Z1)
hold on
mesh(X,Y,Z2)
colormap('winter')
surf(Xg,Yg,Zg1,C)
hold on
surf(Xg,Yg,Zg2,C1)
shading interp
view(90,40)
figure
mesh(X,Y,Z1)
hold on
mesh(X,Y,Z2)
colormap('winter')
surf(Xg,Yg,Zg1,C)
hold on
surf(Xg,Yg,Zg2,C1)
shading interp
view(160,-20)

%параметрическое задание
%элипсоид
figure
ap=9.61;
bp=4.66;
cp=7.87;
xp0=-0.31;
yp0=1.77;
zp0=-1.99;
u=linspace(0,2*pi,100);
v=linspace(0,2*pi,100);
[U V]=meshgrid(u,v);
Xp=a*sin(U).*cos(V)+x0;
Yp=b*sin(U).*sin(V)+y0;
Zp=c*cos(U)+z0;
mesh(Xp,Yp,Zp)
hold on
%однополостной гиперболоид
apg=2.22;
bpg=0.84;
cpg=-0.74;
xpg0=1.08;
ypg0=1.27;
zpg0=0.96;
ug=linspace(-2.5,2.5,200);
vg=linspace(-pi,pi,200);
[Ug Vg]=meshgrid(ug,vg);
Xpg=apg*cosh(Ug).*cos(Vg)+xpg0;
Ypg=bpg*cosh(Ug).*sin(Vg)+ypg0;
Zpg=cpg*sinh(Ug)+zpg0;
[n, m]=size(Zpg);
Cpg=zeros(n,m,3);
for j=1:m
    Cpg(j,:,:)=hsv(n);
end
surf(Xpg,Ypg,Zpg,Cpg)
colormap('winter')
shading interp
view(-35,40)

figure
mesh(Xp,Yp,Zp)
hold on
surf(Xpg,Ypg,Zpg,Cpg)
colormap('winter')
shading interp
view(40,10)
figure
mesh(Xp,Yp,Zp)
hold on
surf(Xpg,Ypg,Zpg,Cpg)
colormap('winter')
shading interp
view(-50,-55)