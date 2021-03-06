% code based on Walter Barry paper for stripline, is effective for coax
% airlines as well.
eps0=8.85418782e-12; % F/m
mu0=1.2566370614e-6; % H/m
c0=1/sqrt(eps0*mu0);
eta0=sqrt(mu0/eps0); % free space
material_width = 1.78e-3;
device_length = 50e-3;
%epsT = 17 - 0.1*1i;
%muT = 6 - 6i*3;
l = (device_length + 67.75e-3 - material_width)/2;
t = material_width;
%%
airFile = 'coax_50mm_air_9-15.s2p';
filelength = 203;
fftlength = 801;
%[a11,a21,a12,a22,frequency] = s2pToComplexSParam(airFile,filelength);
%a11 = (a11 + a22)/2;
%a21 = (a21 + a12)/2;
materialFile = 'coax_50mm_dd13490_1p78mm_9-20_RS.dat';
[s11,s21,s12,s22,m_frequency] = s2pToComplexSParam_v2(materialFile,filelength);
fudgeFactor = (unwrap(angle(s11)) - unwrap(angle(s22)))/2;
s11 = s11.*exp(-1i*fudgeFactor);
s22 = s22.*exp(1i*fudgeFactor);
s21 = (s21 + s12)/2;
%%
%Theoretical values
%case frequency dependent
%
load(sprintf('%s\\Materials\\dd13490_data.mat',pwd))
permittivity = real_mittiv - 1i*imag_mittiv;
permeability = real_meab - 1i*imag_meab;
t_frequency = frequency*1e9;
[t11,t21] = generateSParamters2(permittivity,permeability,device_length,material_width,frequency*1e9);
%}
%case static
%{
theoryKt = k0*sqrt(epsT*muT)*t;
[theory11,theory12,theory21,theory22] = generateSParamters(epsT,muT,t,m_frequency);
t11 = theory11.*exp(-1i*2*k0*l);
t21 = theory21.*exp(-1i*2*k0*l);
%}
%%
k0 = 2*pi*m_frequency/c0;
beta=2*pi*m_frequency/c0;
%{
time_air21=ifft(a21,8000);
time_med21=ifft(s21,8000);
[~,c1]=max(abs(time_air21));
time(:,1)=1:1:length(time_air21);
win_length = 25000;
t_win21=exp(-(time-c1).^2/win_length);
time_s21_filter=t_win21.*time_med21;
time_a21_filter= t_win21.*time_air21;
temp_s21=fft(time_s21_filter);
temp_a21=fft(time_a21_filter);
filtered_s21=temp_s21(1:fftlength);
filtered_a21=temp_a21(1:fftlength);
%}
%%
%{
time_air11=ifft(a11,8000);
time_med11=ifft(s11,8000);
[tt,c2]=max(abs(time_med11));
t_win11=exp(-(time-c2).^2/(win_length*2));
time_s11_filter=t_win11.*time_med11;
time_a11_filter=t_win11.*time_air11;
temp_s11=fft(time_s21_filter);
temp_a11=fft(time_a11_filter);
filtered_s11=temp_s11(1:fftlength);
filtered_a11=temp_a11(1:fftlength);
%}
%{
figure(5)
plot(t_win11*tt,'g--','linewidth',2)
legend('window')
hold on
plot(time,abs(time_air11),time,abs(time_med11))
legend('window','air','material')
xlim([(c1 - 1000) (c1 + 1000)])
title('S11 Time gating based on MUT')
xlabel('Time Position')
%}
%%
arg = (exp(-1i*4*k0*l) + s21.^2 - s11.^2)./(2*exp(-1i*2*k0*l).*s21);
kt = acos(arg);
tk0 = 2*pi*t_frequency*1e9/c0;
tArg = (exp(-1i*4*tk0*l) + t21.^2 - t11.^2)./(2*exp(-1i*2*tk0*l).*t21);
tTheta = atan2(imag(tArg + sqrt(tArg.^2 - 1)),real(tArg + sqrt(tArg.^2 - 1)));
tG = abs(tArg + sqrt(tArg.^2 - 1));
tKt = acos(tArg);

figure;
subplot(221)
%yyaxis left
plot(m_frequency/1e9,unwrap(angle(s11)),frequency, unwrap(angle(t11)))
ylabel('Phase')
yyaxis right
plot(m_frequency(2:end)/1e9,diff(unwrap(angle(s11))),frequency(2:end), diff(unwrap(angle(t11))))
%ylim([-2 2])
xlabel('Frequency')
%ylabel('Offset \pi')
%legend('measured', 'theory','Location','northeast','Orientation','horizontal')
title('S11 Phase')
%xlim([1 10])
grid on
subplot(222)
yyaxis left
plot(m_frequency/1e9,unwrap(angle(s21)),frequency, unwrap(angle(t21)))
ylabel('Phase')
yyaxis right
plot(m_frequency(2:end)/1e9,diff(unwrap(angle(s21))),frequency(2:end), diff(unwrap(angle(t21))))
%ylim([-2 2])
xlabel('Frequency')
%ylabel('Offset \pi')
xlabel('Frequency')
legend('measured', 'theory','Location','northeast','Orientation','horizontal')
title('S21 Phase')
%xlim([1 10])
grid on
subplot(223)
plot(m_frequency/1e9,abs(s11),frequency, abs(t11))
xlabel('Frequency')
ylabel('Magnitude')
legend('measured', 'theory','Location','northeast','Orientation','horizontal')
title('S11 Magnitude')
%xlim([1 10])
grid on
subplot(224)
plot(m_frequency/1e9,abs(s21),frequency, abs(t21))
xlabel('Frequency')
ylabel('Magnitude')
legend('measured', 'theory','Location','northeast','Orientation','horizontal')
title('S21 Magnitude')
%xlim([1 10])
grid on
%}

