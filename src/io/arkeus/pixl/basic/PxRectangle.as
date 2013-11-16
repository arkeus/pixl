package io.arkeus.pixl.basic {
	public class PxRectangle extends PxPoint {
		public var width:Number;
		public var height:Number;
		
		public function PxRectangle(x:Number = 0, y:Number = 0, width:Number = 0, height:Number = 0) {
			super(x, y);
			this.width = width;
			this.height = height;
		}
		
		public function overlaps(other:PxRectangle):Boolean {
			return left < other.right && top < other.bottom && right > other.left && bottom > other.top;
		}
		
		public function get left():Number { return x; }
		public function get right():Number { return x + width; }
		public function get top():Number { return y; }
		public function get bottom():Number { return y + height; }
		
		override public function toString():String {
			return "(" + x + "," + y + "," + width + "," + height + ")";
		}
	}
}
