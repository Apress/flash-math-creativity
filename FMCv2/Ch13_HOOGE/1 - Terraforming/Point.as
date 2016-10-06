class Point extends MovieClip {
	public var display:Number;
	public var label:MovieClip;
	public var auto:Boolean = false;
	
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
		if(Math.abs(this._xmouse) > 20 || Math.abs(this._ymouse) > 10){
			// set accel and elast equal to their sliders
			var accel:Number = _parent.bar1.value / 100;
			var elast:Number = _parent.bar2.value / 100;
			if(i < timer && Math.abs(_y - yn) > 3) {
				i++;
			} else {
				// When i catches up with timer,
				// set new destinations for all points
				if (!auto) {
					yn = 140;
				} else {
					yn = (Math.random() * 5 + 1) * 60;
				}
				xn = -50 + display * 50;
				i = 0;
				timer = Math.random() * 20 + 10;
			}
			
			// position _x
			_x -= x = (x + (_x - xn) * accel) * elast;
			
			// position _y
			_y -= y = (y + (_y - yn) * accel) * elast;
		}
	}
}