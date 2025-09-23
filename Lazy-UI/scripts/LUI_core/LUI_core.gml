#macro LUI_INPUT global.__LUI_INPUTS_STATUS
#macro LUI_NO_INPUT 0
#macro LUI_HOLD 2
#macro LUI_CLICK 1
#macro LUI_DEFAULT global.__LUI_DEFAULT_BINDINGS
#macro LUI_BIND_KB 0
#macro LUI_BIND_MOUSE 1
#macro LUI_BIND_CONTROLLER 2
#macro LUI_DEVICE global.__LUI_DEVICE_AND_WINDOW_INFORMATION
#macro LUI_SETTINGS global.__LUI_SETTINGS
#macro LUI_TICK __LUI_poll_device_information
function __init_LUI(){
	global.__LUI_SETTINGS = {
		dev_mode: true,
		manage_application_surface: true,
	}
	global.__LUI_DEVICE_AND_WINDOW_INFORMATION = {
		os: os_type,
		window_width: 1,
		window_height: 1,
		mouse_window_x: 0,
		mouse_window_y: 0,
		
	}
	global.__LUI_INPUT_QUEUE = [];
	
	global.__LUI_DRAW_QUEUE = [];
	
	global.__LUI_CANVAS_STACK = [];
	
	global.__LUI_DEFAULT_BINDINGS = [
		mb_left, //mouse_left
		mb_middle, //mouse_middle
		mb_right, //mouse_right
		m_scroll_up, //scroll wheel up
		m_scroll_down, //scroll wheel down
		vk_up,
		vk_down,
		vk_left,
		vk_right,
		vk_enter,
		vk_escape,
		vk_space,
		vk_shift,
		vk_control,
		vk_alt,
		vk_delete,
		vk_tab,
	]
	
	global.__LUI_INPUTS_STATUS = [
		///mouse input
		__LUI_make_input_status(LUI_DEFAULT[0],LUI_BIND_MOUSE), //ml
		__LUI_make_input_status(LUI_DEFAULT[1],LUI_BIND_MOUSE), //mm
		__LUI_make_input_status(LUI_DEFAULT[2],LUI_BIND_MOUSE), //mr
		__LUI_make_input_status(LUI_DEFAULT[3],LUI_BIND_MOUSE), //swu
		__LUI_make_input_status(LUI_DEFAULT[4],LUI_BIND_MOUSE), //swd
		///key input
		__LUI_make_input_status(LUI_DEFAULT[5],LUI_BIND_KB), //kup
		__LUI_make_input_status(LUI_DEFAULT[6],LUI_BIND_KB), //kdown
		__LUI_make_input_status(LUI_DEFAULT[7],LUI_BIND_KB), //kleft
		__LUI_make_input_status(LUI_DEFAULT[8],LUI_BIND_KB), //kright
		__LUI_make_input_status(LUI_DEFAULT[9],LUI_BIND_KB), //enter
		__LUI_make_input_status(LUI_DEFAULT[10],LUI_BIND_KB), //escape
		__LUI_make_input_status(LUI_DEFAULT[11],LUI_BIND_KB), //space
		__LUI_make_input_status(LUI_DEFAULT[12],LUI_BIND_KB), //shift
		__LUI_make_input_status(LUI_DEFAULT[13],LUI_BIND_KB), //control
		__LUI_make_input_status(LUI_DEFAULT[14],LUI_BIND_KB), //alt
		__LUI_make_input_status(LUI_DEFAULT[15],LUI_BIND_KB), //delete
		__LUI_make_input_status(LUI_DEFAULT[16],LUI_BIND_KB), //tab
	]
	
	//setup time
	//global.__LUI_SYSTEM_TICK = time_source_create(time_source_game, 2, time_source_units_frames,__LUI_poll_device_information,[],-1, time_source_expire_nearest)
	
	//confirm init Lets go <o u o>
	show_debug_message("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n!!@ u @ Lazy UI ACTIVATED! PEW PEW! U v U!!\n!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
}

//start lui w
__init_LUI();

///LUI helper function to setup input status
function __LUI_make_input_status(_default_binding,_bind_type){
	return {
		status: LUI_NO_INPUT,
		hold_time: 0,
		ms_since_input: 0,
		keybind: _default_binding,
		bind_type: _bind_type
	}
}

function __LUI_poll_device_information(){
	LUI_INPUT[0].status = mouse_check_button_released(LUI_INPUT[0].keybind)
	LUI_DEVICE.mouse_window_x = window_mouse_get_x()
	LUI_DEVICE.mouse_window_y = window_mouse_get_y()
	LUI_DEVICE.window_width = window_get_width()
	LUI_DEVICE.window_height = window_get_height()

	if LUI_SETTINGS.manage_application_surface{
		surface_resize(application_surface, LUI_DEVICE.window_width, LUI_DEVICE.window_height)	
		display_set_gui_size(LUI_DEVICE.window_width, LUI_DEVICE.window_height)
		
	}
}