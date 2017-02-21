%
yig20 = HighPowerPerms2('coax75','YIG',0.0058,'75mm_coax_air_20dbm_1-25-17.dat','75mm_coax_10%YIG_5p8mm_20dbm_1-25-17.dat','75mm_coax_flipped_10%YIG_5p8mm_20dbm_1-25-17.dat',' ');
yig25 = HighPowerPerms2('coax75','YIG',0.0058,'75mm_coax_air_25dbm_1-25-17.dat','75mm_coax_10%YIG_5p8mm_25dbm_1-25-17.dat','75mm_coax_flipped_10%YIG_5p8mm_20dbm_1-25-17.dat',' ');
yig30 = HighPowerPerms2('coax75','YIG',0.0058,'75mm_coax_air_30dbm_1-25-17.dat','75mm_coax_10%YIG_5p8mm_30dbm_1-25-17.dat','75mm_coax_flipped_10%YIG_5p8mm_20dbm_1-25-17.dat',' ');
yig35 = HighPowerPerms2('coax75','YIG',0.0058,'75mm_coax_air_35dbm_1-25-17.dat','75mm_coax_10%YIG_5p8mm_35dbm_1-25-17.dat','75mm_coax_flipped_10%YIG_5p8mm_20dbm_1-25-17.dat',' ');
yig40 = HighPowerPerms2('coax75','YIG',0.0058,'75mm_coax_air_40dbm_1-25-17.dat','75mm_coax_10%YIG_5p8mm_40dbm_1-25-17.dat','75mm_coax_flipped_10%YIG_5p8mm_20dbm_1-25-17.dat',' ');
yig45 = HighPowerPerms2('coax75','YIG',0.0058,'75mm_coax_air_45dbm_1-25-17.dat','75mm_coax_10%YIG_5p8mm_45dbm_1-25-17.dat','75mm_coax_flipped_10%YIG_5p8mm_20dbm_1-25-17.dat',' ');
yig50 = HighPowerPerms2('coax75','YIG',0.0058,'75mm_coax_air_50dbm_1-25-17.dat','75mm_coax_10%YIG_5p8mm_50dbm_1-25-17.dat','75mm_coax_flipped_10%YIG_5p8mm_20dbm_1-25-17.dat',' ');
%}
%%
%{
dd20 = HighPowerPerms2('coax75','DD-13490',0.0015,'75mm_coax_air_20dbm_1-25-17.dat','75mm_coax_dd13490_1p5mm_20dbm_1-25-17_hf.dat','75mm_coax_y5v_5p67mm_20dbm_180_1-25-17_hf.dat',' ');
dd25 = HighPowerPerms2('coax75','DD-13490',0.0015,'75mm_coax_air_25dbm_1-25-17.dat','75mm_coax_dd13490_1p5mm_25dbm_1-25-17_hf.dat','75mm_coax_y5v_5p67mm_25dbm_180_1-25-17_hf.dat',' ');
dd30 = HighPowerPerms2('coax75','DD-13490',0.0015,'75mm_coax_air_30dbm_1-25-17.dat','75mm_coax_dd13490_1p5mm_30dbm_1-25-17_hf.dat','75mm_coax_y5v_5p67mm_30dbm_180_1-25-17_hf.dat',' ');
dd35 = HighPowerPerms2('coax75','DD-13490',0.0015,'75mm_coax_air_35dbm_1-25-17.dat','75mm_coax_dd13490_1p5mm_35dbm_1-25-17_hf.dat','75mm_coax_y5v_5p67mm_35dbm_180_1-25-17_hf.dat',' ');
dd40 = HighPowerPerms2('coax75','DD-13490',0.0015,'75mm_coax_air_40dbm_1-25-17.dat','75mm_coax_dd13490_1p5mm_40dbm_1-25-17_hf.dat','75mm_coax_y5v_5p67mm_40dbm_180_1-25-17_hf.dat',' ');
dd45 = HighPowerPerms2('coax75','DD-13490',0.0015,'75mm_coax_air_45dbm_1-25-17.dat','75mm_coax_dd13490_1p5mm_45dbm_1-25-17_hf.dat','75mm_coax_y5v_5p67mm_45dbm_180_1-25-17_hf.dat',' ');
dd50 = HighPowerPerms2('coax75','DD-13490',0.0015,'75mm_coax_air_50dbm_1-25-17.dat','75mm_coax_dd13490_1p5mm_49dbm_1-25-17_hf.dat','75mm_coax_y5v_5p67mm_49dbm_180_1-25-17_hf.dat',' ');
%}
%%
figure;
plot(yig20.frequency/1e9,real(yig20.epsilon),...
    yig20.frequency/1e9,real(yig25.epsilon),...
    yig20.frequency/1e9,real(yig30.epsilon),...
    yig20.frequency/1e9,real(yig35.epsilon),...
    yig20.frequency/1e9,real(yig40.epsilon),...
    yig20.frequency/1e9,real(yig45.epsilon),...
    yig20.frequency/1e9,real(yig50.epsilon))
