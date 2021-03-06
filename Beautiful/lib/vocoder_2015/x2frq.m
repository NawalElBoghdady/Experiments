function frq = x2frq(x)
% FRQ = MM2FRQ(MM)
% 	Applies Greenwood's function for mapping place to frequency.
%   
%   See Greenwood D.D. (1990) JASA 87, 6:2592?2605. doi:10.1121/1.399052.
%
%   See also FRQ2MM.

% Etienne Gaudrain <e.p.c.gaudrain@umcg.nl> - 2013-09-11
% University Medical Center Groningen, NL

% Copyright UMCG, Etienne Gaudrain, 2013
% This is code is distributed with no warranty under GNU General Public
% License v3.0. See http://www.gnu.org/licenses/gpl-3.0.txt for the full
% text.

%a= .06; % appropriate for measuring basilar membrane length in mm
a = 2.1; % appropriate for measuring the distance mm as a ratio of the total cochlear length.
A = 165.4;
k = 0.88;
c = 35; %35mm cochlear length
x = (c-x)./c;

frq = A * (10.^(a * x)- k);