%%
%{
figure;
subplot(221)
yyaxis left
plot(frequency/1e9, abs(theoryKt), frequency/1e9, abs(kt), frequency/1e9, abs(tKt))
ylabel('Magnitude')
yyaxis right
plot(frequency/1e9, angle(theoryKt), frequency/1e9, angle(kt), frequency/1e9, angle(tKt))
xlabel('frequency (GHz)')
ylabel('Phase')
legend('theory','experiment','theory derived')
title('Propagation Constant X material thickness (kt)')
grid on
subplot(222)
plot(frequency/1e9, abs(expanded_R), frequency/1e9, abs(expanded_Rt))
%ylim([0 10])
xlabel('frequency (GHz)')
ylabel('Magnitude')
legend('experiment','theory derived')
title('Reflection Coefficient')
%ylim([0 5])
grid on
subplot(223)
plot(frequency/1e9, real(expanded_epsilon), frequency/1e9, imag(expanded_epsilon)...
    , frequency/1e9, real(expanded_epsilont), frequency/1e9, imag(expanded_epsilont))
xlabel('frequency (GHz)')
ylabel('Magnitude')
legend('\epsilon\prime', '\epsilon\prime\prime','theory \epsilon\prime',...
    'theory \epsilon\prime\prime')
title('Permittivity')
%ylim([-5 5])
grid on
subplot(224)
plot(frequency/1e9, real(expanded_mu), frequency/1e9, imag(expanded_mu),...
    frequency/1e9, real(expanded_mut), frequency/1e9, imag(expanded_mut))
xlabel('frequency (GHz)')
ylabel('Magnitude')
%ylim([-5 5])
legend('\mu\prime', '\mu\prime\prime','theory \mu\prime', 'theory \mu\prime\prime')
title('Permeability')
grid on
%}
%{
figure;
subplot(211)
plot(m_frequency/1e9, real(expanded_epsilon), m_frequency/1e9, imag(expanded_epsilon))
xlabel('frequency (GHz)')
ylabel('Magnitude')
legend('\epsilon\prime', '\epsilon\prime\prime')
title('Permittivity')
%ylim([-5 5])
%xlim([1 20])
grid on
subplot(212)
plot(m_frequency/1e9, real(expanded_mu), m_frequency/1e9, imag(expanded_mu))
xlabel('frequency (GHz)')
ylabel('Magnitude')
%ylim([-5 5])
%xlim([1 20])
legend('\mu\prime', '\mu\prime\prime')
title('Permeability')
grid on
%}
figure;
subplot(221)
yyaxis left
plot(t_frequency/1e9, abs(theoryKt), m_frequency/1e9, abs(kt), t_frequency/1e9, abs(tKt))
ylabel('Magnitude')
yyaxis right
plot(t_frequency/1e9, angle(theoryKt), m_frequency/1e9, angle(kt), t_frequency/1e9, angle(tKt))
xlabel('frequency (GHz)')
ylabel('Phase')
legend('theory','experiment','theory derived')
title('Propagation Constant X material thickness (kt)')
grid on
subplot(222)
plot(m_frequency/1e9, abs(expanded_R), t_frequency/1e9, abs(expanded_Rt))
%ylim([0 10])
xlabel('frequency (GHz)')
ylabel('Magnitude')
legend('experiment','theory derived')
title('Reflection Coefficient')
%ylim([0 5])
grid on
subplot(223)
plot(m_frequency/1e9, real(expanded_epsilon), m_frequency/1e9, imag(expanded_epsilon)...
    , t_frequency/1e9, real(expanded_epsilont), t_frequency/1e9, imag(expanded_epsilont))
xlabel('frequency (GHz)')
ylabel('Magnitude')
legend('\epsilon\prime', '\epsilon\prime\prime','theory \epsilon\prime',...
    'theory \epsilon\prime\prime')
title('Permittivity')
ylim([-5 5])
grid on
subplot(224)
plot(m_frequency/1e9, real(expanded_mu), m_frequency/1e9, imag(expanded_mu),...
    t_frequency/1e9, real(expanded_mut), t_frequency/1e9, imag(expanded_mut))
xlabel('frequency (GHz)')
ylabel('Magnitude')
ylim([-5 5])
legend('\mu\prime', '\mu\prime\prime','theory \mu\prime', 'theory \mu\prime\prime')
title('Permeability')
grid on