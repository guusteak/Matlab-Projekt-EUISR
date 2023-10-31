t0=0;
tk=6;
t=[t0:0.01:tk];
tau=t./tk;
%theta1 theta2 theta3
q_A=[-10 20 -30];
q_B=[2 3 4];
k=size(q_A);
n=k(2);
%Pierwszy warunek dotyczy położenia
%Drugi warunek dotyczy prędkości
%Trzeci dotyczy położenia dla tK
%Czwarty dotyczy prędkości
A=[1 0 0 0;
   0 1/tk 0 0;
   1 1 1 1;
   0 1/tk 2/tk 3/tk];
for i=1:n
    B=[q_A(i) 0 q_B(i) 0]';
    X=inv(A)*B;
    a0=X(1);
    a1=X(2);
    a2=X(3);
    a3=X(4);
    q_tau=a0+a1*tau+a2*tau.^2+a3*tau.^3;
    dq_tau=a1 + 2*a2*tau + 3*a3*tau.^2; % Pochodna pierwszego rzędu
    ddq_tau=2*a2 + 6*a3*tau; % Pochodna drugiego rzędu
    
    % Wykres q_tau
    subplot(3,3,i);
    plot(tau,q_tau,'r');
    title(['q_t_a_u dla theta', num2str(i)]);
    
    % Wykres dq_tau (pochodnej pierwszego rzędu)
    subplot(3,3,i+3);
    plot(tau,dq_tau,'b');
    title(['dq_t_a_u/dtau dla theta', num2str(i)]);
    
    % Wykres ddq_tau (pochodnej drugiego rzędu)
    subplot(3,3,i+6); %drugie pochodne mają być wyświetlone w trzecim rzędzie
    plot(tau,ddq_tau,'g'); % Kolor zielony dla drugiej pochodnej
    title(['ddq_t_a_u/dtau^2 dla theta', num2str(i)]);
end

m = menu('Iluzja wyboru: ', 'q', 'dq', 'ddq');


