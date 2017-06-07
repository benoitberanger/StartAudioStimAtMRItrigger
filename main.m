function main
% This is the main function.
% The user select a .wav file, then the function waits for the MRI trigger
% to playback.


%% Recall button box configuration

fprintf('\n')
fprintf('Response buttuns (fORRP 932) : \n')
fprintf('Line 1 : USB \n')
fprintf('Line 2 : whatever for the second line \n')
fprintf('Line 3 : HID NAR BYGRT \n')
fprintf('\n')


%% Select a file

fprintf('File selection...')
[filename, pathname] = uigetfile('*.wav', 'Select a .wav audio file');
if isequal(filename,0)
    error('User selected Cancel')
else
    fprintf('User selected %s \n\n', fullfile(pathname, filename))
end


%% Prepare audio playback in psychtoolbox

SamplingRate            = 44100; % Hz

Playback.Mode           = 1; % 1 = playback, 2 = record
Playback.LowLatencyMode = 1; % {0,1,2,3,4}
Playback.freq           = SamplingRate ;
Playback.Channels       = 2; % 1 = mono, 2 = stereo

% Perform basic initialization of the sound driver:
InitializePsychSound(1);

% Close the audio device (if previously opened)
PsychPortAudio('Close')

% Playback device initialization
Playback.pahandle = PsychPortAudio('Open', [],...
    Playback.Mode,...
    Playback.LowLatencyMode,...
    Playback.freq,...
    Playback.Channels);


%% Use objects to manipulate the audio file

WaveObject = Wav( [pathname filename] );      % Initilize the object by loading a .wav file
WaveObject.Resample(SamplingRate)             % resample if needed
WaveObject.LinkToPAhandle(Playback.pahandle); % do something for psychtoolbox
WaveObject.AssertReadyForPlayback;            % just to check


%% Wait for MRI trigger to playback

% Load Psychtoolbox default key map
KbName('UnifyKeyNames');

% Keys for this script
MRItrigger = KbName('t'     );
escape     = KbName('escape');

fprintf('\n Waiting for MRI trigger... \n')

while 1
    
    [keyIsDown, ~, keyCode] = KbCheck;
    
    if  keyIsDown
        
        if keyCode(MRItrigger)
            WaveObject.Playback;
            fprintf('... MRI trigger received. \n')
            break
            
        elseif keyCode(escape)
            fprintf('!!! ESCAPE !!! \n')
            PsychPortAudio('Close')
            break
            
        end
        
    end
    
end


end % function
