class Text3D extends MovieClip {
	private var VPf:Number = 260;
	private var sclx:Number = 20;
	private var scly:Number = 20;
	private var pnt0:Object;
	private var pnt1:Object;
	private var pnt2:Object;
	private var timer:Number = 0;
	private var str:String;
	private var numChars:Number = 0;
	
	public function Text3D(){
		init();
	}
	
	private function init(Void):Void {
		pnt0 = new Object();
		pnt1 = new Object();
		pnt2 = new Object();
		if(str != undefined){
			setText();
		}
	}

	private function makeShape(u:Number, v:Number, p:Object):Void {
		p.x = (u - 8) * 20;
		p.y = (4 - v) * 14 + Math.cos(Math.sqrt((u - 8) * (u - 8) + (3 - v) * (3 - v)) / 2 + timer / 4) * 36;
		p.z = (v - 4) * 20;
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

			var c:Number = (int(128 + (pnt0.y + pnt0.z * 0.7) * 3) & 0xFF);

			c = (c << 16) | (c << 8) | 0xFF;
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