class Text3D7 extends MovieClip {
	private var VPf:Number = 260;
	private var sclx:Number = 11;
	private var scly:Number = 11;
	private var pnt0:Object;
	private var pnt1:Object;
	private var pnt2:Object;
	private var timer:Number = 0;
	private var str:String;
	private var numChars:Number = 0;
	
	public function Text3D7(){
		init();
	}
	
	private function init(Void):Void {
		pnt0 = new Object();
		pnt1 = new Object();
		pnt2 = new Object();
		if(str != undefined){
			setText();
		}
 		_xscale = 200;
 		_yscale = 200;
	}

	private function makeShape(u:Number, v:Number, p:Object):Void {
		if ( timer < 0 ) {
			p.x = (u - 8)*11.5;
			p.y = (4-v)*12;
			p.z = 0;
		} else if ( timer <= 20 ) {
			p.x = (u - 8)*11.5;
			p.y = (4-v)*12;
			p.z = -timer*10- (4-v)*timer;
		} else if ( timer <= 40 ) {
			var x, z;
			x = (u - 8)*11.5;
			p.y = (4-v)*12;
			z = -(4-v)*20;
			p.x = x * Math.cos((timer-21)/6) - z * Math.sin((timer-21)/6);
			p.z = -200 + x * Math.sin((timer-21)/6) + z * Math.cos((timer-21)/6);
		} else if ( timer <= 60 ) {
			p.x = (8-u)*11.5*(60-timer)/20 + (timer-40)/20*70*Math.sin((8-u)/6);
			p.y = (4-v)*12;
			p.z = -200 + (4-v)*(60-timer) - (timer-40)*3.5*Math.cos((8-u)/6);
		} else {
			var x = 70*Math.sin((8-u)/6);
			p.y = (4-v)*12;
			var z = -70*Math.cos((8-u)/6);
			p.x = x * Math.cos((timer-61)/6) - z * Math.sin((timer-61)/6);
			p.z = -200 + x * Math.sin((timer-61)/6) + z * Math.cos((timer-61)/6);
		}
	}
	private function projectPoint(p:Object):Void {
		p.x = p.x * VPf / (VPf - p.z);
		p.y = -p.y * VPf / (VPf - p.z);
	}


	public function setText(Void):Void  {
		for(var prop in this){
			if(typeof this[prop] == "movieclip"){
				this[prop].removeMovieClip();
			}
		}
		var x:Number = 0;
		var y:Number = 0;
		var num:Number = 0;
		for(var i=0; i<str.length; i++ ) {
			var ch:String = str.charAt(i);
			if (ch > " ") {
 				var theChar:MovieClip = attachMovie("Char3D", "char" + num, num);
				theChar.u = x;
				theChar.v = y;
				theChar.charClip.tf.text = ch;
				num++;
				x++;
			} else if (ch == " ") {
				x++;
			}
			if (ch < " ") {
				y += 1.5;
				x = 0;
			}
		}
		numChars = num;
	}

	function onEnterFrame (Void):Void {
		timer++;
		for (var i=0; i < numChars; i++ ) {
			var theChar:MovieClip = this["char" + i];
			makeShape(theChar.u, theChar.v, pnt0);
			makeShape(theChar.u, theChar.v + 1, pnt1);
			makeShape(theChar.u + 1, theChar.v, pnt2);

// 			var c:Number = ((108 + (pnt0.y + pnt0.z * 1.2) * 3) << 16)+ ((148 - (pnt0.y + pnt0.z * 1.2)*3) <<8);
// 
// 			theChar.clr.setRGB(c);
			projectPoint(pnt0);
			projectPoint(pnt1);
			projectPoint(pnt2);
			theChar.setPos(pnt0.x, pnt0.y,
				pnt1.x-pnt0.x, -pnt1.y+pnt0.y,
				pnt2.x-pnt0.x, -pnt2.y+pnt0.y);
		}
	}
	public function set text(txt:String){
		str = txt;
		setText();
	}
	public function get text():String {
		return str;
	}
}