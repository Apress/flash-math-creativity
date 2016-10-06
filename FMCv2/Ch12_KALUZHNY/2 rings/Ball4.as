class Ball4 extends MovieClip {
	private var rnd1:Number;
	private var rnd2:Number;
	private var rnd3:Number;
	private var rnd4:Number;
	private var rnd5:Number;
	private var VPf:Number = 200;
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
	private var len:Number = 22;
	private var rang:Number = 50;
	
	public var timer:Number;
	
	public function Ball4(){
		init();
	}
	private function init(){
		rnd1 = 10 + Math.random() * 10;
		rnd2 = 10 + Math.random() * 10;
		rnd3 = 10 + Math.random() * 10;
		rnd4 = 4 + Math.random() * 3;
		rnd5 = 7 + Math.random() * 7;
		pnt = new Object();
		pnt0 = new Object();
		pnt1 = new Object();
		pnt2 = new Object();
		_xscale = 100;
		_yscale = 100;
		for (var i=0; i<len; i++) {
			var ring:MovieClip = attachMovie("3DRing", "R"+i, i);
			ring.ix = rang * Math.cos(i * 1.2 * Math.PI / len);
			ring.ix1 = (rang + 1) * Math.cos(i * 1.2 * Math.PI / len);
			ring.ix2 = rang * Math.cos(i * 1.2 * Math.PI / len);
			ring.iy = rang * Math.sin(i * 1.2 * Math.PI / len);
			ring.iy1 = (rang + 1) * Math.sin(i * 1.2 * Math.PI / len);
			ring.iy2 = rang * Math.sin(i * 1.2 * Math.PI / len);
			ring.iz = 0;
			ring.iz1 = 0;
			ring.iz2 = 1;
		}

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
		var cos1:Number = Math.cos(a1);
		var sin1:Number = Math.sin(a1);
		var cos2:Number = Math.cos(a2);
		var sin2:Number = Math.sin(a2);
		for (var i=0; i<len; i++) {
			pnt.x = x + this["R"+i].ix;
			pnt.y = y + this["R"+i].iy;
			pnt.z = z + this["R"+i].iz;
			pnt1.x = x + this["R"+i].ix1;
			pnt1.y = y + this["R"+i].iy1;
			pnt1.z = z + this["R"+i].iz1;
			pnt2.x = x + this["R"+i].ix2;
			pnt2.y = y + this["R"+i].iy2;
			pnt2.z = z + this["R"+i].iz2;
			
			rot (pnt, cos1, sin1, cos2, sin2);
			rot (pnt1, cos1, sin1, cos2, sin2);
			rot (pnt2, cos1, sin1, cos2, sin2);
			Prf (pnt);
			Prf (pnt1);
			Prf (pnt2);
			this["R"+i].SetPos(pnt.x, pnt.y,
				pnt1.x-pnt.x, -pnt1.y+pnt.y,
				pnt2.x-pnt.x, -pnt2.y+pnt.y);
			this["R"+i].swapDepths(int(z*100+random(10)+20000));
		}
		pnt.x = x + rang * Math.cos(a1);
		pnt.y = y + rang * Math.sin(a1);
		pnt.z = z;
		rot (pnt, cos1, sin1, cos2, sin2);
		Prf(pnt)
		S.SetPos(pnt.x, pnt.y, VPf/(VPf-pnt.z));

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