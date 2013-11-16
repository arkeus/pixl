package io.arkeus.pixl.canvas {
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Rectangle;

	public class PxCanvas extends Bitmap {
		private var rectangle:Rectangle;
		
		public function PxCanvas(width:uint, height:uint) {
			super(new BitmapData(width, height, true, 0xffff0000));
			this.rectangle = new Rectangle(0, 0, width, height);
		}
		
		public function clear():void {
			bitmapData.fillRect(rectangle, 0xffff0000);
		}
	}
}
