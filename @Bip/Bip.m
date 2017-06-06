classdef Bip < AudioPTB
    %BIP Generate a bip signal and get it ready for playback via PTB
    
    %% Properties
    
    properties
        
        % Parameters
        f0       = zeros(0)   % Base frequency of the sound (Hertz)
        ratio    = zeros(0)   % ratio between the 1 part and the 0 part of the tukey window
        
        % Internal variables
        sinusoid = zeros(1,0) % raw sinusoid : f0 sampled by fs
        window   = zeros(1,0) % tukey window
        phase    = zeros(0)   % phase of the sinusoid
        
    end % properties
    
    
    %% Methods
    
    methods
        
        % -----------------------------------------------------------------
        %                           Constructor
        % -----------------------------------------------------------------
        function obj = Bip( fs , f0 ,  duration , ratio )
            % obj = Bip( fs=44100 Hz , f0=440 Hz ,  duration=0.300 s , ratio=0.25 )
            
            % ================ Check input argument =======================
            
            % Arguments ?
            if nargin > 0
                
                % --- fs ----
                assert( isscalar(fs) && isnumeric(fs) && fs>0 && fs==round(fs) , 'fs is the sampling frequency (Hertz)' )
                
                % --- f0 ----
                assert( isscalar(f0) && isnumeric(f0) && f0>0 && f0==round(f0) , 'f0 is the base frequency of the sound (Hertz)' )
                
                % --- duration ---
                assert( isscalar(duration) && isnumeric(duration) && duration>0 , 'duration is the length of the bip (seconds)' )
                
                % --- ratio ---
                assert( isscalar(ratio) && isnumeric(ratio) && ratio>0 , 'ratio between the 1 part and the 0 part of the tukey window' )
                
                obj.fs       = fs;
                obj.f0       = f0;
                obj.duration = duration;
                obj.ratio    = ratio;
                
                % ================== Callback =============================
                
                obj.GenerateSignal
                
            else
                % Create empty instance
            end
            
        end
        
        
    end % methods
    
    
end % class
