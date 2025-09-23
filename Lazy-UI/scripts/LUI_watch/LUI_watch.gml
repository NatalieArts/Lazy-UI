function lui_watch(_init_value = 0){
	var _watch = {
		previous_val: _init_value,
		current_val: _init_value, 
		updated: false,
		check: function(_variable){
			updated = false;
			current_val = _variable
			if current_val!= previous_val{
				previous_val = current_val;
				updated = true;
				return true;
			}
			return false;
		},
		
		get: function(){
			return current_val;	
		}
	}
	return _watch
}