// Rosyiidah Dhiya'Ulhaq
// 19/446468/TK/49573
///////////////////////////////////////////////////
// Fungsi kanal
function [H, channel_axis, H_freq]=wireless_channel(L, Fs)
channel_length=1:L;
channel_axis=(0:L/2)*(Fs/L);
total_path_loss=0.5;
loss_coeff=total_path_loss./(sum(exp(-channel_length/8)));
path_loss=loss_coeff*exp(-channel_length/8);
H=zeros(1,length(channel_length));
 for j=1:length(channel_length)
 H(j)=path_loss(j).*(rand(1,1));
 end
H=abs(H);
H_freq=abs(fft(H))/L;
H_freq=H_freq(1:(0.5*L)+1);
H_freq(2:(0.5*L)+1)=2*H_freq(2:(0.5*L)+1);
end
function y=diracdelta(a)
y=0;
if a==0
 then y=1
end
endfunction
[H,channel_axis,H_freq]=wireless_channel(L,Fs)
[xt,Fs]=wavread("C:\Users\dhiyr\OneDrive - UGM 365\Dokumen\KULIAH\Praktikum
ME\2\speech.wav");
xt=matrix(xt,-1,1);
L=length(xt);
t=(0:L-1)/Fs;
red=0.9;

s=-L/2:1:L/2;
for i=1:length(s)
 f(i)=diracdelta(s(i));
end
y=conv(xt,f*(1-red),'same');
// Transmitted Signal x(t)
scf(1)
subplot(2,1,1);
plot(t,xt);
title('Transmitted Signal (Time Domain)','fontname','times bold','color','blue','fontsize',3);
xlabel('Time (s)','fontname','times bold','fontsize',2);
ylabel('Amplitude','fontname','times bold','fontsize',2);
xtf=abs(fft(xt))./L;
xtf=xtf(1:(0.5*L)+1);
xtf(2:(0.5*L)+1)=2*xtf(2:(0.5*L)+1);
subplot(2,1,2);
plot(channel_axis,xtf,'g');
title('Transmitted Signal (Frequency Domain)','fontname','times bold','color','green','fontsize',3);
xlabel('Frequency (Hz)','fontname','times bold','fontsize',2);
ylabel('Magnitude','fontname','times bold','fontsize',2);
// Impulse Response h(t)
scf(2)
//Time Domain
subplot(2,1,1);
plot(t,H);
a=gca();
a.data_bounds = [0,0;0.002,0.05];
title('Channel Impulse Response (Time Domain)','fontname','times bold','color','blue','fontsize',3);
xlabel('Time (s)','fontname','times bold','fontsize',2);
ylabel('Amplitude','fontname','times bold','fontsize',2);
//Frequency Domain
subplot(2,1,2);
plot(channel_axis,H_freq,'g');
title('Channel Freq Response (Freqeuncy Domain)','fontname','times bold','color','green','fontsize',3);
xlabel('Frequency (Hz)','fontname','times bold','fontsize',2);
ylabel('Magnitude','fontname','times bold','fontsize',2);
// Received Signal y(t)
scf(3)
//Time Domain
subplot(2,1,1);
plot(t,yt);
title('Received Signal (Time Domain)','fontname','times bold','color','blue','fontsize',3);
xlabel('Time (s)','fontname','times bold','fontsize',2);
ylabel('Amplitude','fontname','times bold','fontsize',2);
//Frequency Domain
yt=conv(xt,H,'same');
ytf=abs(fft(yt))./L;
ytf=ytf(1:(0.5*L)+1);
ytf(2:(0.5*L)+1)=2*ytf(2:(0.5*L)+1);
subplot(2,1,2);
plot(channel_axis,ytf,'g');
title('Received Signal (Frequency Domain)','fontname','times bold','color','green','fontsize',3);
xlabel('Frequency (Hz)','fontname','times bold','fontsize',2);
ylabel('Magnitude','fontname','times bold','fontsize',2);

