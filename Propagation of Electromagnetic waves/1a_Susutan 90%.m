// Rosyiidah Dhiya'Ulhaq
// 19/446468/TK/49573
///////////////////////////////////////////////////
function y=diracdelta(d)
y=0;
if d==0 then
 y=1
end
endfunction
[xt,Fs]=wavread("C:\Users\dhiyr\OneDrive - UGM 365\Dokumen\KULIAH\Praktikum 
ME\2\speech.wav");
xt=matrix(xt,-1,1);
L=length(xt);
channel_axis=(0:L/2)*(Fs/L);
t=(0:L-1)/Fs;
red=0.9; // susutan 0,9
s=-L/2:1:L/2;
for i=1:length(s)
 f(i)=diracdelta(s(i));
end
yt=conv(xt,f*(1-red),'same');
h1=0.1*delta;
// Transmitted Signal x(t)
scf(1)
// Time domain
subplot(2,1,1);
plot(t,xt,'m');
title('Transmitted Signal (Time Domain)','fontname','times bold','color','red','fontsize',3);
xlabel('Time(s)','fontname','times bold','fontsize',2);
ylabel('Amplitude','fontname','times bold','fontsize',2)
//Frequency domain
xtf=abs(fft(xt))./L;
xtf=xtf(1:(0.5*L)+1);
xtf(2:(0.5*L)+1)=2*xtf(2:(0.5*L)+1);
axis=(0:L/2)*(Fs/L);
subplot(2,1,2);
plot(axis,xtf);
title('Transmitted Signal (Frequency Domain)','fontname','times bold','color','blue','fontsize',3);
xlabel('Frequency (Hz)','fontname','times bold','fontsize',2);
ylabel('Magnitude','fontname','times bold','fontsize',2);
// Impulse Response h(t)
scf(2)
plot(t,h1,'m');
title('Impulse Response (Time Domain)','fontname','times bold','color','red','fontsize',3);
xlabel('Time(s)','fontname','times bold','fontsize',2);
ylabel('Amplitude','fontname','times bold','fontsize',2)
// Received Signal y(t)
y=conv(xt,h1,"same");
wavwrite(y,'y');
scf(3)
// Time domain
subplot(2,1,1);
plot(t,y,'m');
title('Received Signal (Time Domain)','fontname','times bold','color','red','fontsize',3);
xlabel('Time(s)','fontname','times bold','fontsize',2);
ylabel('Amplitude','fontname','times bold','fontsize',2);

// Frequency domain
yf=abs(fft(y))./L;
yf=yf(1:(0.5*L)+1);
yf(2:(0.5*L)+1)=2*yf(2:(0.5*L)+1);
subplot(2,1,2);
plot(axis,yf);
title('Received Signal (Frequency Domain)','fontname','times bold','color','red','fontsize',3);
xlabel('Frequency (Hz)','fontname','times bold','fontsize',2);
ylabel('Magnitude','fontname','times bold','fontsize',2);

