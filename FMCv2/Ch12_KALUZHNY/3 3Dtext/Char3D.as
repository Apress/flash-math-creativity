class Char3D extends MovieClip {
	private var charClip:MovieClip;
	public var clr:Color;
	
	public function Char3D(){
		init();
	}
	
	private function init(){
		clr = new Color(this);
	}
	
	public function setPos (px, py, a1, b1, a2, b2) {
		var k1:Number = Math.atan2(b2 - a1, a2 + b1);
		var k2:Number = Math.atan2(b2 + a1, a2 - b1);
		var alpha = 0.5 * ( k1 + k2 );
		var phy   = 0.5 * ( k1 - k2 );
		if ( Math.sin(k1) == 0 || Math.sin(k2) == 0 ) {
			var sx = 0.5 * ((a2 + b1) / Math.cos(k1) + (a2 - b1) / Math.cos(k2));
			var sy = 0.5 * ((a2 + b1) / Math.cos(k1) - (a2 - b1) / Math.cos(k2));
		} else {
			var sx = 0.5 * ((b2 - a1) / Math.sin(k1) + (b2 + a1) / Math.sin(k2));
			var sy = 0.5 * ((b2 - a1) / Math.sin(k1) - (b2 + a1) / Math.sin(k2));
		}
		charClip._rotation = phy * -180 / Math.PI;
		_xscale = sx * 100 / 24;
		_yscale = sy * 100 / 24;
		_rotation = alpha * -180 / Math.PI;
		_x = px;
		_y = py;
	}
}
