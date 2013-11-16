package io.arkeus.pixl.basic {
	public class PxGroup extends PxEntity {
		public var members:Vector.<PxEntity>;
		
		public function PxGroup(x:Number = 0, y:Number = 0) {
			super(x, y);
			
			members = new Vector.<PxEntity>;
		}
		
		public function add(entity:PxEntity):PxGroup {
			if (entity == null) {
				throw new ArgumentError("Cannot add a null entity to a PxGroup.");
			}
			
			members.push(entity);
			
			return this;
		}
		
		public function remove(entity:PxEntity):PxGroup {
			var index:int = members.indexOf(entity);
			if (index >= 0) {
				members.splice(index, 1);
			}
			return this;
		}
		
		override public function preprocess():void {
			for (var i:uint = 0; i < members.length; i++) {
				var entity:PxEntity = members[i];
				if (!entity.exists || !entity.active) {
					continue;
				}
				entity.preprocess();
			}
		}
		
		override public function process():void {
			for (var i:uint = 0; i < members.length; i++) {
				var entity:PxEntity = members[i];
				if (!entity.exists || !entity.active) {
					continue;
				}
				entity.process();
			}
		}
		
		override public function update():void {
			for (var i:uint = 0; i < members.length; i++) {
				var entity:PxEntity = members[i];
				if (!entity.exists || !entity.active) {
					continue;
				}
				entity.update();
			}
		}
		
		override public function draw():void {
			for (var i:uint = 0; i < members.length; i++) {
				var entity:PxEntity = members[i];
				if (!entity.exists || !entity.visible) {
					continue;
				}
				entity.draw();
			}
		}
	}
}
