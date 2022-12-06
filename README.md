# MIDI-to-Desmos

A ReaScript that reads a midi item and creates a piece-wise function that can be copy-pasted into Desmos. The resulting graph can then be played back using the "Hear Graph" button, and it will sound like the original MIDI, althought probably in a different key.

For best results, set Desmos X-Axis from 0 <= x <= 24, the Y-Axis from 0 <= y <= 12, and set the audio trace speed to 1/4.

Unfortunately, as far as I know Desmos only grants you one octave of range, and can only be made to play about 20s of graph at a time.

If you would like to try it, you can just download this script and put it wherever you like to keep reascripts, and then run it in reaper :)

Here is an example of a project that utilizes this script: https://www.youtube.com/watch?v=OPogyfMJmRU
