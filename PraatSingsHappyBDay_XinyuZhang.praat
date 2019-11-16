# plays Happy Birthday
# Written for Paul Boersma's birthday in 2019
# ©Xinyu Zhang, 2019 <xinyu.zhang1@student.uva.nl>

beginPause: "Hello, Human"
	comment: "Please turn on sound :)" 
	comment: "or quit Praat then plug in headphones then restart the script, in that order"
clicked = endPause: "ok, it's on", 1
sf = 44100
quaver  = 0.4
fade = 0.01
rellen1# = {1, 1, 2, 2, 2, 4}
things# = {196, 196, 220, 196, 261.6, 246.9}
rellen2# = {1, 1, 2, 2, 2, 2, 2, 1, 1, 2, 2, 2, 4}
moreThings# = {196, 196, 392, 329.6, 261.6, 246.9, 220, 349, 349, 329.6, 261.6, 293.6, 261.6}
numberOfThings = size (things#)
assert size (rellen1#) = numberOfThings
string1# = zero# (numberOfThings)
for ithing to numberOfThings
	l = quaver * rellen1# [ithing]
	f = things#[ithing]
	string1# [ithing] = Create Sound from formula: "eh", 1, 0.0, l, sf, 
	... ~ 0.6 * sin (2 * pi * f * x)
	Formula: ~ self * min (x/fade, (xmax-x)/fade, 1.0)
endfor
for 1 to 2
	selectObject: string1#
	chain1 = Concatenate
	Play
	removeObject: chain1
endfor
removeObject: string1#
numberOfMoreThings = size (moreThings#)
assert size (rellen2#) = numberOfMoreThings
string2# = zero# (numberOfMoreThings)
for imoreThing to numberOfMoreThings
	l = quaver * rellen2# [imoreThing]
	f = moreThings# [imoreThing]
	string2# [imoreThing] = Create Sound from formula: "uh", 1, 0.0, l,
	... sf, ~ 0.3 * sin (2 * pi * f * x)
	Formula: ~ self * min (x/fade, (xmax-x)/fade, 1.0)
endfor
selectObject: string2#
chain2 = Concatenate
Play
removeObject: chain2
removeObject: string2#

