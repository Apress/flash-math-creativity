class Line extends MovieClip {
	public var pline:Array;

	private var pnt1:Object;
	private var pnt2:Object;
	private var LS:Number = 10;
	private var VPf:Number = 60;
	private var cx:Number = 320;
	private var sx:Number = 10;
	private var cy:Number = 240;
	private var sy:Number = 10;
	
	
	public function Line(){
		init();
	}
	
	private function init(){
		pnt1 = new Object();
		pnt2 = new Object();
	}
	
	public function onEnterFrame() {
		pnt1.x = pline[0] * LS;
		pnt1.y = pline[1] * LS;
		pnt1.z = pline[2] * LS;
		pnt2.x = pline[3] * LS;
		pnt2.y = pline[4] * LS;
		pnt2.z = pline[5] * LS;
		rotate(pnt1);   
		rotate(pnt2);
		_x = cx + sx * pnt1.x * VPf / (VPf - pnt1.z);
		_y = cy - sy * pnt1.y * VPf / (VPf - pnt1.z);
		_xscale = cx + sx * pnt2.x * VPf / (VPf - pnt2.z) - _x;
		_yscale = cy - sy * pnt2.y * VPf / (VPf - pnt2.z) - _y;
		swapDepths(int( (pnt1.z + pnt2.z) * 3000) + 100000);
		gotoAndStop(int( (pnt1.z + pnt2.z + 20) / 4));
	}
	private function rotate(p:Object):Void  {
		var y = p.y;
		var z = p.z;
		p.z = _parent.cos2 * z - _parent.sin2 * p.x;
		p.x = _parent.sin2 * z + _parent.cos2 * p.x;
		p.y = _parent.cos1 * y - _parent.sin1 * p.z;
		p.z = _parent.sin1 * y + _parent.cos1 * p.z;
	}
}