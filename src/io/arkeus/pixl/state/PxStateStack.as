package io.arkeus.pixl.state {
	public class PxStateStack {
		public var states:Vector.<PxState>;
		
		public function PxStateStack() {
			states = new Vector.<PxState>;
		}
		
		public function push(state:PxState):PxState {
			states.push(state);
			state.create();
			return state;
		}
		
		public function pop():PxState {
			return states.pop();
		}
		
		public function draw():void {
			for (var i:uint = 0; i < states.length; i++) {
				var state:PxState = states[i];
				if (i == states.length - 1 || state.persistantDraw) {
					state.draw();
				}
			}
		}
		
		public function process():void {
			for (var i:uint = 0; i < states.length; i++) {
				var state:PxState = states[i];
				if (i == states.length - 1 || state.persistantProcess) {
					state.preprocess();
				}
				if (i == states.length - 1 || state.persistantProcess) {
					state.process();
				}
				if (i == states.length - 1 || state.persistantProcess) {
					state.update();
				}
			}
		}
	}
}
