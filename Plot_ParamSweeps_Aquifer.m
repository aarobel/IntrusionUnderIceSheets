theta = linspace(-0.1,0.1,1e3);

alphau_over_k_0 = 0.1;

LSOH = nan.*ones(1e2,1e3);

mults  = linspace(1e-2,2,1001);
for i=1:length(mults)
    mult=mults(i);
    
    alphau_over_k = alphau_over_k_0*mult;
    Ls_over_H = -(1./tan(theta)).*(1 + (alphau_over_k./tan(theta)).*log(1 - (tan(theta)/alphau_over_k)));
    
    Ls_over_H(theta>=alphau_over_k) = 10000;
    Ls_over_H(imag(Ls_over_H)~=0) = 10000;
    
    LSOH(i,:) = Ls_over_H;
    
end

[MULT,THETA] = meshgrid(mults,theta);

figure(1);
pcolor(MULT'.*alphau_over_k_0,THETA',LSOH);cb=colorbar;caxis([10 1e4]);shading('flat')
xlabel('\alpha U_{in} / K','fontsize',16)
ylabel('\theta','fontsize',16)
set(gca,'ColorScale','log','fontsize',20)
colormap(brewermap([],'GnBu'));
ylabel(cb,'L (m)')