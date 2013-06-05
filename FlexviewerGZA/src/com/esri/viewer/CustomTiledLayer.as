package com.esri.viewer
{
	import com.esri.ags.SpatialReference;
	import com.esri.ags.geometry.Extent;
	import com.esri.ags.geometry.MapPoint;
	import com.esri.ags.layers.ArcGISTiledMapServiceLayer;
	import com.esri.ags.layers.TiledMapServiceLayer;
	import com.esri.ags.layers.supportClasses.*;
	
	import flash.net.URLRequest;
	
	//扩展TiledMapServiceLayer图层实现加载google地图
	public class CustomTiledLayer extends ArcGISTiledMapServiceLayer
	{
		private var _baseURL:String="";
		private var _tileInfo:TileInfo=new TileInfo();
		
		public function CustomTiledLayer(url:String=null)
		{
			super();
			this._baseURL = url;
			buildTileInfo();
			setLoaded(true);
		}
		
		override public function get tileInfo():com.esri.ags.layers.supportClasses.TileInfo
		{
			return _tileInfo;
		}
		override public function get fullExtent():Extent
		{
			return new Extent(-20037508.342787, -20037508.342787, 20037508.342787, 20037508.342787, new SpatialReference(102113));
		}
		
		override public function get initialExtent():Extent
		{
			return new Extent(-20037508.342787, -20037508.342787, 20037508.342787, 20037508.342787, new SpatialReference(102113));
		}
		
		override public function get spatialReference():SpatialReference
		{
			return new SpatialReference(102113);
		}
		
		//获取卫星底图
		override protected function getTileURL(level:Number, row:Number, col:Number):URLRequest
		{
			var url:String = _baseURL.replace("{x}",col).replace("{y}",row).replace("{z}",level);
			
			return new URLRequest(url);
		}
		
		private function buildTileInfo():void
		{
			_tileInfo.height=256;
			_tileInfo.width=256;
			_tileInfo.origin=new MapPoint(-20037508.342787, 20037508.342787);
			_tileInfo.spatialReference=new SpatialReference(102113);
			_tileInfo.lods = [
				new LOD(8, 611.49622628138, 2311162.217155),
				new LOD(9, 305.748113140558, 1155581.108577),
				new LOD(10, 152.874056570411, 577790.554289),
				new LOD(11, 76.4370282850732, 288895.277144),
				new LOD(12, 38.2185141425366, 144447.638572),
				new LOD(13, 19.1092570712683, 72223.819286),
				new LOD(14, 9.55462853563415, 36111.909643)
			];
		}
	}
	
}

