class ColorSuckD extends MovieClip {
	private var xspeed:Number;
	private var yspeed:Number;
	private var count:Number;

	public var me:Color;
	public var metr:Object;
	public var trail:String;
	public var snd:Sound;
	public var soundcount:Number = 100;
		
	public function ColorSuckD(){
		init();
	}
	private function init(){
		this._x = Math.random() * 400;
		this._y = Math.random() * 400;
		me = new Color(this);
		metr = {rb:0, gb:0, bb:0};
		xspeed = Math.random() * 20 - 10;
		yspeed = Math.random() * 20 - 10;
		snd = new Sound(this);
	}	
	public function onEnterFrame(){
		if (_x>400) {
			xspeed = Math.random() * 10;
			xspeed *= -1;
			yspeed = Math.random() * 10;
		}
		if (_x<0) {
			xspeed = Math.random() * 10;
			yspeed = Math.random() * 10;
		}
		if (_y>400) {
			yspeed = Math.random() * 10;
			yspeed *= -1;
			xspeed = Math.random() * 10;
		}
		if (_y<0) {
			yspeed = Math.random() * 10;
			xspeed = Math.random() * 10;
		}
		_x += xspeed;
		_y += yspeed;
		var newBox:MovieClip = _root.attachMovie(trail, "box"+count, count);
		newBox._x = _x;
		newBox._y = _y;
		var newCol = new Color(newBox);
		newCol.setTransform(metr);
		newBox._rotation = this._rotation = count;
		count++;
	}
	public function set soundLink(link:String):Void {
		snd.attachSound(link);
	}
	public function playSound(){
		snd.setVolume(soundcount--);
		snd.start();
		if(soundcount == 0){
			soundcount = 100;
		}
	}	
}