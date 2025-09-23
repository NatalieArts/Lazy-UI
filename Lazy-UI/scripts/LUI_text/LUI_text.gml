function lui_text(_parent, _watch_var = undefined){
	var _text = {
		parent_canvas: _parent,
		x_offset:0,
		y_offset:0,
		width: string_width("Demo: $val"),
		height: string_height("Demo: $val"),
		get_x: lui_element_get_x,
		get_y: lui_element_get_y,
		element_text: "Demo: $val",
		watcher: _watch_var,
		final_text: "Demo: $val",
		draw_x: 0, 
		draw_y: 0,
		text: function(_str){
			element_text = _str
			if is_struct(watcher)
			final_text = string_replace(element_text,"$val",string(watcher.get()))
			else final_text = element_text;
			width = string_width(final_text)
			height = string_height(final_text)
			return self;
		},
		
		check: function(_spacing_x=0,_spacing_y=0){
			if is_struct(watcher)
			if watcher.updated{
			final_text = string_replace(element_text,"$val",string(watcher.get()))
			}
			else
			final_text = element_text;
			width = string_width(final_text)
			height = string_height(final_text)
			draw_x = get_x()+_spacing_x;
			draw_y = get_y()+_spacing_y;
		},
		
		draw: function(){
			draw_text(draw_x,draw_y,final_text)
		}
		
		
	}
	return _text
}