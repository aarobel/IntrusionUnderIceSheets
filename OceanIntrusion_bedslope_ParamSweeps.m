clear all;
close all;

%% Parameter sweep for gamma = 0 and Ci = 0.1 (free water sheet, low interfacial drag)
% dxm = 1e-2;
% gamma = 0;
% Ci = 1e-1;
% Cd = 1;
% 
% Fr0s = linspace(0.01,1,1000);
% thetas = linspace(-2,2,1001);
% 
% a = 0;
% for Fr0 = Fr0s
%     a=a+1;b=0;
%     for theta = thetas
%         b=b+1;
%         if(b>1);if(Ls(a,b-1)>=100);Ls(a,b) = 100;continue;end;end
%         h(1) = Fr0^(2/3);
%         x(1) = 0;
%         i=1;
%         while h(i) < 1 && x(i) > -100
%             dx = 1e-16 + (dxm-1e-16)*tanh(-10*x(i));
%             if(i==1)
%                 Fr = 1 - 1e-8;
%             else
%                 Fr = Fr0/(h(i)^1.5);
%             end
% 
%             int = ((Fr^2)*((Ci/(1-h(i))) + Cd*(1+gamma*h(i))) - theta)/(Fr^2 - 1);
% 
%             h(i+1) = h(i) - dx*int;
%             x(i+1) = x(i) - dx;
% 
%             int1(i) = (Ci/(1-h(i)));
%             int2(i) = Cd*(1+gamma*h(i));    
%             int3(i) = ((Fr^2 - 1)/Fr^2)*(h(i) - h(i+1))/dx;
%             i = i+1;
% 
%             [a,b,x(i)]
%         end
%         Ls(a,b) = -x(i);
%         Lsc(a,b) = 1/(4*Cd*Fr0^2);
%     end
% end

% save('Intrusion_paramsweep_gamma0_zoomout.mat')
load('Intrusion_paramsweep_gamma0_zoomout.mat')
Ls(Ls==100)=1000;
[FR0,THETA] = meshgrid(Fr0s,thetas);
figure(1);
subplot(2,2,1)
pcolor(FR0',0.005.*THETA',Ls.*10);cb=colorbar;caxis([10 1e4]);shading('flat')
xlabel('Fr_0','fontsize',16)
ylabel('\theta','fontsize',16)
ylabel(cb,'L (m)')
title('\gamma=0','fontsize',16)
set(gca,'fontsize',20,'ColorScale','log')
colormap(brewermap([],'GnBu'));
ylim(0.005.*[-2 2])
xlim([0.02 1])
text(0.01,1.00,'a','Units', 'Normalized', 'VerticalAlignment', 'Top','fontsize',30,'fontweight','bold','Color','w')
hold on;contour(FR0',0.005.*THETA',Ls.*10,[100 100],'Color',[0.5 0.5 0.5],'linewidth',3)
rectangle('Position',[0.02 -0.1*0.005 0.08 0.2*0.005],'EdgeColor','w','LineWidth',3)
%% Zoomed Parameter sweep for gamma = 0 and Ci = 0.1 (free water sheet, low interfacial drag)
% dxm = 1e-2;
% gamma = 0;
% Ci = 1e-1;
% Cd = 1;
% 
% Fr0s = linspace(0.01,0.1,1000);
% thetas = linspace(-0.1,0.1,1001);
% 
% a = 0;
% for Fr0 = Fr0s
%     a=a+1;b=0;
%     for theta = thetas
%         b=b+1;
%         if(b>1);if(Ls(a,b-1)>=100);Ls(a,b) = 100;continue;end;end
%         h(1) = Fr0^(2/3);
%         x(1) = 0;
%         i=1;
%         while h(i) < 1 && x(i) > -100
%             dx = 1e-16 + (dxm-1e-16)*tanh(-10*x(i));
%             if(i==1)
%                 Fr = 1 - 1e-8;
%             else
%                 Fr = Fr0/(h(i)^1.5);
%             end
% 
%             int = ((Fr^2)*((Ci/(1-h(i))) + Cd*(1+gamma*h(i))) - theta)/(Fr^2 - 1);
% 
%             h(i+1) = h(i) - dx*int;
%             x(i+1) = x(i) - dx;
% 
%             int1(i) = (Ci/(1-h(i)));
%             int2(i) = Cd*(1+gamma*h(i));    
%             int3(i) = ((Fr^2 - 1)/Fr^2)*(h(i) - h(i+1))/dx;
%             i = i+1;
% 
%             [a,b,x(i)]
%         end
%         Ls(a,b) = -x(i);
%         Lsc(a,b) = 1/(4*Cd*Fr0^2);
%     end
% end

