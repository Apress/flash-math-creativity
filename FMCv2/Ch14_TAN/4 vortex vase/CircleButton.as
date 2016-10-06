class CircleButton extends MovieClip {
	private var trigger:Button;
	public var onClick:Function;
	public var type:Number;
	
	public function CircleButton(){
		init();
	}
	private function init(){
		trigger.onRelease = function(){
			_parent.gotoAndStop(2);
			_parent.onClick();
		}
	}
	public function deactivate(){
		this.gotoAndStop(1);
	}
}