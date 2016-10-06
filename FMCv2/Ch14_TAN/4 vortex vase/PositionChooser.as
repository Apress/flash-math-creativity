class PositionChooser extends MovieClip {
	private var offset:Number = 5;
	private var max_number:Number = 20
	
	public function PositionChooser(){
		init();
	}
	private function init(){
		var count:Number = 0;
		for(var x=0;x<21;x++){
			var newBtn:MovieClip = attachMovie("circle 2", "btn_" + x, count++);
			newBtn._x = 5 + x * 10;
			newBtn.offset = x;
			newBtn.onClick = function(){
				for(var i=0;i<=this.offset;i++){
					_parent["btn_" + i].gotoAndStop(2);
				}
				for(var i=this.offset+1; i<21; i++){
					_parent["btn_" + i].gotoAndStop(1);
				}
				_parent.offset = this.offset;
				_parent._parent.removeObjects();
				_parent._parent.createObjects();
			}
		}
	}
	public function get value(){
		return 3.085 / max_number * offset;
	}

}