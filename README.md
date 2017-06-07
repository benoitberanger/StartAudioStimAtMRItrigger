# How to use it
Start the `main.m` function, select your audio file, then the script wait for a key to be pressed to start the audio playback.  
To stop the playback before the end, use the `ForceStopPlayback.m` function.

## Need to adapt the scripts to your setup ? 
The `main.m` function is quite easy to read and commented, it's easy to modify for your own setup.

# Requirement
**Psychtoolbox** : http://psychtoolbox.org/  
_(StimTemplate : https://github.com/benoitberanger/StimTemplate.git)_  

# OS
Should be independ, because it's base on psychtoolbox functions  

# Matlab/Octave
**MATLAB** : tested on R2011a, superior versions should be fine  
_Octave : Class definition (the '@' directories) is made for MATLAB but not for Octave_  

## Conveniente setup
For more convenience, add your _.wav_ (or _.mp3_ if audioread is available for your version of MATLAB) in the directory.  

## StartAudioStimAtMRItrigger
used for fMRI projects @ CENIR-ICM, Paris  
CENIR : http://www.cenir.org/  
ICM : http://icm-institute.org/  

## Team
Development : Benoît Béranger (CENIR-ICM, Paris)  
