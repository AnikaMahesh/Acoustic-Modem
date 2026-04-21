
load short_modem_rx.mat

% The received signal includes a bunch of samples from before the
% transmission started so we need discard these samples that occurred before
% the transmission started. 

start_idx = find_start_of_signal(y_r,x_sync);
% start_idx now contains the location in y_r where x_sync begins
% we need to offset by the length of x_sync to only include the signal
% we are interested in
y_t = y_r(start_idx+length(x_sync):end); % y_t is the signal which starts at the beginning of the transmission


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Put your decoder code here
len = length(y_t);
t = (1:1:len)/Fs;
wave = cos((2*pi*f_c)/Fs.*t);
hold on
plot(t, wave)

x_d = y_t;
x_d = conv(wave,x_d);
x_d = lowpass(x_d, 100, Fs, steepness=0.99);
plot(t, y_t(1:len), "DisplayName","y_t")
hold on
plot(t, x_d(1:len), "DisplayName","x_d")

legend()
%%
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% convert to a string assuming that x_d is a vector of 1s and 0s
% representing the decoded bits.
%BitsToString(x_d)

