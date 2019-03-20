R1 = 1;
R2 = 2;
L = 0.2;
R3 = 10;
a = 100;
R4 = 0.1;
R0 = 1000;
G = zeros(8,8);
Cm = zeros(8,8);
G(1,1) = 1/R1;
G(1,2) = -1/R1;
G(1,6) = 1;
G(2,1) = 1/R1;
G(2,2) = 1/R1 + 1/R2;
G(2,8) = 1;
G(3,3) = 1/R3;
G(3,8) = -1;
G(4,4) = 1/R4;
G(4,5) = -1/R4;
G(4,7) = 1;
G(5,4) = -1/R4;
G(5,5) = 1/R4 + 1/R0;
G(6,1) = 1;
G(7,4) = 1;
G(7,8) = a;
G(8,2) = -1;
G(8,3) = 1;
Cm(1,1) = C;
Cm(1,2) = -C;
Cm(2,1) = -C;
Cm(2,2) = C;
Cm(8,8) = -L;

F = zeros(8,1);
count = 1;
for i = -10:10
    F(6) = i;
    V = G\F;
    V0(count) = V(5);
    V3(count) = V(3);
    count = count + 1;
end

plot(V0, linspace(-10,10,21))
hold on
plot(V3, linspace(-10,10,21))

F(6) = 1;

for w = 1:1000000
    Gac = G + sqrt(-1)*w*Cm;
    Vac = G\F;
    Vac0(w) = V(5);
end



    
