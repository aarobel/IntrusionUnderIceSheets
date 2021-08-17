H = 10;
bx = -3e-2; %negative is retrograde
Qf = -300e3*.001/(3600*24*365);
K = 1e-3;
alpha = 40;

Lmin = -K*(H^2)/(2*alpha*Qf);
Lslope = (H + (alpha*Qf/(K*tan(bx)))*log(1+(K*H*tan(bx)/(-alpha*Qf))))/tan(bx);

[Lmin,Lslope]