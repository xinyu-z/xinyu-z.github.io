##Xinyu Zhang, Sep.24, 2019.

#makes table:
sound = Read from file: "h_t.wav"
formant = Read from file: "h_t.Formant"
textgrid = Read from file: "h_t.textgrid"

numberOfInterval = Get number of intervals: 1
table = Create Table with column names: "h_t", 0, "vowel F1 F2 F3 F4"
numberOfVowelsFound = 0
for i to numberOfInterval
	selectObject: textgrid
	vowel$ = Get label of interval: 1, i
	if vowel$ <> ""
		t1 = Get start time of interval: 1, i
		t2 = Get end time of interval: 1, i
		selectObject: formant
		f1 = Get quantile: 1, t1, t2, "hertz", 0.5
		f2 = Get quantile: 2, t1, t2, "hertz", 0.5
		f3 = Get quantile: 3, t1, t2, "hertz", 0.5
		f4 = Get quantile: 3, t1, t2, "hertz", 0.5
		selectObject: table
		Append row
		numberOfVowelsFound +=1
		Set string value: numberOfVowelsFound, "vowel", vowel$
		Set string value: numberOfVowelsFound, "F1", fixed$ (f1, 3)
		Set string value: numberOfVowelsFound, "F2", fixed$ (f2, 3)
		Set string value: numberOfVowelsFound, "F3", fixed$ (f3, 3)
		Set string value: numberOfVowelsFound, "F4", fixed$ (f4, 4)
	endif
endfor
#draws:
Erase all
Select outer viewport: 0, 6, 0, 5.5
Axes: 3000, 500, 1500, 200
Times
Black
Font size: 12
Draw inner box
Marks left every: 1, 200, "yes", "yes", "yes"
Marks bottom every: 1, 500, "yes", "yes", "yes"

sound = Read from file: "h_t.wav"
formant = Read from file: "h_t.Formant"
textgrid = Read from file: "h_t.textgrid"

numberOfInterval = Get number of intervals: 1
for i to numberOfInterval
	selectObject: textgrid
	label$ = Get label of interval: 1, i
	if label$ <> ""
		t1 = Get start time of interval: 1, i
		t2 = Get end time of interval: 1, i
		selectObject: formant
		f1 = Get quantile: 1, t1, t2, "hertz", 0.5
		f2 = Get quantile: 2, t1, t2, "hertz", 0.5
		Text: f2, "left", f1, "Half", label$
	endif
endfor