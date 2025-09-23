

function lui_button(_parent = self){
var _butt = {
		parent_canvas: _parent,
		x_offset:0,
		y_offset:0,
		width: 64,
		height: 64,
		background: spr_LUI_box,
		sprite_animation: 0,
		hover_warp:[2,2,2,2],
		hover_color: c_yellow,
		text: "",
		draw_x: 0,
		draw_y: 0,
		status: LUI_NO_INPUT,
		funct: __LUI_NULL_FUNCTION,
		get_x: lui_element_get_x,
		get_y: lui_element_get_y,
		color: make_color_hsv(irandom(255),255,255),
		
		//check the status
		check: function(_spacing_x=0,_spacing_y=0){
			status = LUI_NO_INPUT
			draw_x = get_x()+_spacing_x
			draw_y = get_y()+_spacing_y
			status = lui_click_area(draw_x,draw_y,width,height)	
			if status == LUI_CLICK funct();
		},
		
		draw: function(){
			
			if status == LUI_HOVER 
				draw_sprite_stretched_ext(background,sprite_animation,draw_x-hover_warp[0],draw_y-hover_warp[1],width+hover_warp[2],height+hover_warp[3],hover_color,1)
			else
				draw_sprite_stretched_ext(background,sprite_animation,draw_x,draw_y,width,height,color,1)
		
		},

	}
	
	return _butt;
}