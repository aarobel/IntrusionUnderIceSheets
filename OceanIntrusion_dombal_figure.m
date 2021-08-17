clear all;
close all;

%% Integration from ocean upstream with all terms with small Fr0 and large gamma
Fr0 = 1e-2;
Ci = 1e-1;
Cd = 1;
theta = 0;
gamma = 100;

% Initial conditions
h(1) = Fr0^(2/3);
x(1) = 0;
i=1;
while h(i) < 1 %stop when freshwater occupies entire layer
    dx = 1e-16 + (1e-3-1e-16)*tanh(-10*x(i));   %start with very small O(machine precision) grid spacing and then increase as gradient decreases
    if(i==1)
        Fr = 1 - 1e-8;  %avoid singularity due to Fr=1 at boundary
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

figure(1);set(1,'units','normalized','position',[0 0.1 0.4 0.8]);
subplot(4,1,1)
plot(linspace(0,min(x),100),interp1(x,1-h,linspace(0,min(x),100)),'k','linewidth',3);hold on;
set(gca,'fontsize',20)
xlabel('x','fontsize',20)
ylabel('h','fontsize',20)
ylim([0 1]);%xlim([-5 0])

%% Integration from ocean upstream without C_i and  with small Fr0  and large gamma
h=[];
x=[];
Ci = 0;
% Initial conditions
h(1) = Fr0^(2/3);
x(1) = 0;
i=1;
while h(i) < 1 %stop when freshwater occupies entire layer
    dx = 1e-16 + (1e-3-1e-16)*tanh(-10*x(i));   %start with very small O(machine precision) grid spacing and then increase as gradient decreases
    if(i==1)
        Fr = 1 - 1e-8;  %avoid singularity due to Fr=1 at boundary
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

figure(1);
subplot(4,1,1)
plot(linspace(0,min(x),100),interp1(x,1-h,linspace(0,min(x),100)),'r--','linewidth',3);hold on;
set(gca,'fontsize',20)
xlabel('x','fontsize',20)
ylabel('h','fontsize',20)
ylim([0 1]);%xlim([-5 0])

l_p = 1/(3*gamma*Cd*Fr0^2);
plot(-l_p,0,'m.','markersize',30)
legend('C_i=0.1','C_i=0','Theory (l_p)','Location','NorthWest')
title('Fr_0<<1, \gamma>>1')
%% Integration from ocean upstream with all terms and large Fr0
h=[];
x=[];
Ci = 1e-1;
Fr0 = 5e-1;
% Initial conditions
h(1) = Fr0^(2/3);
x(1) = 0;
i=1;
while h(i) < 1 %stop when freshwater occupies entire layer
    dx = 1e-16 + (1e-3-1e-16)*tanh(-10*x(i));   %start with very small O(machine precision) grid spacing and then increase as gradient decreases
    if(i==1)
        Fr = 1 - 1e-8;  %avoid singularity due to Fr=1 at boundary
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

figure(1);
subplot(4,1,2)
plot(linspace(0,min(x),100),interp1(x,1-h,linspace(0,min(x),100)),'k','linewidth',3);hold on;
set(gca,'fontsize',20)
xlabel('x','fontsize',20)
ylabel('h','fontsize',20)
ylim([0 1]);%xlim([-1 0])
%% Integration from ocean upstream without C_i and large Fr0
h=[];
x=[];
Ci = 0;
Fr0 = 5e-1;
% Initial conditions
h(1) = Fr0^(2/3);
x(1) = 0;
i=1;
while h(i) < 1 %stop when freshwater occupies entire layer
    dx = 1e-16 + (1e-3-1e-16)*tanh(-10*x(i));   %start with very small O(machine precision) grid spacing and then increase as gradient decreases
    if(i==1)
        Fr = 1 - 1e-8;  %avoid singularity due to Fr=1 at boundary
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

figure(1);
subplot(4,1,2)
plot(linspace(0,min(x),100),interp1(x,1-h,linspace(0,min(x),100)),'r--','linewidth',3);hold on;
set(gca,'fontsize',20)
xlabel('x','fontsize',20)
ylabel('h','fontsize',20)
ylim([0 1]);%xlim([-1 0])

l_p = 1/(3*gamma*Cd*Fr0^2);
plot(-l_p,0,'m.','markersize',30)
legend('C_i=0.1','C_i=0','Theory (l_p)','Location','NorthWest')
title('Fr_0=0.5, \gamma>>1')
%% Integration from ocean upstream with all terms and medium gamma
h=[];
x=[];
Ci = 1e-1;
Fr0 = 1e-2;
gamma=6;
% Initial conditions
h(1) = Fr0^(2/3);
x(1) = 0;
i=1;
while h(i) < 1 %stop when freshwater occupies entire layer
    dx = 1e-16 + (1-1e-16)*tanh(-10*x(i));   %start with very small O(machine precision) grid spacing and then increase as gradient decreases
    if(i==1)
        Fr = 1 - 1e-8;  %avoid singularity due to Fr=1 at boundary
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

