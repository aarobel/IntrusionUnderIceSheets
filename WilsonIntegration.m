clear all;
close all;

Fr0 = 0.1;
w = 10000;
Ci = 0;
Cd = 10;
theta = 0;

n = 1e5;
x = linspace(0,-10,n);
dx = -diff(x(1:2));
h = nan.*ones(n,1);
h(1) = Fr0^(2/3);

i=1;
while h(i) < 1
    if(i==1)
        Fr = Fr0/(h(i)^1.5) - 1e-2;
    else
        Fr = Fr0/(h(i)^1.5);
    end
    
    int = ((Fr^2)*((Ci/(1-h(i))) + Cd*(1+(2*h(i)/w))) - theta)/(Fr^2 - 1);
    
    h(i+1) = h(i) - dx*int;

    int1(i) = (Ci/(1-h(i)));
    int2(i) = Cd*(1+(2*h(i)/w));    
    int3(i) = ((Fr^2 - 1)/Fr^2)*(h(i) - h(i+1))/dx;
    i = i+1
    
end

%% Plots
figure(1);
subplot(2,1,1);
plot(x,1-h,'k');hold on;set(gca,'XDir','Reverse')
subplot(2,1,2);
plot(x(1:length(int1)),int1);hold on;set(gca,'XDir','Reverse')
plot(x(1:length(int1)),int2);hold on;set(gca,'XDir','Reverse')
plot(x(1:length(int1)),int3,'--');hold on;set(gca,'XDir','Reverse')
legend('Ci','Cd','dh/dx')
ylim([0 12])