xlabel('frequency (GHz)')
ylabel('relative permittivity')
legend('20dBm','25dBm','30dBm','35dBm','40dBm','45dBm','50dBm','Location','best')
legend('boxoff')
title('Measured real \epsilon at different power levels for a 5.8mm YIG sample')
xlim([min(yig20.frequency/1e9) max(yig20.frequency/1e9)])
set(gca,'FontSize',12)
grid on
%%
figure;
plot(yig20.frequency/1e9,real(yig20.mu),...
    yig20.frequency/1e9,real(yig25.mu),...
    yig20.frequency/1e9,real(yig30.mu),...
    yig20.frequency/1e9,real(yig35.mu),...
    yig20.frequency/1e9,real(yig40.mu),...
    yig20.frequency/1e9,real(yig45.mu),...
    yig20.frequency/1e9,real(yig50.mu))
xlabel('frequency (GHz)')
ylabel('relative permittivity')
legend('20dBm','25dBm','30dBm','35dBm','40dBm','45dBm','50dBm','Location','best')
legend('boxoff')
title('Measured real \mu at different power levels for a 5.8mm YIG sample')
xlim([min(yig20.frequency/1e9) max(yig20.frequency/1e9)])
set(gca,'FontSize',12)
grid on
%%
figure;
plot(yig20.frequency/1e9,imag(yig20.epsilon),...
    yig20.frequency/1e9,imag(yig25.epsilon),...
    yig20.frequency/1e9,imag(yig30.epsilon),...
    yig20.frequency/1e9,imag(yig35.epsilon),...
    yig20.frequency/1e9,imag(yig40.epsilon),...
    yig20.frequency/1e9,imag(yig45.epsilon),...
    yig20.frequency/1e9,imag(yig50.epsilon))
xlabel('frequency (GHz)')
ylabel('relative permittivity')
legend('20dBm','25dBm','30dBm','35dBm','40dBm','45dBm','50dBm','Location','best')
legend('boxoff')
title('Power dependence of \epsilon\prime\prime for a 5.8mm YIG sample')
xlim([min(yig20.frequency/1e9) max(yig20.frequency/1e9)])
set(gca,'FontSize',12)
grid on
%%
figure;
plot(yig20.frequency/1e9,real(yig20.epsilon),...
    yig20.frequency/1e9,real(yig25.epsilon),...
    yig20.frequency/1e9,real(yig30.epsilon),...
    yig20.frequency/1e9,real(yig35.epsilon),...
    yig20.frequency/1e9,real(yig40.epsilon),...
    yig20.frequency/1e9,real(yig45.epsilon),...
    yig20.frequency/1e9,real(yig50.epsilon))
plot(yig20.frequency/1e9,imag(yig20.epsilon),...
    yig20.frequency/1e9,imag(yig25.epsilon),...
    yig20.frequency/1e9,imag(yig30.epsilon),...
    yig20.frequency/1e9,imag(yig35.epsilon),...
    yig20.frequency/1e9,imag(yig40.epsilon),...
    yig20.frequency/1e9,imag(yig45.epsilon),...
    yig20.frequency/1e9,imag(yig50.epsilon))
xlabel('frequency (GHz)')
ylabel('relative permittivity')
legend('20dBm','25dBm','30dBm','35dBm','40dBm','45dBm','50dBm','Location','east')
legend('boxoff')
title('Measured \epsilon at different power levels for a 5.8mm YIG sample')
xlim([min(yig20.frequency/1e9) max(yig20.frequency/1e9)])
set(gca,'FontSize',12)
grid on
figure;
plot(yig20.frequency/1e9,real(yig20.mu),...
    yig20.frequency/1e9,real(yig25.mu),...
    yig20.frequency/1e9,real(yig30.mu),...
    yig20.frequency/1e9,real(yig35.mu),...
    yig20.frequency/1e9,real(yig40.mu),...
    yig20.frequency/1e9,real(yig45.mu),...
    yig20.frequency/1e9,real(yig50.mu))
plot(yig20.frequency/1e9,imag(yig20.mu),...
    yig20.frequency/1e9,imag(yig25.mu),...
    yig20.frequency/1e9,imag(yig30.mu),...
    yig20.frequency/1e9,imag(yig35.mu),...
    yig20.frequency/1e9,imag(yig40.mu),...
    yig20.frequency/1e9,imag(yig45.mu),...
    yig20.frequency/1e9,imag(yig50.mu))
