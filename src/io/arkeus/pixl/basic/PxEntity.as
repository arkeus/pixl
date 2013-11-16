package io.arkeus.pixl.basic {
	import io.arkeus.pixl.Pixl;

	public class PxEntity extends PxRectangle {
		public static const LEFT:uint = 1;
		public static const RIGHT:uint = 2;
		public static const UP:uint = 4;
		public static const DOWN:uint = 8;
		public static const NONE:uint = 0;
		public static const ANY:uint = LEFT | RIGHT | UP | DOWN;
		
		public var visible:Boolean = true;
		public var active:Boolean = true;
		public var solid:Boolean = true;
		public var exists:Boolean = true;
		public var parent:PxEntity = null;
		public var velocity:PxPoint = new PxPoint;
		public var acceleration:PxPoint = new PxPoint;
		public var maxVelocity:PxPoint = new PxPoint(Number.MAX_VALUE, Number.MAX_VALUE);
		public var drag:PxPoint = new PxPoint;
		public var offset:PxPoint= new PxPoint;
		
		public function PxEntity(x:Number = 0, y:Number = 0) {
			super(x, y);
		}
		
		public function preprocess():void {}
		
		public function process():void {
			if (velocity.x != 0 || velocity.y != 0 || acceleration.x != 0 || acceleration.y != 0) {
				
			}
		}
		
		public function update():void {}
		
		private function calculateVelocity(velocity:Number, acceleration:Number, drag:Number, terminal:Number):Number {
			if (acceleration != 0) {
				velocity += acceleration * Pixl.dt;
			} else {
				var dragEffect:Number = drag * Pixl.dt;
				if (velocity - dragEffect > 0) {
					velocity -= dragEffect;
				} else if (velocity + dragEffect < 0) {
					velocity += dragEffect;
				} else {
					velocity = 0;
				}
			}
			
			if (velocity > terminal) {
				velocity = terminal;
			} else if (velocity < -terminal) {
				velocity = -terminal;
			}
			
			return velocity;
		}
	}
}
