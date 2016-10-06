class Ring2 extends MovieClip{
	private var R:MovieClip;
	private var clr:Color;

	public var ix:Number;
	public var iy:Number;
	public var iz:Number;
	public var ix1:Number;
	public var iy1:Number;
	public var iz1:Number;
	public var ix2:Number;
	public var iy2:Number;
	public var iz2:Number;
		
	public function Ring2(){
		init();
	}
	private function init(){
		clr = new Color(this);
	}
		
	public function SetPos (px:Number, py:Number, a1:Number, b1:Number, a2:Number, b2:Number) {
		var k1:Number = Math.atan2(b2 - a1, a2 + b1);
		var k2:Number = Math.atan2(b2 + a1, a2 - b1);
		var alpha:Number = 0.5 * ( k1 + k2 );
		var phy:Number = 0.5 * ( k1 - k2 );
		if ( Math.sin(k1) == 0 || Math.sin(k2) == 0 ) {
			var sx:Number = 0.5 * ((a2+b1) / Math.cos(k1) + (a2-b1) / Math.cos(k2));
			var sy:Number = 0.5 * ((a2+b1) / Math.cos(k1) - (a2-b1) / Math.cos(k2));
		} else {
			var sx:Number = 0.5 * ((b2-a1) / Math.sin(k1) + (b2+a1) / Math.sin(k2));
			var sy:Number = 0.5 * ((b2-a1) / Math.sin(k1) - (b2+a1) / Math.sin(k2));
		}
		_rotation = phy * (-180) / Math.PI;
		_xscale = sx * 100;
		_yscale = sy * 100;
		_rotation = alpha * (-180) / Math.PI;
		_x = px;
		_y = py;
	}

}