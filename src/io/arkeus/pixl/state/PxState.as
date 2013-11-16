package io.arkeus.pixl.state {
	import io.arkeus.pixl.basic.PxGroup;

	public class PxState extends PxGroup {
		public var persistantProcess:Boolean = false;
		public var persistantDraw:Boolean = true;
		
		public function PxState() {}
		
		public function create():void {}
	}
}
