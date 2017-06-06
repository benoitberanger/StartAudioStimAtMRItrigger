function LinkToPAhandle( obj, pahandle )

obj.AssertSignalReady();

try
    PsychPortAudio('GetStatus', pahandle);
    obj.pahandle = pahandle;
catch err
    rethrow(err)
end

end
