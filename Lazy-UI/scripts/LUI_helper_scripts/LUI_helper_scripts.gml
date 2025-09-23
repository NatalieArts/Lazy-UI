#macro LUI_HOVER 96

function __LUI_NULL_FUNCTION(){}

function lui_click_area(_x,_y,_w,_h){
	var _click = LUI_INPUT[0].status;
	var _mx = LUI_DEVICE.mouse_window_x;
	var _my = LUI_DEVICE.mouse_window_y;
	if _mx >=_x and _mx <= _x+_w and _my >= _y and _my <= _y+_h {
		if _click {
				//LUI_INPUT[0].status = LUI_NO_INPUT; //reset click state to prevent underlying layers of ui from receiving unintentional input.
				return LUI_CLICK;
			};
		return LUI_HOVER;
	}
	return LUI_NO_INPUT;
}

function lui_element_get_x(){
	var _x = x_offset;
	_x += parent_canvas.get_x()+parent_canvas.element_padding[0]
	return _x;
}
function lui_element_get_y(){
	var _y = y_offset;
	_y += parent_canvas.get_y()+parent_canvas.element_padding[1]
	return _y;
}

