function [ startTime ] = Playback( obj, when )

if nargin < 2
   when = 0; 
end

PsychPortAudio('FillBuffer', obj.pahandle, obj.signal );

repetitions  = 1; % play 1 time the sound
waitForStart = 1; % wait for the first sample to go out of the buffer, necessary to have a startTime

startTime = PsychPortAudio('Start', obj.pahandle , repetitions , when , waitForStart );

end
