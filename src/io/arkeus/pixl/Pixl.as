package io.arkeus.pixl {
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.geom.Rectangle;
	import flash.utils.getTimer;
	
	import io.arkeus.pixl.canvas.PxCanvas;
	import io.arkeus.pixl.state.PxStateStack;

	public class Pixl extends Sprite {
		public static const LIBRARY:String = "Pixl";
		public static const VERSION:String = "0.1.0";
		
		public static var then:uint = 0;
		public static var now:uint = 0;
		public static var dt:Number = 0;
		public static var frames:uint = 0;
		public static var fps:Number = 0;
		public static var requestedFramerate:uint = 60000;
		public static var frameStart:uint = 0;
		
		public static var width:uint = 0;
		public static var height:uint = 0;
		
		public static var stage:Stage;
		public static var engine:Pixl;
		public static var canvas:PxCanvas;
		public static var states:PxStateStack;
		
		public static var initialState:Class;
		
		public function Pixl(initialState:Class) {
			Pixl.engine = this;
			Pixl.initialState = initialState;
			Pixl.states = new PxStateStack;
			
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		protected function onAddedToStage(event:Event):void {
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			initialize();
		}
		
		protected function initialize():void {
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			stage.frameRate = 60;
			
			Pixl.width = stage.stageWidth;
			Pixl.height = stage.stageHeight;
			Pixl.stage = stage;
			Pixl.canvas = new PxCanvas(Pixl.width, Pixl.height);
			
			addChild(Pixl.canvas);
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
			
			states.push(new Pixl.initialState());
		}
		
		protected function create():void {}
		
		protected function onEnterFrame(event:Event):void {
			updateTimer();
			update();
			draw();
		}
		
		protected function updateTimer():void {
			then = now;
			now = getTimer();
			dt = then == 0 ? 0 : (now - then) / 1000;
			frames++;
			
			var duration:uint = now - frameStart;
			if (duration >= 1000) {
				fps = Math.min(requestedFramerate, frames) / (duration / 1000);
				trace("FPS: " + fps);
				frames = 0;
				frameStart = now;
			}
		}
		
		protected function update():void {
			states.process();
		}
		
		protected function draw():void {
			canvas.clear();
			states.draw();
		}
	}
}
