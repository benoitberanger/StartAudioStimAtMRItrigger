function LoadWavFile( obj )

[signal obj.fs] = psychwavread(obj.filename);
obj.signal      = [signal';signal'];
obj.time        = (0:1:length(obj.signal(1,:))-1)/obj.fs;
obj.duration    = length(obj.signal)/obj.fs;

end
