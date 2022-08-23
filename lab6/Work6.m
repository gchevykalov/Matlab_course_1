load('A.txt');
load('B.txt');

%метод Крамера
d0 = det(A);
for i = 1 : 1 : 10
  load('A.txt');
  A( : , i ) = B;
  d(i) = det(A); 
  x1(i) = d(i) ./ d0;
end
x1

%обратная матрица
load('A.txt');
C = pinv(A);
D = B';
x2 = C * D

%операция \
x3 = A\D

x1new = x1';
vector_nevyazok1 = A * x1new - D;
vector_nevyazok2 = A * x2 - D;
vector_nevyazok3 = A * x3 - D;

max_nevyazka1 = max( abs(vector_nevyazok1) )
max_nevyazka2 = max( abs(vector_nevyazok2) )
max_nevyazka3 = max( abs(vector_nevyazok3) )

%rand
load('A.txt');
[m n]=size(D);
for i=1:m
Dnew(i,1) = D(i,1) * rand * 0.02+D(i,1);
end% 2%
x4 = A\Dnew;
deltax1 = x3 - x4;
izmx1 = norm(deltax1) / norm(x3);
deltay1 = D - Dnew;
izmy1 = norm(deltay1) / norm(D);

[m n]=size(D);
for i=1:m
Dnew(i,1) = D(i,1) * rand * 0.03+D(i,1);
end% 3%
x5 = A\Dnew;
deltax2 = x3 - x5;
izmx2 = norm(deltax2) / norm(x3);
deltay2 = D - Dnew;
deltay2./D
izmy2 = norm(deltay2) / norm(D);

[m n]=size(D);
for i=1:m
Dnew(i,1) = D(i,1) * rand * 0.04+D(i,1);
end% 4%
x6 = A\Dnew;
deltax3 = x3 - x6;
izmx3 = norm(deltax3) / norm(x3);
deltay3 = D - Dnew;
izmy3 = norm(deltay3) / norm(D);

[m n]=size(D);
for i=1:m
Dnew(i,1) = D(i,1) * rand * 0.05+D(i,1);
end% 5%
x7 = A\Dnew;
deltax4 = x3 - x7;
izmx4 = norm(deltax4) / norm(x3);
deltay4 = D - Dnew;
izmy4 = norm(deltay4) / norm(D);

X=[izmx1,izmx2,izmx3,izmx4];
Y=[izmy1,izmy2,izmy3,izmy4];
plot(Y,X,'ro')
title('Погрешность')
xlabel('Погрешность исходных данных')
ylabel('Погрешность решений')
grid on