% save('Intrusion_paramsweep_gamma0_zoomin.mat')
load('Intrusion_paramsweep_gamma0_zoomin.mat')
Ls(Ls==100)=1000;
[FR0,THETA] = meshgrid(Fr0s,thetas);
figure(1);
subplot(2,2,2)
pcolor(FR0',0.005.*THETA',Ls.*10);cb=colorbar;caxis([10 1e4]);shading('flat')
xlabel('Fr_0','fontsize',16)
ylabel('\theta','fontsize',16)
ylabel(cb,'L (m)')
title('\gamma=0','fontsize',16)
set(gca,'fontsize',20,'ColorScale','log')
colormap(brewermap([],'GnBu'));
xlim([0.02 0.1])
text(0.01,1.00,'b','Units', 'Normalized', 'VerticalAlignment', 'Top','fontsize',30,'fontweight','bold','Color','w')
hold on;contour(FR0',0.005.*THETA',Ls.*10,[100 100],'Color',[0.5 0.5 0.5],'linewidth',3)
%% Parameter sweep for gamma = 3 and Ci = 0.1 (free water sheet, low interfacial drag)
% dxm = 1e-2;
% gamma = 3;
% Ci = 1e-1;
% Cd = 1;
% 
% Fr0s = linspace(0.01,1,1000);
% thetas = linspace(-2,2,1001);
% 
% a = 0;
% for Fr0 = Fr0s
%     a=a+1;b=0;
%     for theta = thetas
%         b=b+1;
%         if(b>1);if(Ls(a,b-1)>=100);Ls(a,b) = 100;continue;end;end
%         h(1) = Fr0^(2/3);
%         x(1) = 0;
%         i=1;
%         while h(i) < 1 && x(i) > -100
%             dx = 1e-16 + (dxm-1e-16)*tanh(-10*x(i));
%             if(i==1)
%                 Fr = 1 - 1e-8;
%             else
%                 Fr = Fr0/(h(i)^1.5);
%             end
% 
%             int = ((Fr^2)*((Ci/(1-h(i))) + Cd*(1+gamma*h(i))) - theta)/(Fr^2 - 1);
% 
%             h(i+1) = h(i) - dx*int;
%             x(i+1) = x(i) - dx;
% 
%             int1(i) = (Ci/(1-h(i)));
%             int2(i) = Cd*(1+gamma*h(i));    
%             int3(i) = ((Fr^2 - 1)/Fr^2)*(h(i) - h(i+1))/dx;
%             i = i+1;
% 
%             [a,b,x(i)]
%         end
%         Ls(a,b) = -x(i);
%         Lsc(a,b) = 1/(3*gamma*Cd*Fr0^2);
%     end
% end

% save('Intrusion_paramsweep_gamma3_zoomout.mat')
load('Intrusion_paramsweep_gamma2_zoomout.mat')
Ls(Ls==100)=1000;
[FR0,THETA] = meshgrid(Fr0s,thetas);
figure(1);
subplot(2,2,3)
pcolor(FR0',0.005.*THETA',Ls.*10);cb=colorbar;caxis([10 1e4]);shading('flat')
xlabel('Fr_0','fontsize',16)
ylabel('\theta','fontsize',16)
title('\gamma=2','fontsize',16)
set(gca,'fontsize',20,'ColorScale','log')
colormap(brewermap([],'GnBu'));
ylabel(cb,'L (m)')
ylim(0.005.*[-2 2])
xlim([0.02 1])
text(0.01,1.00,'c','Units', 'Normalized', 'VerticalAlignment', 'Top','fontsize',30,'fontweight','bold','Color','w')
hold on;contour(FR0',0.005.*THETA',Ls.*10,[100 100],'Color',[0.5 0.5 0.5],'linewidth',3)
rectangle('Position',[0.02 -0.1*0.005 0.08 0.2*0.005],'EdgeColor','w','LineWidth',3)

%% Zoomed Parameter sweep for gamma = 3 and Ci = 0.1 (free water sheet, low interfacial drag)
% dxm = 1e-2;
% gamma = 3;
% Ci = 1e-1;
% Cd = 1;
% 
% Fr0s = linspace(0.01,0.1,1000);
% thetas = linspace(-0.1,0.1,1001);
% 
% a = 0;
% for Fr0 = Fr0s
%     a=a+1;b=0;
%     for theta = thetas
%         b=b+1;
%         if(b>1);if(Ls(a,b-1)>=100);Ls(a,b) = 100;continue;end;end
%         h(1) = Fr0^(2/3);
%         x(1) = 0;
%         i=1;
%         while h(i) < 1 && x(i) > -100
%             dx = 1e-16 + (dxm-1e-16)*tanh(-10*x(i));
%             if(i==1)
%                 Fr = 1 - 1e-8;
%             else
%                 Fr = Fr0/(h(i)^1.5);
%             end
% 
%             int = ((Fr^2)*((Ci/(1-h(i))) + Cd*(1+gamma*h(i))) - theta)/(Fr^2 - 1);
% 
%             h(i+1) = h(i) - dx*int;
%             x(i+1) = x(i) - dx;
% 
%             int1(i) = (Ci/(1-h(i)));
%             int2(i) = Cd*(1+gamma*h(i));    
%             int3(i) = ((Fr^2 - 1)/Fr^2)*(h(i) - h(i+1))/dx;
%             i = i+1;
% 
%             [a,b,x(i)]
%         end
%         Ls(a,b) = -x(i);
%         Lsc(a,b) = 1/(3*gamma*Cd*Fr0^2);
%     end
% end

% save('Intrusion_paramsweep_gamma3_zoomin.mat')
load('Intrusion_paramsweep_gamma2_zoomin.mat')
Ls(Ls==100)=1000;
[FR0,THETA] = meshgrid(Fr0s,thetas);
figure(1);
subplot(2,2,4)
pcolor(FR0',0.005.*THETA',Ls.*10);cb=colorbar;caxis([10 1e4]);shading('flat')
xlabel('Fr_0','fontsize',16)
ylabel('\theta','fontsize',16)
title('\gamma=2','fontsize',16)
set(gca,'fontsize',20,'ColorScale','log')
colormap(brewermap([],'GnBu'));
ylabel(cb,'L (m)')
xlim([0.02 0.1])
text(0.01,1.00,'d','Units', 'Normalized', 'VerticalAlignment', 'Top','fontsize',30,'fontweight','bold','Color','w')
hold on;contour(FR0',0.005.*THETA',Ls.*10,[100 100],'Color',[0.5 0.5 0.5],'linewidth',3)
set(1,'units','normalized','position',[0 0.1 0.5 0.6]);