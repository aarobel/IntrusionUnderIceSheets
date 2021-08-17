clear all;
close all;

%% Parameter sweep for gamma = 0 and Fr0 = 0.1 (free water sheet, low flow)
dxm = 1e-2;
gamma = 0;
Fr0 = 0.1;
Cd = 1;
Lsc = 1/(Cd*Fr0^2);

Cis = linspace(0,1,10);
thetas = linspace(-1,1,21);
Ls = nan.*ones(length(Cis),length(thetas));

a = 0;
for Ci = Cis
    a=a+1;b=0;
    for theta = thetas
        b=b+1;
        if(b>1);if(Ls(a,b-1)>=100);Ls(a,b) = 100;continue;end;end
        h(1) = Fr0^(2/3);
        x(1) = 0;
        i=1;
        while h(i) < 1 && x(i) > -100
            dx = 1e-16 + (dxm-1e-16)*tanh(-10*x(i));
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

            [a,b,x(i)]
        end
        Ls(a,b) = -x(i);
    end
end

[CI,THETA] = meshgrid(Cis,thetas);
figure(1);
subplot(2,2,1)
pcolor(CI',THETA',Ls./Lsc);colorbar;caxis([0 1]);shading('flat')
xlabel('C_i','fontsize',16)
ylabel('\Theta','fontsize',16)
title('\gamma=0','fontsize',16)

%% Parameter sweep for gamma = 0 and Ci = 0.1 (free water sheet, low interfacial drag)
dxm = 1e-2;
gamma = 0;
Ci = 0.1;
Cd = 1;
Lsc = 1/(Cd*0.1^2);

Fr0s = linspace(0.05,1,10);
thetas = linspace(-1,1,21);

a = 0;
for Fr0 = Fr0s
    a=a+1;b=0;
    for theta = thetas
        b=b+1;
        if(b>1);if(Ls(a,b-1)>=100);Ls(a,b) = 100;continue;end;end
        h(1) = Fr0^(2/3);
        x(1) = 0;
        i=1;
        while h(i) < 1 && x(i) > -100
            dx = 1e-16 + (dxm-1e-16)*tanh(-10*x(i));
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

            [a,b,x(i)]
        end
        Ls(a,b) = -x(i);
    end
end

[FR0,THETA] = meshgrid(Fr0s,thetas);
figure(1);
subplot(2,2,2)
pcolor(FR0',THETA',Ls./Lsc);colorbar;caxis([0 1]);shading('flat')
xlabel('Fr_0','fontsize',16)
ylabel('\Theta','fontsize',16)
title('\gamma=0','fontsize',16)

%% Parameter sweep for gamma = 3 and Fr0 = 0.1 (free water sheet, low flow)
dxm = 1e-2;
gamma = 3;
Fr0 = 0.1;
Cd = 1;
Lsc = 1/(Cd*Fr0^2);

Cis = linspace(0,1,10);
thetas = linspace(-1,1,21);
Ls = nan.*ones(length(Cis),length(thetas));

a = 0;
for Ci = Cis
    a=a+1;b=0;
    for theta = thetas
        b=b+1;
        if(b>1);if(Ls(a,b-1)>=100);Ls(a,b) = 100;continue;end;end
        h(1) = Fr0^(2/3);
        x(1) = 0;
        i=1;
        while h(i) < 1 && x(i) > -100
            dx = 1e-16 + (dxm-1e-16)*tanh(-10*x(i));
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

            [a,b,x(i)]
        end
        Ls(a,b) = -x(i);
    end
end

[CI,THETA] = meshgrid(Cis,thetas);
figure(1);
subplot(2,2,3)
pcolor(CI',THETA',Ls./Lsc);colorbar;caxis([0 1]);shading('flat')
xlabel('C_i','fontsize',16)
ylabel('\Theta','fontsize',16)
title('\gamma=3','fontsize',16)

%% Parameter sweep for gamma = 3 and Ci = 0.1 (free water sheet, low interfacial drag)
dxm = 1e-2;
gamma = 3;
Ci = 0.1;
Cd = 1;
Lsc = 1/(Cd*0.1^2);

Fr0s = linspace(0.05,1,10);
thetas = linspace(-1,1,21);

a = 0;
for Fr0 = Fr0s
    a=a+1;b=0;
    for theta = thetas
        b=b+1;
        if(b>1);if(Ls(a,b-1)>=100);Ls(a,b) = 100;continue;end;end
        h(1) = Fr0^(2/3);
        x(1) = 0;
        i=1;
        while h(i) < 1 && x(i) > -100
            dx = 1e-16 + (dxm-1e-16)*tanh(-10*x(i));
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

            [a,b,x(i)]
        end
        Ls(a,b) = -x(i);
    end
end

[FR0,THETA] = meshgrid(Fr0s,thetas);
figure(1);
subplot(2,2,4)
pcolor(FR0',THETA',Ls./Lsc);colorbar;caxis([0 1]);shading('flat')
xlabel('Fr_0','fontsize',16)
ylabel('\Theta','fontsize',16)
title('\gamma=3','fontsize',16)
