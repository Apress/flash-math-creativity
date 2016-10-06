class HorizontalSlider extends MovieClip {
	private var nav_horizontal_square_right:MovieClip;
	private var nav_horizontal_square_left:MovieClip;
	private var object:String;
		
		
	public function HorizontalSlider(){
		init();
	}
	private function init(){
		nav_horizontal_square_left.onPress = function() {
			this.startDrag(false, 0, 0, -100, 0);
			this.onMouseMove = function(){
				_parent.nav_horizontal_square_right._x = -this._x;
				updateAfterEvent();
			}
		}
		nav_horizontal_square_left.onRelease = nav_horizontal_square_left.onReleaseOutside = function() {
			this.stopDrag();
			delete this.onMouseMove;
		}
				
		nav_horizontal_square_right.onPress = function() {
			this.startDrag(false, 0, 0, 100, 0);
			this.onMouseMove = function(){
				_parent.nav_horizontal_square_left._x = -this._x;
				updateAfterEvent();
			}
		}
		nav_horizontal_square_right.onRelease = nav_horizontal_square_right.onReleaseOutside = function() {
			this.stopDrag();
			delete this.onMouseMove;
		}
	}
	public function get value():Number {
		return nav_horizontal_square_right._x;
	}
}