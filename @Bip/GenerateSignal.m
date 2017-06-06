function GenerateSignal( obj )

obj.time = (0:1:(obj.duration*obj.fs))/obj.fs;

obj.phase = 0; % radian

obj.window = tukeywin(length(obj.time),obj.ratio)';
% window = hann(length(time));
% window = hamming(length(time));
% window = ones(length(time),1);

obj.sinusoid = sin( 2*pi*obj.f0*obj.time + obj.phase );

obj.signal = obj.sinusoid.*obj.window;
obj.signal = [ obj.signal ; obj.signal ]; % stereo

end
