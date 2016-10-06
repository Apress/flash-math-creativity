class VerticalSlider extends MovieClip {
	private var nav_vertical_square_top:MovieClip;
	private var nav_vertical_square_bottom:MovieClip;
	private var object:String;
		
		
	public function VerticalSlider(){
		init();
	}
	private function init(){
		nav_vertical_square_top.onPress = function() {
			this.startDrag(false, 0, -100, 0, 0);
			this.onMouseMove = function(){
				_parent.nav_vertical_square_bottom._y = -this._y;
				updateAfterEvent();
			}
		}
		nav_vertical_square_top.onRelease = nav_vertical_square_top.onReleaseOutside = function() {
			this.stopDrag();
			delete this.onMouseMove;
		}
				
		nav_vertical_square_bottom.onPress = function() {
			this.startDrag(false, 0, 100, 0, 0);
			this.onMouseMove = function(){
				_parent.nav_vertical_square_top._y = -this._y;
				updateAfterEvent();
			}
		}
		nav_vertical_square_bottom.onRelease = nav_vertical_square_bottom.onReleaseOutside = function() {
			this.stopDrag();
			delete this.onMouseMove;
		}
	}
	public function get value():Number {
		return nav_vertical_square_bottom._y;
	}
}