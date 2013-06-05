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
				new LOD(4, 9783.93962049996, 36978595.474472),
				new LOD(5, 4891.96981024998, 18489297.737236),
				new LOD(6, 2445.98490512499, 9244648.868618),
				new LOD(7, 1222.99245256249, 4622324.434309),
				new LOD(8, 611.49622628138, 2311162.217155)
			];
		}
	}
	
}

