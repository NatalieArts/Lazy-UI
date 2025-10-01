track_b = lui_watch() //initialize a tracker
canvas = lui_canvas().padding(16,16,16,32) //create the base canvas
canvas.add_element(lui_text(canvas,track_b).text("A dork Clicked this $val times.")) 

button_canvas = canvas.add_child().padding(8,256,8,8) //create a child canvas to hold buttons

button_a = button_canvas.add_element(lui_button(button_canvas)) //first button clicking does nothing other than track clicking
button_b = button_canvas.add_element(lui_button(button_canvas)) 

click_num = 0; //variable for fun