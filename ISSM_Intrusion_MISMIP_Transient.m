clear all;close all;

glds = [0 100 250 500 1000 2000 4000];
clr = winter(length(glds));
% clr=brewermap(length(glds),'PiYG');
clr(1,:) = [0 0 0];

%% Load and plot transient experiment 2ter .mat VAF data

for i = 1:length(glds)
    load(['VAF_MISMIP_125m_viscous_gld' int2str(glds(i)) '_MP2ter.mat'])
    if(i==1);VAF_norm = VAF(1);end
    figure(1);subplot(2,1,1);plot(linspace(0,100,11),VAF./1e9,'-','Color',clr(i,:),'linewidth',3);hold on 
end
ylim([min(VAF./1e9) max(VAF./1e9)])
ylabel('Volume above flotation (km^3)','fontsize',24)

load(['VAF_MISMIP_125m_viscous_gld0_m60_MP2ter.mat'])
figure(1);subplot(2,1,1);plot(linspace(0,100,11),VAF./1e9,'--','Color',clr(1,:),'linewidth',3);hold on 


load(['VAF_MISMIP_125m_viscous_gld0_m90_MP2ter.mat'])
figure(1);subplot(2,1,1);plot(linspace(0,100,11),VAF./1e9,':','Color',clr(1,:),'linewidth',3);hold on 


yyaxis right
for i = 1:length(glds)
    load(['VAF_MISMIP_125m_viscous_gld' int2str(glds(i)) '_MP2ter.mat'])
    if(i==1);VAF_change_norm = VAF(1)-VAF(end);end
    figure(1);subplot(2,1,1);plot(linspace(0,100,11),(VAF-VAF(1))./VAF_change_norm,'-','Color',clr(i,:),'linewidth',3);hold on 
end
ylim([min((VAF-VAF(1))./VAF_change_norm) max((VAF-VAF(1))./VAF_change_norm)])
ylabel('Volume above flotation change (normalized)','fontsize',20)

load(['VAF_MISMIP_125m_viscous_gld0_m60_MP2ter.mat'])
figure(1);subplot(2,1,1);plot(linspace(0,100,11),(VAF-VAF(1))./VAF_change_norm,'--','Color',clr(1,:),'linewidth',3);hold on 

load(['VAF_MISMIP_125m_viscous_gld0_m90_MP2ter.mat'])
figure(1);subplot(2,1,1);plot(linspace(0,100,11),(VAF-VAF(1))./VAF_change_norm,':','Color',clr(1,:),'linewidth',3);hold on 

fcyy = get(gcf, 'Children');                 % Gets handles for both Y-axes
fcyy.YAxis(2).Color = [0 0 0];

legend('L = 0 m, m=30 m/yr','L = 100 m, m=30 m/yr',...
    'L = 250 m, m=30 m/yr','L = 500 m, m=30 m/yr','L = 1000 m, m=30 m/yr',...
    'L = 2000 m, m=30 m/yr','L = 4000 m, m=30 m/yr',...
    'L = 0 m, m=60 m/yr','L = 0 m, m=90 m/yr','Location','SouthWest');

set(gca,'fontsize',20)
xlabel('Time (yrs)','fontsize',20)
set(1,'units','normalized','position',[0 0.1 0.4 0.8]);

%% Plot final transient experiment 2ter .mat VAF data

for i = 1:length(glds)
    load(['VAF_MISMIP_125m_viscous_gld' int2str(glds(i)) '_MP2ter.mat'])
    if(i==1);VAF_norm = VAF(1);end
    figure(1);subplot(2,1,2);plot(glds(i),(VAF(end)-VAF(1))./1e9,'.','Color',clr(i,:),'markersize',40);hold on 
end
% ylim([min(VAF./1e9) max(VAF./1e9)])
ylabel('Volume loss after 100 yrs (km^3)','fontsize',20)

load(['VAF_MISMIP_125m_viscous_gld0_m60_MP2ter.mat'])
figure(1);subplot(2,1,2);plot(0,(VAF(end)-VAF(1))./1e9,'s','Color',clr(1,:),'markersize',15,'linewidth',4);hold on 

load(['VAF_MISMIP_125m_viscous_gld0_m90_MP2ter.mat'])
figure(1);subplot(2,1,2);plot(0,(VAF(end)-VAF(1))./1e9,'*','Color',clr(1,:),'markersize',15,'linewidth',4);hold on 


set(gca,'fontsize',20)
xlabel('Intrusion distance (m)','fontsize',20)
set(1,'units','normalized','position',[0 0.1 0.3 0.7]);
