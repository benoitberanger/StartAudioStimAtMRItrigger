function Resample( obj, newFS )

signal(1,:)  = resample( obj.signal(1,:), newFS, obj.fs);
signal(2,:)  = resample( obj.signal(2,:), newFS, obj.fs);
obj.signal   = signal;
obj.fs       = newFS;
obj.time     = (0:1:length(obj.signal(1,:))-1)/obj.fs;
obj.duration = length(obj.signal)/obj.fs;

end
