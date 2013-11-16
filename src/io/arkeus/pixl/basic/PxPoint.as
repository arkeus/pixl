package io.arkeus.pixl.basic {
	public class PxPoint {
		public var x:Number;
		public var y:Number;
		
		public function PxPoint(x:Number = 0, y:Number = 0) {
			this.x = x;
			this.y = y;
		}
		
		public function toString():String {
			return "(" + x + "," + y + ")";
		}
	}
}
