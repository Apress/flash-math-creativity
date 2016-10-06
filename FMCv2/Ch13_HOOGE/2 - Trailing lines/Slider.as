class Slider extends MovieClip {
	private var bar:MovieClip;
	private var drag:MovieClip;
	private var control_tf:TextField;
	
	public var onChanged:Function;
		
	public function Slider(){
		init();
	}
	private function init(){
		drag.onPress = function(){
			this.startDrag(false, 0, this._y, 100, this._y);
			this.onMouseMove = function(){
				this._parent.value = this._x;
			}
		}
		drag.onRelease = drag.onReleaseOutside = function(){
			this.stopDrag();
			delete this.onMouseMove;
		}
		value = drag._x;
	}
	public function set value(v:Number):Void {
		drag._x = v;
		bar._width = v + 8;
		control_tf.text = v.toString();
		onChanged();
	}
	public function get value():Number {
		return drag._x;
	}
}