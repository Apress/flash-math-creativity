class PositionChooser extends MovieClip {
	private var activeX:MovieClip;
	private var activeY:MovieClip;
	private var activeZ:MovieClip;
	
	public var x_offset:Number = -2;
	public var y_offset:Number = -2;
	public var z_offset:Number = -2;

	public function PositionChooser(){
		init();
	}
	private function init(){
		var count:Number = 0;
		for(var y=0;y<3;y++){
			for(var x=0;x<7;x++){
				var newBtn:MovieClip = attachMovie("circle 2", "btn_" + y + "_" + x, count++);
				newBtn._x = 5 + x * 10;
				newBtn._y = 5 + y * 10;
				newBtn.type = y;
				newBtn.offset = x - 5;
				if(x == 3){
					newBtn.gotoAndStop(2);
					if(y == 0){
						activeX = newBtn;
					} else if(y == 1){
						activeY = newBtn;
					} else if(y == 2){
						activeZ = newBtn;
					}
				}
				newBtn.onClick = function(){
					if(this.type == 0){
						if(this != _parent.activeX){
							_parent.activeX.deactivate();
							_parent.activeX = this;
							_parent.x_offset = this.offset;
						}
					} else if(this.type == 1){
						if(this != _parent.activeY){
							_parent.activeY.deactivate();
							_parent.activeY = this;
							_parent.y_offset = this.offset;
						}
					} else if(this.type == 2){
						if(this != _parent.activeZ){
							_parent.activeZ.deactivate();
							_parent.activeZ = this;
							_parent.z_offset = this.offset;
						}
					}
				}
			}
		}
	}

}