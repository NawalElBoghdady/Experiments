function [x, fs] = TENnoise(d, fs)

%[x, fs] = TENnoise(d, fs)
%   Generates a TEN noise (Moore et al., 2000) of duration d, at sampling
%   frequency fs. Intensity is set at 0 dB/ERBN. d is expressed in seconds.
%
%   Ref.:
%     Moore, Huss, Vickers, Glasberg, Alcantara, (2000)
%         "A test for the diagnosis of dead regions in the cochlea."
%         Br. J. Audiol. 34, 205-224.


n = 2*floor(d/2*fs);
x = rand(n, 1)*2-1;

X = fft(x);
f = (0:n-1)'/(n-1)*fs;
f = [f(1:n/2); f(n/2:-1:1)];

X = X ./ ERBNwidth(f).^.5 .* elc(f);
X(f<25) = 0;

semilogx(f(1:n/2), 20*log10(abs(X(1:n/2))))
xlim([50, 15000])

x = ifft(X, 'symmetric');

%==========================================================================

function w = ERBNwidth(f)

w = 21.4*log10(4.37e-3*f+1);

%==========================================================================

function T = elc(f)

f1 = [	20, 25, 30, 35, 40, 45, 50, 55, 60, 70, 80, 90, 100, ...
	125, 150, 177, 200, 250, 300, 350, 400, 450, 500, 550, ...
	600, 700, 800, 900, 1000, 1500, 2000, 2500, 2828, 3000, ...
	3500, 4000, 4500, 5000, 5500, 6000, 7000, 8000, 9000, 10000, ...
	12748, 15000];

ELC = [ 31.8, 26.0, 21.7, 18.8, 17.2, 15.4, 14.0, 12.6, 11.6, 10.6, ...
	9.2, 8.2, 7.7, 6.7, 5.3, 4.6, 3.9, 2.9, 2.7, 2.3, ...
	2.2, 2.3, 2.5, 2.7, 2.9, 3.4, 3.9, 3.9, 3.9, 2.7, ...
	0.9, -1.3, -2.5, -3.2, -4.4, -4.1, -2.5, -0.5, 2.0, 5.0, ...
	10.2, 15.0, 17.0, 15.5, 11.0, 22.0];

% MAF = [ 73.4, 65.2, 57.9, 52.7, 48.0, 45.0, 41.9, 39.3, 36.8, 33.0, ...
% 	29.7, 27.1, 25.0, 22.0, 18.2, 16.0, 14.0, 11.4, 9.2, 8.0, ...
% 	 6.9,  6.2,  5.7,  5.1,  5.0,  5.0,  4.4,  4.3, 3.9, 2.7, ...
% 	 0.9, -1.3, -2.5, -3.2, -4.4, -4.1, -2.5, -0.5, 2.0, 5.0, ...
% 	10.2, 15.0, 17.0, 15.5, 11.0, 22.0]; 

T = 10.^(-interp1(f1, ELC, f, 'spline', 0)/20);