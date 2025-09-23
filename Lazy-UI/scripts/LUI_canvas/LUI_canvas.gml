function lui_canvas(_parent = -1){
	var __canvas = {
		canvas_parent: _parent,
		canvas_x_offset: 0,
		canvas_y_offset: 0,
		canvas_min_width: 1,
		canvas_min_height: 1,
		canvas_max_width: infinity,
		canvas_max_height: infinity,
		canvas_padding: [0,0,0,0],
		children: [],
		
		//offsets
		offset: function(_x,_y){
			canvas_x_offset = _x;
			canvas_y_offset = _y;
			return self;
		},
		
		offset_x: function(_x){
			canvas_x_offset = _x;
			return self;
		},
		
		offset_y: function(_y){
			canvas_y_offset = _y;
			return self;
		},
		
		//width height
		min_width: function(_w){
			canvas_min_width = _w;
			return self;
		},
		
		min_height: function(_h){
			canvas_min_height = _h
			return self;
		},
		
		//padding
		padding:  function(_left = 0, _top = 0, _right = 0, _bottom = 0){
			canvas_padding = [_left, _top, _right, _bottom]	;
			return self;
		},
		
		//getters x/y
		get_x: function(){
			var _x = canvas_x_offset;
			if canvas_parent!=-1{
				_x += canvas_parent.get_x()
			}
			_x += canvas_padding[0]
			return _x;
		},
		
		get_y: function(){
			var _y = canvas_y_offset;
			if canvas_parent!=-1{
				_y += canvas_parent.get_y()
			}
			_y += canvas_padding[1]
			return _y;
		},
		
		//getters w/h
		get_w: function(){
			var _w;
			if canvas_parent==-1{
				_w = LUI_DEVICE.window_width-canvas_x_offset-canvas_padding[0]-canvas_padding[2]
			}
			else
			{
				_w = canvas_parent.get_w()-canvas_x_offset-canvas_padding[0]-canvas_padding[2]
			}
			return max(_w,canvas_min_width)
		},
		
		get_h: function(){
			var _h;
			if canvas_parent==-1{
				_h = LUI_DEVICE.window_height-canvas_y_offset-canvas_padding[1]-canvas_padding[3]
			}
			else
			{
				_h = canvas_parent.get_h()-canvas_y_offset-canvas_padding[1]-canvas_padding[3]
			}
			return max(_h,canvas_min_height)
		},
		
		//child canvases
		add_child: function(){
		 var _child = lui_canvas(self)
		 array_push(children,_child)
			return _child
		},
		
		draw: function(){
			draw_sprite_stretched(spr_LUI_box,0,get_x(), get_y(),get_w(),get_h())
			
			for (var i = 0; i < array_length(children); ++i) {
			    children[i].draw()
			}
		}
	}
	
	return __canvas
}