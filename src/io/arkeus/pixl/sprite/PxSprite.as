package io.arkeus.pixl.sprite {
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.ColorTransform;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import io.arkeus.pixl.Pixl;
	import io.arkeus.pixl.basic.PxEntity;

	public class PxSprite extends PxEntity {
		public var frameWidth:uint;
		public var frameHeight:uint;
		
		public var bitmapData:BitmapData;
		public var copyRectangle:Rectangle = new Rectangle;
		public var copyPoint:Point = new Point;
		public var copyMatrix:Matrix = new Matrix;
		public var frame:BitmapData;
		
		public function PxSprite(x:Number = 0, y:Number = 0, graphic:Class = null, frameWidth:uint = 0, frameHeight = 0) {
			super(x, y);
			
			if (graphic != null) {
				load(graphic, frameWidth, frameHeight);
			}
		}
		
		public function load(graphic:Class, frameWidth:uint = 0, frameHeight:uint = 0):PxSprite {
			this.frameWidth = frameWidth;
			this.frameHeight = frameHeight;
			this.bitmapData = (new graphic as Bitmap).bitmapData;
			this.width = this.bitmapData.width;
			this.height = this.bitmapData.width;
			copyRectangle.width = width;
			copyRectangle.height = height;
			frame = bitmapData.clone();
			frame.colorTransform(copyRectangle, new ColorTransform(Math.random(), Math.random(), Math.random()));
			return this;
		}
		
		override public function process():void {
			x += Math.random() - 0.5;
			y += Math.random() - 0.5;
		}
		override public function draw():void {
			copyPoint.x = x;
			copyPoint.y = y;
			copyMatrix.tx = x;
			copyMatrix.ty = y;
			
			//frame.colorTransform(copyRectangle, new ColorTransform(Math.random(), Math.random(), Math.random()));
			Pixl.canvas.bitmapData.copyPixels(frame, copyRectangle, copyPoint, null, null, true);
			//Pixl.canvas.bitmapData.draw(bitmapData, copyMatrix, null, null, null, false);
		}
	}
}
