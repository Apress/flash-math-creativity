class PositionChooser extends MovieClip {
	public var x_objects:Number = 1;
	public var y_objects:Number = 4;
	public var z_objects:Number = 4;
	public function PositionChooser() {
		init();
	}
	private function init() {
		var count:Number = 0;
		for (var y = 0; y<3; y++) {
			for (var x = 0; x<5; x++) {
				var newBtn:MovieClip = attachMovie("circle 2", "btn_"+y+"_"+x, count++);
				newBtn._x = 5+x*10;
				newBtn._y = 5+y*10;
				newBtn.type = y;
				newBtn.offset = x+1;
				if (y == 0 && x<x_objects) {
					newBtn.gotoAndStop(2);
				} else if (y == 1 && x<y_objects) {
					newBtn.gotoAndStop(2);
				} else if (y == 2 && x<z_objects) {
					newBtn.gotoAndStop(2);
				}
				newBtn.onClick = function() {
					for (var i = 0; i<this.offset; i++) {
						_parent["btn_"+this.type+"_"+i].gotoAndStop(2);
					}
					for (var i = this.offset; i<5; i++) {
						_parent["btn_"+this.type+"_"+i].gotoAndStop(1);
					}
					if (this.type == 0) {
						_parent.x_objects = this.offset;
					}
					if (this.type == 1) {
						_parent.y_objects = this.offset;
					}
					if (this.type == 2) {
						_parent.z_objects = this.offset;
					}
					_parent._parent.removeObjects();
					_parent._parent.createObjects();
				};
			}
		}
	}
}
