package widgets.LayersManager.components {
	import com.esri.ags.Map;
	import com.esri.ags.events.MapEvent;
	import com.esri.ags.layers.Layer;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	import spark.components.DataGroup;
	import spark.components.SkinnableContainer;
	
	/**
	 * LegendManager is a component that will add Layers from the Map object
	 * into a custom List for various Layer control
	 * @author rrubalcava
	 */
	public class LegendManager extends SkinnableContainer implements IDisposable {
		
		/**
		 * Constructor
		 */
		public function LegendManager() {
			super();
		}
		
		[SkinPart(required="true")]
		/**
		 * Required List that must be in Skin
		 * @default
		 */
		public var legendDataGroup:DataGroup;
		
		/**
		 * Backing variable for <code>map</code> object
		 * @default
		 */
		protected var _map:Map;
		
		[Bindable]
		/**
		 * Collection hold Map Layers, used to control what layers are listed
		 * @default
		 */
		protected var layers:ArrayCollection;
		
		/**
		 * Regular Expression to prevent random GraphicsLayers from being added to List.
		 * Using regular expression, because there may be cases where you want
		 * a user to control a GraphicsLayer, in which case you should give it a
		 * distinctive name.
		 * @default
		 */
		protected var reg1:RegExp = /GraphicsLayer\w/;
		
		/**
		 * Regular Expression to prevent random FeatureLayers from being added to List.
		 * Using regular expression, because there may be cases where you want
		 * a user to control a FeatureLayer, in which case you should give it a
		 * distinctive name.
		 * @default
		 */
		protected var reg2:RegExp = /FeatureLayer\w/;
		
		/**
		 * Load the current contents of Map object
		 */
		protected function initialListLoad():void {
			layers = new ArrayCollection();
			var lyr:Layer;
			for each (lyr in map.layers) {
				trace("lyr.name", lyr.name);
				trace("lyr.id", lyr.id);
				if (!reg1.test(lyr.id) && !reg2.test(lyr.id)) {
					layers.addItem(lyr);
				}
			}
		}
		
		/**
		 * Load any new layers that get added to Map object
		 * @param e
		 */
		protected function onMapLayerAdded(e:MapEvent):void {
			if (!reg1.test(e.layer.id) && !reg2.test(e.layer.id))
				layers.addItem(e.layer);
		}
		
		/**
		 * Remove Layers from List that get removed from Map object
		 * @param e
		 */
		protected function onMapLayerRemoved(e:MapEvent):void {
			if(layers.getItemIndex(e.layer)>=0)
			{
				layers.removeItemAt(layers.getItemIndex(e.layer));
			}
		}
		
		override protected function partAdded(partName:String, instance:Object):void {
			super.partAdded(partName, instance);
			if (instance == legendDataGroup) {
				legendDataGroup.dataProvider = layers;
			}
		}
		
		/**
		 * Clean up when component is closed.
		 */
		public function dispose():void {
			/*_map.removeEventListener(MapEvent.LAYER_ADD, onMapLayerAdded);
			reg1 = null;
			reg2 = null;
			legendDataGroup = null;
			layers = null;
			_map = null;*/
		}
		
		[Bindable("mapChanged")]
		/**
		 * Target Map object that contains Layers
		 * @return
		 */
		public function get map():Map {
			return _map;
		}
		
		/**
		 * When Map object is set, add listeners and load initial Layers
		 * @param value
		 */
		public function set map(value:Map):void {
			if (_map != value) {
				_map = value;
				_map.addEventListener(MapEvent.LAYER_ADD, onMapLayerAdded, false, 0, true);
				_map.addEventListener(MapEvent.LAYER_REMOVE,onMapLayerRemoved,false,0,false);
				this.initialListLoad();
				dispatchEvent(new Event("mapChanged"));
			}
		}
	}
}