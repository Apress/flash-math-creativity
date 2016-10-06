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
		label._visible = false;
		
		pointBtn.onPress = function() {
			this._parent.startDrag(true, this._parent._x + 1, 0, this._parent._x + 1, 300);
		}
		pointBtn.onRelease = pointBtn.onReleaseOutside = function(){
			this._parent.stopDrag();
		}
	}
	
	public function onEnterFrame(){
		// set accel and elast equal to their sliders
		var accel:Number = _parent.bar1.value / 100;
		var elast:Number = _parent.bar2.value / 100;
		
		// set destinations and heights for all points
		if (display<20) {
			if (_parent.over == display) {
				yn = _parent.slider2.dest1;
			} else {
				yn = _parent.slider2.static1;
			}
		} else {
			if (_parent.over == display-19) {
				yn = _parent.slider2.dest2;
			} else {
				yn = _parent.slider2.static2;
			}
		}
		if (display<20) {
			xn = 50 + (display * 20);
		} else {
			xn = 50 + (display - _parent.half) * 20;
		}
		// --------------------------------------
		// position _x
		_x -= (_x - xn) * .5;
		// position _y
		_y -= y = (y + (_y - yn) * accel) * elast;
	}
}