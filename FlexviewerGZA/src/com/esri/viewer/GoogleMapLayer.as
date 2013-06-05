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
	public class GoogleMapLayer extends ArcGISTiledMapServiceLayer
	{
		private var _tileInfo:TileInfo=new TileInfo();
		private var _baseURL:String="";
		private var googleMapType:String;
		
		public static var NormalMap:String = "NormalMap";//普通矢量底图
		public static var DIXINGMap:String = "DIXINGMap";//地形图
		public static var WEIXING:String = "WEIXING";//卫星影像
		
		public function GoogleMapLayer(mapType:String)
		{
			googleMapType = mapType;
			super();
			buildTileInfo();
			setLoaded(true);
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
		
		override public function get tileInfo():com.esri.ags.layers.supportClasses.TileInfo
		{
			return _tileInfo;
		}
		
		//获取矢量地图
		override protected function getTileURL(level:Number, row:Number, col:Number):URLRequest
		{
			var url:String="";
			if(googleMapType == NormalMap)
			{
				url = "http://mt"+(col%4)+".google.cn/vt/v=w2.114&hl=zh-CN&gl=cn&" +
					"x=" + col + "&" +
					"y=" + row + "&" +
					"z=" + level+ "&s=";
			}
			else if(googleMapType == DIXINGMap)
			{
				url = "http://mt"+(col%4)+".google.cn/vt/lyrs=t@129,r@186000000&hl=zh-CN&gl=cn&src=app&s=Ga&" +
					"x=" + col + "&" +
					"y=" + row + "&" +
					"z=" + level+ "&s=";
			}
			else if(googleMapType == WEIXING)http:
			{
				url = "http://mt"+(col%4)+".google.cn/vt/lyrs=s@116&hl=zh-CN&gl=cn&src=app&s=Galil&" +
					"x=" + col + "&" +
					"y=" + row + "&" +
					"z=" + level+ "&s=";
			}
			else
			{
				return null;
			}
			return new URLRequest(url);
		}
		
		private function buildTileInfo():void
		{
			_tileInfo.height=256;
			_tileInfo.width=256;
			_tileInfo.origin=new MapPoint(-20037508.342787, 20037508.342787);
			_tileInfo.spatialReference=new SpatialReference(102113);
			_tileInfo.lods = [
				new LOD(0, 156543.033928, 591657527.591555),
				new LOD(1, 78271.5169639999, 295828763.795777),
				new LOD(2, 39135.7584820001, 147914381.897889),
				new LOD(3, 19567.8792409999, 73957190.948944),
				new LOD(4, 9783.93962049996, 36978595.474472),
				new LOD(5, 4891.96981024998, 18489297.737236),
				new LOD(6, 2445.98490512499, 9244648.868618),
				new LOD(7, 1222.99245256249, 4622324.434309),
				new LOD(8, 611.49622628138, 2311162.217155),
				new LOD(9, 305.748113140558, 1155581.108577),
				new LOD(10, 152.874056570411, 577790.554289),
				new LOD(11, 76.4370282850732, 288895.277144),
				new LOD(12, 38.2185141425366, 144447.638572),
				new LOD(13, 19.1092570712683, 72223.819286),
				new LOD(14, 9.55462853563415, 36111.909643),
				new LOD(15, 4.77731426794937, 18055.954822),
				new LOD(16, 2.38865713397468, 9027.977411),
				new LOD(17, 1.19432856685505, 4513.988705),
				new LOD(18, 0.597164283559817, 2256.994353),
				new LOD(19, 0.298582141647617, 1128.497176)
			];
		}
	}

}

