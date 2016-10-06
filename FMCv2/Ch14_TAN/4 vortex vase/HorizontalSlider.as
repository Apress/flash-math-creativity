class HorizontalSlider extends MovieClip {
	private var nav_horizontal_square_right:MovieClip;
	private var nav_horizontal_square_left:MovieClip;
	private var object:String;
		
		
	public function HorizontalSlider(){
		trace("init");
		init();
	}
	private function init(){
		nav_horizontal_square_left.onPress = function() {
			this.startDrag(false, 20, -90, -100, 90);
			this.onMouseMove = function(){
				_parent.nav_horizontal_square_right._x = -this._x;
				_parent.nav_horizontal_square_right._y = this._y;
				_parent.dragger._y = this._y;
				updateAfterEvent();
			}
		}
		nav_horizontal_square_left.onRelease = nav_horizontal_square_left.onReleaseOutside = function() {
			this.stopDrag();
			delete this.onMouseMove;
		}
				
		nav_horizontal_square_right.onPress = function() {
			this.startDrag(false, 20, -90, 100, 90);
			this.onMouseMove = function(){
				_parent.nav_horizontal_square_left._x = -this._x;
				_parent.nav_horizontal_square_left._y = this._y;
				_parent.dragger._y = this._y;
				updateAfterEvent();
			}
		}
		nav_horizontal_square_right.onRelease = nav_horizontal_square_right.onReleaseOutside = function() {
			this.stopDrag();
			delete this.onMouseMove;
		}
	}
	public function get x_value():Number {
		return nav_horizontal_square_right._x;
	}
	public function get y_value():Number {
		return nav_horizontal_square_right._y;
	}
}