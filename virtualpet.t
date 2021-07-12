var x, lab, time, state

fun init() {
	state: 1
	html("<center>")
	html("<h1>Virtual Pet - Mr. Bean</h1>")
	time: timer(8000, hungry)
	x: makeimg()
	setimg(.x, "https://www.cs.drexel.edu/~sa3724/Moods2/relaxed.jpg")
	html("<br><br>")
	lab: makelabel("Mr. Bean is relaxed right now")
	html("<br><br>") 
	button("Feed Mr. Bean", feed)
	html("&emsp;")
	button("Dance with Mr. Bean", dance)
	html("&emsp;")
	button("Take Mr. Bean's Teddy", taketeddy)
	html("&emsp;")
	button("Flirt with Mr. Bean", flirt)
	html("</center>")
	html("<br><br>")
	html("<a href=\'https://www.cs.drexel.edu/~sa3724/documentation.html\'>Link</a> to documentation of this virtual pet.")
	html("<br><strong>Note: Some images may take some time to load.</strong>")
}

fun feed() {
	if .state == 1 {
		happy()
	}
	else if .state == 2 {
		sleepy()
		setlabel(.lab, "You have fed Mr. Bean too much; he's feeling sleepy. Let him rest. Wait for some time before doing any action. He'll become active shortly.")
	}
	else if (.state == 5 | .state == 7) | .state == 8 {
		relaxed()
	}
}

fun dance() {
	if (((.state == 1 | .state == 2) | (.state == 5 | .state == 6)) | (.state == 7 | .state == 8)) | .state == 9 {
		dancing()
	}
	else if .state == 4 {
		sleepy()
		setlabel(.lab, "Mr. Bean has been dancing too much, he needs some rest now. Wait for some time before doing any action. He'll become active shortly.")
	}
}

fun taketeddy() {
	if .state == 1 | .state == 2 {
		sad()
	}
	else if .state == 6 {
		angry()
	}
}

fun flirt() {
	if .state == 1 | .state == 2 {
		flirty()
	}
	else if .state == 9 {
		notserious()
	}
}

fun relaxed() {
	stoptimer(.time)
	time: timer(8000, hungry)
	state: 1
	setimg(.x, "https://www.cs.drexel.edu/~sa3724/Moods2/relaxed.jpg")
	setlabel(.lab, "Mr. Bean is relaxed right now") 
}

fun happy() {
	stoptimer(.time)
	time: timer(8000, relaxed)
	state: 2
	setimg(.x, "https://www.cs.drexel.edu/~sa3724/Moods2/happy.jpg")
	setlabel(.lab, "Mr. Bean is happy") 
}

fun sleepy() {
	stoptimer(.time)
	time: timer(8000, happy)
	state: 3
	setimg(.x, "https://www.cs.drexel.edu/~sa3724/Moods2/sleepy.jpg")
}

fun dancing() {
	stoptimer(.time)
	time: timer(10000, rand)
	state: 4
	setimg(.x, "https://www.cs.drexel.edu/~sa3724/Moods2/dancing.gif")
	setlabel(.lab, "Mr. Bean is dancing, join him!!") 
}

fun hungry() {
	stoptimer(.time)
	time: timer(8000, mad)
	state: 5
	setimg(.x, "https://www.cs.drexel.edu/~sa3724/Moods2/hungry.jpg")
	setlabel(.lab, "Mr. Bean is hungry, you should feed him") 
}

fun sad() {
	stoptimer(.time)
	time: timer(8000, rand)
	state: 6
	setimg(.x, "https://www.cs.drexel.edu/~sa3724/Moods2/sad.jpg")
	setlabel(.lab, "You took Mr. Bean's teddy, he's sad") 
}

fun angry() {
	stoptimer(.time)
	time: timer(8000, sad)
	state: 7
	setimg(.x, "https://www.cs.drexel.edu/~sa3724/Moods2/angry.jpg")
	setlabel(.lab, "You should return Mr. Bean's teddy, he's angry") 
}

fun mad() {
	stoptimer(.time)
	state: 8
	setimg(.x, "https://www.cs.drexel.edu/~sa3724/Moods2/mad.jpg")
	setlabel(.lab, "You have left Mr. Bean uncared, he's mad") 
}

fun flirty() {
	stoptimer(.time)
	time: timer(8000, relaxed)
	state: 9
	setimg(.x, "https://www.cs.drexel.edu/~sa3724/Moods2/flirty.gif")
	setlabel(.lab, "Mr. Bean is being flirty") 
}

fun notserious() {
	stoptimer(.time)
	time: timer(10000, relaxed)
	state: 10
	setimg(.x, "https://www.cs.drexel.edu/~sa3724/Moods2/notserious.gif")
	setlabel(.lab, "Sorry to break your heart but, Mr. Bean is currently not looking for anything serious") 
}

fun rand() {
	var randint
	randint: random(2)
	if .randint == 0 {
		relaxed()
	}
	else {
		happy()
	}
}
