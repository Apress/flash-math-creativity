class Point extends MovieClip {
	public var display:Number;
	public var label:MovieClip;
	public var auto:Boolean = true;
	
	private var i:Number = 0;
	private var xn:Number = 0;
	private var yn:Number = 0;
	private var x:Number = 0;
	private var y:Number = 0;
	private var timer:Number = 0;
	private var pointBtn:Button;
	
	public function Point(){
		init();
	}
	private function init(){
		_x = 200;
		_y = 0;
		label._visible = false;
		
		pointBtn.onPress = function() {
			this._parent.startDrag(true, this._parent._x + 1, 0, this._parent._x + 1, 300);
		}
		pointBtn.onRelease = pointBtn.onReleaseOutside = function(){
			this._parent.stopDrag();
		}
	}
	
	public function onEnterFrame(){
		if (i<_parent.timer) {
			i++;
		} else {
			// When i catches up with timer,
			// set new destinations for all 4 points
			if (display == 1) {
				// point 1
				yn = (Math.random() * 7 + 1) * 20;
				xn = _parent.xaxis._x;
			} else if (display == 2) {
				// point 2
				yn = _parent.yaxis._y;
				xn = (Math.random() * 7 + 12) * 20;
			} else if (display == 3) {
				// point 3
				yn = (Math.random() * 7 + 12) * 20;
				xn = _parent.xaxis._x;
			} else if (display == 4) {
				// point 4
				yn = _parent.yaxis._y;
				xn = (Math.random() * 7 + 1) * 20;
			}
			i = 0;
		}
		// --------------------------------------
		var accel:Number = _parent.bar1.value / 100;
		var elast:Number = _parent.bar2.value / 100;
		// position _x
		_x -= x = (x + (_x - xn) * accel) * elast;
		// position _y
		_y -= y = (y + (_y - yn) * accel) * elast;
	}
}