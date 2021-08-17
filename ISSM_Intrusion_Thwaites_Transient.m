clear all;close all;

glds = [0 100 250 500 1000 2000 4000];
clr = winter(length(glds));
% clr=brewermap(length(glds),'PiYG');
clr(1,:) = [0 0 0];

%% Load and plot transient experiment 2ter .mat VAF data

for i = 1:length(glds)
    loadmodel(['Thwaites.gld' int2str(glds(i)) '.Transient_SSA_long.mat'])
    VAF = [];
    for j=1:501
        VAF=[VAF md.results.TransientSolution(j).IceVolumeAboveFloatation];
    end   
    figure(1);plot(linspace(0,500,501),VAF./1e9,'-','Color',clr(i,:),'linewidth',3);hold on 
end
ylim([min(VAF./1e9) max(VAF./1e9)])
ylabel('Volume above flotation (km^3)','fontsize',20)



loadmodel(['Thwaites.gld0.mmax90.Transient_SSA_long.mat'])
    VAF = [];
    for j=1:501
        VAF=[VAF md.results.TransientSolution(j).IceVolumeAboveFloatation];
    end   
figure(1);plot(linspace(0,500,501),VAF./1e9,'--','Color',clr(1,:),'linewidth',3);hold on 


legend('L = 0 m, m_{max}=60 m/yr','L = 100 m, m_{max}=60 m/yr','L = 250 m, m_{max}=60 m/yr','L = 500 m, m_{max}=60 m/yr','L = 1000 m, m_{max}=60 m/yr','L = 2000 m, m_{max}=60 m/yr','L = 4000 m, m_{max}=60 m/yr','L = 0 m, m_{max}=90 m/yr');
set(gca,'fontsize',16)
xlabel('Time (yrs)','fontsize',20)
set(1,'units','normalized','position',[0 0.1 0.3 0.4]);