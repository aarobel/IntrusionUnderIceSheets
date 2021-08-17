clear all;
close all;

Fr0 = 0.1;
Ci = 0;
Cd = 1;
theta = 0;

% por = 0.5;
% d = 0.25;
% gamma = 2*por/(pi*d*(1-por));
gamma = 0;

% dx = 1e-3;
h(1) = Fr0^(2/3);
x(1) = 0;
i=1;
while h(i) < 1
    dx = 1e-16 + (1e-3-1e-16)*tanh(-10*x(i));
    if(i==1)
        Fr = 1 - 1e-8;
    else
        Fr = Fr0/(h(i)^1.5);
    end
    
    int = ((Fr^2)*((Ci/(1-h(i))) + Cd*(1+gamma*h(i))) - theta)/(Fr^2 - 1);
    
    h(i+1) = h(i) - dx*int;
    x(i+1) = x(i) - dx;

    int1(i) = (Ci/(1-h(i)));
    int2(i) = Cd*(1+gamma*h(i));    
    int3(i) = ((Fr^2 - 1)/Fr^2)*(h(i) - h(i+1))/dx;
    i = i+1;
    
    [x(i),h(i)]
    
end

%% Plots
figure(1);
% subplot(2,1,1);
plot(x,1-h,'k');hold on;set(gca,'XDir','Reverse')
% subplot(2,1,2);
% plot(x,-2*(gamma^3).*h.^3);hold on;set(gca,'XDir','Reverse')
% plot(x,3*(gamma^2).*h.^2);hold on;set(gca,'XDir','Reverse')
% plot(x,6*(gamma).*h);hold on;set(gca,'XDir','Reverse')
% plot(x,6*((Fr0^2)*(gamma^3)+1)*log(1+gamma*h));hold on;set(gca,'XDir','Reverse')

% plot(x(1:length(int1)),int1);hold on;set(gca,'XDir','Reverse')
% plot(x(1:length(int1)),int2);hold on;set(gca,'XDir','Reverse')
% plot(x(1:length(int1)),int3,'--');hold on;set(gca,'XDir','Reverse')
% legend('Ci','Cd','dh/dx')
% ylim([0 12])