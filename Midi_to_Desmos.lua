--[[
*
* This script will take midi notes, and output a txt file with 
* expressions that can be copy/pasted to Desmos, which can
* playback the graph as a song :)
*
* This will write the txt file to the project record path.
*
*
--]]

--================================================== MAIN ================================================

function main()
  --[[]]
  local midiTake = GetMidiTake()
  
  if not midiTake then return end
  --[[]]
  
  reaper.ClearConsole()
  
  local projPath = reaper.GetProjectPath(0)
  local outPath = projPath .. "\\output.txt"
  
  
  local file = io.open(outPath, "w")
  
  local notecnt, ccevtcnt, textsyxcnt
  _, notecnt, ccevtcnt, textsyxcnt = reaper.MIDI_CountEvts(midiTake)
  
  local sel, muted, sPpqpos, ePpqpos, chan, pitch, vel
  local sQnpos, eQnpos
  local fstring = "y = \\left\\{"
  
  for i = 0, notecnt - 1 do
  
    _, sel, muted, sPpqpos, ePpqpos, chan, pitch, vel = reaper.MIDI_GetNote(midiTake, i)
    sTimepos = reaper.MIDI_GetProjTimeFromPPQPos(midiTake, sPpqpos)
    eTimepos = reaper.MIDI_GetProjTimeFromPPQPos(midiTake, ePpqpos)
    
    fstring = fstring .. string.format("%.4f < x < %.4f: %d", sTimepos, eTimepos, pitch - 59) --59 is a magic number for the song i'm doing
    
    if i < notecnt-1 then
      fstring = fstring .. ","
    end
    
  end
  
  fstring = fstring .. "\\right\\}"
  file:write(fstring)
  io.close(file)
  
  --reaper.ShowConsoleMsg("Saved output.txt to: " .. projPath .. "\n")
  
end

--============================================ HELPER FUNCTIONS ===========================================

function GetMidiTake()
  local midiEditor = reaper.MIDIEditor_GetActive()
  
  if not midiEditor then
    reaper.ShowConsoleMsg("failed to get active midi editor. make sure one is open and acvive.")
    return
  end
  
  local midiTake = reaper.MIDIEditor_GetTake(midiEditor)
  return midiTake
end

--============================================= END/CALL MAIN ==============================================

main()
