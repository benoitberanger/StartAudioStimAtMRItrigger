classdef AudioPTB < handle
    %AUDIOPTB Abstract class for audio stuff used PTB
    
    %% Properties
    
    properties
        
        % Parameters
        fs       = zeros(0)   % Sampling frequency (Hertz)
        
        % Internal variables
        signal   = zeros(1,0) % signal ready to be played
        duration = zeros(0)   % duration of the signal (Seconds)
        time     = zeros(1,0) % used to generate the vectors and for plot
        
        % Link with PTB
        pahandle = zeros(0)   % PsychPortAudio handle == pointer
        
    end % properties
    
    
    %% Methods
    
    methods
        
        % -----------------------------------------------------------------
        %                           Constructor
        % -----------------------------------------------------------------
        
        % No constructor here, because it is an abstract class
        
    end % methods
    
    
end % class
