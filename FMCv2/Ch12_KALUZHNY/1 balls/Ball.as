class Ball extends MovieClip {
	public var x:Number;
	public var y:Number;
	public var z:Number;
	public var vx:Number;
	public var vy:Number;
	public var vz:Number;
	public var radius:Number = 2;
	public var mass:Number = 1;
	public var id:Number = 0;
	public var gravity:Number = 0;
	public var friction:Number = 1;
	private var pnt:Object;
	private var LS:Number = 10;
	private var VPf:Number = 60;
	private var cx:Number = 320;
	private var sx:Number = 10;
	private var cy:Number = 240;
	private var sy:Number = 10;
	public function Ball() {
		init();
	}
	private function init(Void):Void {
		gotoAndStop(id%_totalframes+1);
		x = Math.random()*16-8;
		y = Math.random()*16-8;
		z = Math.random()*16-8;
		vx = (Math.random()*16-8)/10;
		vy = (Math.random()*16-8)/10;
		vz = (Math.random()*16-8)/10;
		pnt = new Object();
	}
	public function getDist(sibl:MovieClip):Number {
		var dx:Number = x-sibl.x;
		var dy:Number = y-sibl.y;
		var dz:Number = z-sibl.z;
		return Math.sqrt(dx*dx+dy*dy+dz*dz);
	}
	public function onEnterFrame() {
		vy -= gravity;
		vy *= friction;
		x += vx;
		y += vy;
		z += vz;
		if (x<-LS+radius) {
			vx *= -1;
			x = -LS+radius;
		}
		if (x>LS-radius) {
			vx *= -1;
			x = LS-radius;
		}
		if (y<-LS+radius) {
			vy *= -1;
			y = -LS+radius;
		}
		if (y>LS-radius) {
			vy *= -1;
			y = LS-radius;
		}
		if (z<-LS+radius) {
			vz *= -1;
			z = -LS+radius;
		}
		if (z>LS-radius) {
			vz *= -1;
			z = LS-radius;
		}
		pnt.x = x;
		pnt.y = y;
		pnt.z = z;
		rotate();
		var k = VPf/(VPf-pnt.z);
		_x = cx+sx*pnt.x*k;
		_y = cy-sy*pnt.y*k;
		_xscale = sx*radius*2*k;
		_yscale = sy*radius*2*k;
		this.swapDepths(int(pnt.z*1000)+100000);
	}
	private function rotate(Void):Void {
		var y = pnt.y;
		var z = pnt.z;
		pnt.z = _parent.cos2*z-_parent.sin2*pnt.x;
		pnt.x = _parent.sin2*z+_parent.cos2*pnt.x;
		pnt.y = _parent.cos1*y-_parent.sin1*pnt.z;
		pnt.z = _parent.sin1*y+_parent.cos1*pnt.z;
	}
	function checkCollision(ball2:MovieClip):Void {
		var dist:Number = getDist(ball2);
		var maxDist:Number = radius+ball2.radius;
		if (dist<maxDist) {
			var ratio:Number = maxDist/dist;
			x = ball2.x+(x-ball2.x)*ratio;
			y = ball2.y+(y-ball2.y)*ratio;
			z = ball2.z+(z-ball2.z)*ratio;
			if (mass == ball2.mass) {
				var tmp:Number = vx;
				vx = ball2.vx;
				ball2.vx = tmp;
				tmp = vy;
				vy = ball2.vy;
				ball2.vy = tmp;
				tmp = vz;
				vz = ball2.vz;
				ball2.vz = tmp;
			} else {
				var totalMass:Number = mass+ball2.mass;
				var tmp:Number = vx;
				vx = (ball2.mass*(2*ball2.vx-vx)+mass*vx)/totalMass;
				ball2.vx = vx+tmp-ball2.vx;
				tmp = vy;
				vy = (ball2.mass*(2*ball2.vy-vy)+mass*vy)/totalMass;
				ball2.vy = vy+tmp-ball2.vy;
				tmp = vx;
				vz = (ball2.mass*(2*ball2.vz-vz)+mass*vz)/totalMass;
				ball2.vz = vz+tmp-ball2.vz;
			}
		}
	}
}
