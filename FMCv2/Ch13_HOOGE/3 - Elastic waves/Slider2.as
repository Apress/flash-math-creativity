class Slider2 extends MovieClip {
	private var __bar:MovieClip;
	private var __static1:MovieClip;
	private var __static2:MovieClip;
	private var __dest1:MovieClip;
	private var __dest2:MovieClip;
	
	public function Slider2(){
		init();
	}
	private function init(){
		__bar._y = __static1._y - 4;
		__bar._height = __static2._y - __static1._y + 8;
		
		__static1.onPress = function(){
			this.startDrag(false, this._x, 5, this._x, this._parent.__static2._y - 10);
			this.onMouseMove = function(){
				this._parent.__bar._y = this._y - 4;
				this._parent.__bar._height = this._parent.__static2._y - this._y + 8;
			}
		}
		__static1.onRelease = __static1.onReleaseOutside = function(){
			this.stopDrag();
			delete this.onMouseMove;
		}
		
		
		__static2.onPress = function(){
			this.startDrag(false, this._x, this._parent.__static1._y + 10, this._x, 295);
			this.onMouseMove = function(){
				this._parent.__bar._y = this._parent.static1._y - 4;
				this._parent.__bar._height = this._y - this._parent.__static1._y + 8;
			}
		}
		__static2.onRelease = __static2.onReleaseOutside = function(){
			this.stopDrag();
			delete this.onMouseMove;
		}
		
		
		__dest1.onPress = function(){
			this.startDrag(false, this._x, 0, this._x, 300);
		}
		__dest1.onRelease = __dest1.onReleaseOutside = function(){
			this.stopDrag();
		}
		
		
		__dest2.onPress = function(){
			this.startDrag(false, this._x, 0, this._x, 300);
		}
		__dest2.onRelease = __dest2.onReleaseOutside = function(){
			this.stopDrag();
		}
	}
	public function get static1():Number {
		return __static1._y;
	}
	public function get static2():Number {
		return __static2._y;
	}
	public function get dest1():Number {
		return __dest1._y;
	}
	public function get dest2():Number {
		return __dest2._y;
	}
	
}