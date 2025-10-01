LUI_TICK()

canvas.check_elements()

if button_a.status == LUI_CLICK
show_debug_message("Button A Clicked!")

if button_b.status == LUI_CLICK {
track_b.check(++click_num);
}

button_b.x_offset=128+128*sin(get_timer()/1500000)
button_b.y_offset=clamp(128+128*sin(get_timer()/250000),0,button_b.parent_canvas.get_y()+button_b.parent_canvas.get_h())


button_canvas.canvas_y_offset =128-128*sin(get_timer()/1500000)