xlabel('frequency (GHz)')
ylabel('relative permeability')
legend('20dBm','25dBm','30dBm','35dBm','40dBm','45dBm','50dBm','Location','east')
legend('boxoff')
title('Measured \mu at different power levels for a 5.8mm YIG sample')
xlim([min(yig20.frequency/1e9) max(yig20.frequency/1e9)])
set(gca,'FontSize',12)
grid on
%%
figure;
plot(yig20.frequency/1e9,(real(yig25.epsilon)- real(yig20.epsilon))./real(yig20.epsilon)*100,...
    yig20.frequency/1e9,(real(yig30.epsilon)- real(yig20.epsilon))./real(yig20.epsilon)*100,...
    yig20.frequency/1e9,(real(yig35.epsilon)- real(yig20.epsilon))./real(yig20.epsilon)*100,...
    yig20.frequency/1e9,(real(yig40.epsilon)- real(yig20.epsilon))./real(yig20.epsilon)*100,...
    yig20.frequency/1e9,(real(yig45.epsilon)- real(yig20.epsilon))./real(yig20.epsilon)*100,...
    yig20.frequency/1e9,(real(yig50.epsilon)- real(yig20.epsilon))./real(yig20.epsilon)*100)
xlabel('frequency (GHz)')
ylabel('percent change from 20dBm')
legend('25dBm','30dBm','35dBm','40dBm','45dBm','50dBm','Location','best')
legend('boxoff')
title('Percent change \epsilon\prime for a 5.8mm YIG sample')
xlim([min(yig20.frequency/1e9) max(yig20.frequency/1e9)])
set(gca,'FontSize',12)
grid on
%ylim([0 4])
figure;
plot(yig20.frequency/1e9,(imag(yig25.epsilon)- imag(yig20.epsilon))./imag(yig20.epsilon)*100,...
    yig20.frequency/1e9,(imag(yig30.epsilon)- imag(yig20.epsilon))./imag(yig20.epsilon)*100,...
    yig20.frequency/1e9,(imag(yig35.epsilon)- imag(yig20.epsilon))./imag(yig20.epsilon)*100,...
    yig20.frequency/1e9,(imag(yig40.epsilon)- imag(yig20.epsilon))./imag(yig20.epsilon)*100,...
    yig20.frequency/1e9,(imag(yig45.epsilon)- imag(yig20.epsilon))./imag(yig20.epsilon)*100,...
    yig20.frequency/1e9,(imag(yig50.epsilon)- imag(yig20.epsilon))./imag(yig20.epsilon)*100)
xlabel('frequency (GHz)')
ylabel('percent change from 20dBm')
legend('25dBm','30dBm','35dBm','40dBm','45dBm','50dBm','Location','best')
legend('boxoff')
title('Percent change \epsilon\prime\prime for a 5.8mm YIG sample')
xlim([min(yig20.frequency/1e9) max(yig20.frequency/1e9)])
set(gca,'FontSize',12)
grid on
%%
figure;
plot(yig20.frequency/1e9,(real(yig25.mu)- real(yig20.mu))./real(yig20.mu)*100,...
    yig20.frequency/1e9,(real(yig30.mu)- real(yig20.mu))./real(yig20.mu)*100,...
    yig20.frequency/1e9,(real(yig35.mu)- real(yig20.mu))./real(yig20.mu)*100,...
    yig20.frequency/1e9,(real(yig40.mu)- real(yig20.mu))./real(yig20.mu)*100,...
    yig20.frequency/1e9,(real(yig45.mu)- real(yig20.mu))./real(yig20.mu)*100,...
    yig20.frequency/1e9,(real(yig50.mu)- real(yig20.mu))./real(yig20.mu)*100)
xlabel('frequency (GHz)')
ylabel('percent change from 20dBm')
legend('25dBm','30dBm','35dBm','40dBm','45dBm','50dBm','Location','best')
legend('boxoff')
title('Percent change \mu\prime for a 5.8mm YIG sample')
xlim([min(yig20.frequency/1e9) max(yig20.frequency/1e9)])
set(gca,'FontSize',12)
grid on
%ylim([0 4])
figure;
plot(yig20.frequency/1e9,(imag(yig25.mu)- imag(yig20.mu))./imag(yig20.mu)*100,...
    yig20.frequency/1e9,(imag(yig30.mu)- imag(yig20.mu))./imag(yig20.mu)*100,...
    yig20.frequency/1e9,(imag(yig35.mu)- imag(yig20.mu))./imag(yig20.mu)*100,...
    yig20.frequency/1e9,(imag(yig40.mu)- imag(yig20.mu))./imag(yig20.mu)*100,...
    yig20.frequency/1e9,(imag(yig45.mu)- imag(yig20.mu))./imag(yig20.mu)*100,...
    yig20.frequency/1e9,(imag(yig50.mu)- imag(yig20.mu))./imag(yig20.mu)*100)
xlabel('frequency (GHz)')
ylabel('percent change from 20dBm')
legend('25dBm','30dBm','35dBm','40dBm','45dBm','50dBm','Location','best')
legend('boxoff')
title('Percent change \mu\prime\prime for a 5.8mm YIG sample')
xlim([min(yig20.frequency/1e9) max(yig20.frequency/1e9)])
set(gca,'FontSize',12)
grid on