figure(1);
subplot(4,1,3)
plot(linspace(0,min(x),100),interp1(x,1-h,linspace(0,min(x),100)),'k','linewidth',3);hold on;
set(gca,'fontsize',20)
xlabel('x','fontsize',20)
ylabel('h','fontsize',20)
ylim([0 1]);%xlim([-1 0])
%% Integration from ocean upstream without C_i and medium gamma
h=[];
x=[];
Ci = 1e-2;
Fr0 = 1e-2;
% Initial conditions
h(1) = Fr0^(2/3);
x(1) = 0;
i=1;
while h(i) < 1 %stop when freshwater occupies entire layer
    dx = 1e-16 + (1-1e-16)*tanh(-10*x(i));   %start with very small O(machine precision) grid spacing and then increase as gradient decreases
    if(i==1)
        Fr = 1 - 1e-8;  %avoid singularity due to Fr=1 at boundary
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

figure(1);
subplot(4,1,3)
plot(linspace(0,min(x),100),interp1(x,1-h,linspace(0,min(x),100)),'b--','linewidth',3);hold on;
set(gca,'fontsize',20)
xlabel('x','fontsize',20)
ylabel('h','fontsize',20)
ylim([0 1]);%xlim([-1 0])
%% Integration from ocean upstream without C_i and medium gamma
h=[];
x=[];
Ci = 0;
Fr0 = 1e-2;
% Initial conditions
h(1) = Fr0^(2/3);
x(1) = 0;
i=1;
while h(i) < 1 %stop when freshwater occupies entire layer
    dx = 1e-16 + (1-1e-16)*tanh(-10*x(i));   %start with very small O(machine precision) grid spacing and then increase as gradient decreases
    if(i==1)
        Fr = 1 - 1e-8;  %avoid singularity due to Fr=1 at boundary
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

figure(1);
subplot(4,1,3)
plot(linspace(0,min(x),100),interp1(x,1-h,linspace(0,min(x),100)),'r--','linewidth',3);hold on;
set(gca,'fontsize',20)
xlabel('x','fontsize',20)
ylabel('h','fontsize',20)
ylim([0 1]);%xlim([-1 0])

l_p = 1/(3*gamma*Cd*Fr0^2);
plot(-l_p,0,'m.','markersize',30)
legend('C_i=0.1','C_i=0.01','C_i=0','Theory (l_p)','Location','NorthWest')
title('Fr_0<<1, \gamma=6')
%% Integration from ocean upstream with all terms and zero gamma
h=[];
x=[];
Ci = 1e-1;
Fr0 = 1e-2;
gamma = 1e-2;
% Initial conditions
h(1) = Fr0^(2/3);
x(1) = 0;
i=1;
while h(i) < 1 %stop when freshwater occupies entire layer
    dx = 1e-16 + (1-1e-16)*tanh(-10*x(i));   %start with very small O(machine precision) grid spacing and then increase as gradient decreases
    if(i==1)
        Fr = 1 - 1e-8;  %avoid singularity due to Fr=1 at boundary
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

figure(1);
subplot(4,1,4)
plot(linspace(0,min(x),100),interp1(x,1-h,linspace(0,min(x),100)),'k','linewidth',3);hold on;
set(gca,'fontsize',20)
xlabel('x','fontsize',20)
ylabel('h','fontsize',20)
ylim([0 1]);%xlim([-30 0])

%% Integration from ocean upstream without C_i and zero gamma
h=[];
x=[];
Ci = 1e-2;
Fr0 = 1e-2;
% Initial conditions
h(1) = Fr0^(2/3);
x(1) = 0;
i=1;
while h(i) < 1 %stop when freshwater occupies entire layer
    dx = 1e-16 + (1-1e-16)*tanh(-10*x(i));   %start with very small O(machine precision) grid spacing and then increase as gradient decreases
    if(i==1)
        Fr = 1 - 1e-8;  %avoid singularity due to Fr=1 at boundary
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

figure(1);
subplot(4,1,4)
plot(linspace(0,min(x),100),interp1(x,1-h,linspace(0,min(x),100)),'b--','linewidth',3);hold on;
set(gca,'fontsize',20)
xlabel('x','fontsize',20)
ylabel('h','fontsize',20)
ylim([0 1]);%xlim([-30 0])

%% Integration from ocean upstream without C_i and zero gamma
h=[];
x=[];
Ci = 0;
Fr0 = 1e-2;
% Initial conditions
h(1) = Fr0^(2/3);
x(1) = 0;
i=1;
while h(i) < 1 %stop when freshwater occupies entire layer
    dx = 1e-16 + (1-1e-16)*tanh(-10*x(i));   %start with very small O(machine precision) grid spacing and then increase as gradient decreases
    if(i==1)
        Fr = 1 - 1e-8;  %avoid singularity due to Fr=1 at boundary
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

figure(1);
subplot(4,1,4)
plot(linspace(0,min(x),100),interp1(x,1-h,linspace(0,min(x),100)),'r--','linewidth',3);hold on;
set(gca,'fontsize',20)
xlabel('x','fontsize',20)
ylabel('h','fontsize',20)
ylim([0 1]);%xlim([-30 0])

l_u = 1/(4*Cd*Fr0^2);
plot(-l_u,0,'m.','markersize',30)
legend('C_i=0.1','C_i=0.01','C_i=0','Theory (l_u)','Location','NorthWest')
title('Fr_0<<1, \gamma<<1')