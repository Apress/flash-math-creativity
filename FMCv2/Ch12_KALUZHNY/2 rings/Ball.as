class Ball extends MovieClip {
	private var rnd1:Number;
	private var rnd2:Number;
	private var rnd3:Number;
	private var rnd4:Number;
	private var rnd5:Number;
	private var VPf:Number = 150;
	private var centerx:Number = 320;
	private var centery:Number = 240;
	private var pnt:Object;
	private var pnt0:Object;
	private var pnt1:Object;
	private var pnt2:Object;
	private var R0:MovieClip;
	private var R1:MovieClip;
	private var R2:MovieClip;
	private var S:MovieClip;
	
	public var timer:Number;
	
	public function Ball(){
		init();
	}
	private function init(){
		rnd1 = 10 + Math.random() * 10;
		rnd2 = 10 + Math.random() * 10;
		rnd3 = 10 + Math.random() * 10;
		rnd4 = 7 + Math.random() * 7;
		rnd5 = 7 + Math.random() * 7;
		pnt = new Object();
		pnt0 = new Object();
		pnt1 = new Object();
		pnt2 = new Object();
		_xscale = 100;
		_yscale = 100;
		attachMovie("3DRing", "R0", 0);
		attachMovie("3DRing", "R1", 1);
		attachMovie("3DRing", "R2", 2);
		S.SetPos = function(px:Number, py:Number, scale:Number):Void {
			this._xscale = scale * 100;
			this._yscale = scale * 100;
			this._x = px;
			this._y = py;
		}
	}

	function Prf(p:Object) {
		p.x = centerx + p.x * VPf / (VPf - p.z);
		p.y = centery - p.y * VPf / (VPf - p.z);
	}
	function rot (p:Object, cos1:Number, sin1:Number, cos2:Number, sin2:Number) {
		var x:Number = p.x;
		p.x = cos1 * x - sin1 * p.y;
		var y:Number = sin1 * x + cos1 * p.y;
		p.y = cos2 * y - sin2 * p.z;
		p.z = sin2 * y + cos2 * p.z;
	}

	function Set3DPos(x:Number, y:Number, z:Number, a1:Number, a2:Number) {
		pnt.x = x;
		pnt.y = y;
		pnt.z = z;
		
		pnt0.x = 1;
		pnt0.y = 0;
		pnt0.z = 0;
		
		pnt1.x = 0;
		pnt1.y = 1;
		pnt1.z = 0;
		
		pnt2.x = 0;
		pnt2.y = 0;
		pnt2.z = 1;
		
		var cos1:Number = Math.cos(a1);
		var sin1:Number = Math.sin(a1);
		var cos2:Number = Math.cos(a2);
		var sin2:Number = Math.sin(a2);
		
		rot(pnt0, cos1, sin1, cos2, sin2);
		rot(pnt1, cos1, sin1, cos2, sin2);
		rot(pnt2, cos1, sin1, cos2, sin2);
		
		pnt0.x += x;
		pnt0.y += y;
		pnt0.z += z;
		
		pnt1.x += x;
		pnt1.y += y;
		pnt1.z += z;
		
		pnt2.x += x;
		pnt2.y += y;
		pnt2.z += z;
		
		Prf(pnt);
		Prf(pnt0);
		Prf(pnt1);
		Prf(pnt2);
		
		R0.SetPos(pnt.x, pnt.y,
				pnt0.x - pnt.x, -pnt0.y + pnt.y,
				pnt1.x - pnt.x, -pnt1.y + pnt.y);
		R1.SetPos(pnt.x, pnt.y,
				pnt1.x - pnt.x, -pnt1.y + pnt.y,
				pnt2.x - pnt.x, -pnt2.y + pnt.y);
		R2.SetPos(pnt.x, pnt.y,
				pnt2.x - pnt.x, -pnt2.y + pnt.y,
				pnt0.x - pnt.x, -pnt0.y + pnt.y);
		
		S.SetPos(pnt.x, pnt.y, VPf / (VPf - z));
		
		this.swapDepths(int(z * 10 + 5000));
	}
	public function onEnterFrame(){
		timer++;
		Set3DPos(56 * Math.cos(timer / rnd1 + 2),
				56 * Math.cos( timer / rnd2 ),
				56 * Math.cos(timer / rnd3 + 1),
				timer / rnd4,
				timer / rnd5);
	}
}