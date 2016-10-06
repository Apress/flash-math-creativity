class Text3D6 extends MovieClip {
	private var VPf:Number = 300;
	private var sclx:Number = 20;
	private var scly:Number = 20;
	private var pnt0:Object;
	private var pnt1:Object;
	private var pnt2:Object;
	private var timer:Number = 0;
	private var str:String;
	private var numChars:Number = 0;
	
	public function Text3D6(){
		init();
	}
	
	private function init(Void):Void {
		pnt0 = new Object();
		pnt1 = new Object();
		pnt2 = new Object();
		if(str != undefined){
			setText();
		}
// 		_xscale = 200;
// 		_yscale = 200;
	}

	private function makeShape(u:Number, v:Number, p:Object):Void {
		p.x = (u - 26) * 10;
		p.y = (10 - v) * 12 + Math.cos(Math.sqrt((u-26)*(u-26)+(8-v)*(8-v)*4)/2)*12;
		p.z = (v - 10) * 10 + Math.sin(Math.sqrt((u-26)*(u-26)+(8-v)*(8-v)*4)/2)*12;
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

			var c:Number = ((108 + (pnt0.y + pnt0.z * 1.2) * 3) << 16)+ ((148 - (pnt0.y + pnt0.z * 1.2)*3) <<8);

			theChar.clr.setRGB(c);
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