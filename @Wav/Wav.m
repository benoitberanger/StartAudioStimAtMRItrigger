classdef Wav < AudioPTB
    %WAV Load a wav file, and prepare it for PTB playback
    
    %% Properties
    
    properties
        
        % Parameters
        filename = char % Wav file name, with relative or absolute path
        
    end % properties
    
    
    %% Methods
    
    methods
        
        % -----------------------------------------------------------------
        %                           Constructor
        % -----------------------------------------------------------------
        function obj = Wav( filename )
            % obj = Wav( filename = '/wav/myWaveFile.wav' )
            
            % ================ Check input argument =======================
            
            % Arguments ?
            if nargin > 0
                
                % --- fs ----
                assert( ischar(filename) && length(filename)>4 && strcmp(filename(end-3:end),'.wav') , 'filename must the path to a .wav file' )
                
                obj.filename = filename;
                
                % ================== Callback =============================
                
                obj.LoadWavFile
                
            else
                % Create empty instance
            end
            
        end
        
        
    end % methods
    
    
end % class
