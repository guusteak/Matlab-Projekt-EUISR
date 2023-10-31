syms theta1 theta2 lambda3

l= sym([0 0 1]);
lambda=sym([0 1 lambda3]);
alpha=sym([pi/2 pi/2 0]);
theta=sym([theta1 theta2 pi/2]);

k = size(theta);
n = k(2);
for i=1:n
    A = matrixA(theta(i), lambda(i), l(i), alpha(i));
    eval(['A' num2str(i) '=A;'])
end

T30=A1*A2*A3
p30=T30(1:3,4);
p30s = subs(p30);

disp("Podaj współrzędne kartezjańskie {X, Y, Z} chwytaka względem podstawy manipulatora")
rxnum = input("Podaj współrzędną X: ")
rynum = input("Podaj współrzędną Y: ")
rznum = input("Podaj współrzędną Z: ")

rx = p30s(1)
ry = p30s(2)
rz = p30s(3)

%row1 = rx - rxnum;
%row2 = ry - rynum;
%row3 = rz - rznum;
row1 = rxnum*sin(theta1) - rynum*cos(theta1) - 2
row2 = (rxnum*cos(theta1) + rynum*sin(theta1))*sin(theta2) - rznum*cos(theta2)
row3 = (rynum+2*cos(theta1))/(sin(theta1)*sin(theta2)) - lambda3
rozw = solve(row1==0, row2==0, row3==0);

theta1_rozw = double(rozw.theta1)
theta2_rozw = double(rozw.theta2)
lambda3_rozw = double(rozw.lambda3)

%-----------------------------------------
% metoda z procedurą zadania odwrotnego

% równanie (row1) pomnożono przez sin(theta1) a równanie (row2) pomnożono przez
% cos(theta1). Równania następnie dodano stronami do siebie i dzięki temu
% wyliczono zmienną theta1.

%row1_2=row1*sin(theta1)-row2*cos(theta1);
%row1_2simply=vpa(rynum*cos(theta1)-rxnum*sin(theta1)+l(3)+lambda(2));
%row1_2sym=subs(row1_2simply);
%theta1_end = round(simplify(solve(row1_2sym)),3);

% równanie (row1) pomnożono przez cos(theta1) a równanie (row2) pomnożono przez
% sin(theta1). Równania te dodano stronami i stworzono z nich jedno
% równanie. To nowo utworzone równanie pomnożono przez cos(theta2) a
% równanie (row3) pomnożono przez sin(theta2) a następnie dodano je
% stronami. W ten sposób wyliczono theta2.
%row1_31simply = (rznum*sin(theta2)+rxnum*cos(theta1_end(1))*cos(theta2)+rynum*sin(theta1_end(1))*cos(theta2));
%row1_31sym = subs(row1_31simply);
%theta2_end_1 = round(simplify(solve(row1_31sym == 0)),3);

%row1_32simply = (rznum*sin(theta2)+rxnum*cos(theta1_end(2))*cos(theta2)+rynum*sin(theta1_end(2))*cos(theta2));
%row1_32sym = subs(row1_32simply);
%theta2_end_2 = round(simplify(solve(row1_32sym == 0)),3);

% do równania (row3) podstawiono wcześniej obliczone theta2 i na tej
% podstawie wyliczono wartości lambda3.
%row31_simply = rznum + lambda3*cos(theta2_end_1);
%row32_simply = rznum + lambda3*cos(theta2_end_1);
%row31_sym = (subs(row31_simply));
%row32_sym = (subs(row32_simply));
%lambda3_end_1 = round(simplify(solve(row31_sym == 0)),3);
%lambda3_end_2 = round(simplify(solve(row32_sym == 0)),3);

% Odrzucenie nieprawidłowych

%theta1_wyniki = [];
%for k=1:4
%    current_theta1 = theta1_rozw(k);
%    Re = real(current_theta1);
%    Im = imag(current_theta1);
%    if (-10^-6) <= Im && (Im <= 10^-6)
%        theta1_wyniki = [theta1_wyniki; Re];
%    end
%end

%theta2_wyniki = [];
%for k=1:4
%    current_theta2 = theta2_rozw(k);
%    Re = real(current_theta2);
%    Im = imag(current_theta2);
%    if (-10^-6) <= Im && (Im <= 10^-6)
%        theta2_wyniki = [theta2_wyniki; Re];
%    end
%end

%lambda3_wyniki = [];
%for k=1:4
%    current_lambda3 = lambda3_rozw(k);
%    Re = real(current_lambda3);
%    Im = imag(current_lambda3);
%    if ((-10^-6) <= Im) && (Im <= (10^-6))
%        lambda3_wyniki = [lambda3_wyniki; Re];
%    end
%end