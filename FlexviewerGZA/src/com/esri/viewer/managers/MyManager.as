package com.esri.viewer.managers
{
	import com.esri.ags.Graphic;
	import com.esri.ags.Map;
	import com.esri.ags.geometry.Geometry;
	import com.esri.ags.geometry.MapPoint;
	import com.esri.ags.geometry.Polyline;
	import com.esri.ags.layers.GraphicsLayer;
	import com.esri.ags.symbols.PictureMarkerSymbol;
	import com.esri.ags.symbols.Symbol;
	import com.esri.ags.webmap.PopUpRenderer;
	import com.esri.ags.webmap.supportClasses.PopUpInfo;
	import com.esri.viewer.AppEvent;
	import com.esri.viewer.SWFRenderer;
	import com.esri.viewer.ViewerContainer;
	
	import flash.display.DisplayObject;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import mx.collections.ArrayCollection;
	import mx.core.Application;
	import mx.core.ClassFactory;
	
	public class MyManager
	{
		private var map:Map;
		
		private var markSymbol:Symbol;
		
		private var jcdLayer:GraphicsLayer;
		
		public function MyManager()
		{
			const symbolUrl:String = "assets/images/Red_glow.swf";
			const symbolHeight:Number = 15;
			const symbolWidth:Number = 15;
			const symbolXOffset:Number = -3;
			const symbolYOffset:Number = -3;
			markSymbol = new PictureMarkerSymbol(symbolUrl, symbolWidth, symbolHeight, symbolXOffset, symbolYOffset);
			
			//ViewerContainer.addEventListener(AppEvent.MAP_LOADED, onMapLoad);
			//ViewerContainer.addEventListener(AppEvent.LAYER_LOADED, onLayersLoaded);
		}
		
		private function onMapLoad(event:AppEvent):void
		{
			map = event.data as Map;
		}
		
		private function onLayersLoaded(event:AppEvent):void
		{
			if(!jcdLayer)
			{
				jcdLayer = new GraphicsLayer();
				jcdLayer.name = "hot Features";
				//jcdLayer.add(p);
				jcdLayer.add(getPointGraphic(139,35));
				map.addLayer(jcdLayer);
			}
		}
		
		private function getPointGraphic(x:Number,y:Number):Graphic
		{
			var gra:Graphic = new Graphic(new MapPoint(x,y,map.spatialReference),markSymbol);
			gra.addEventListener(MouseEvent.MOUSE_OVER,mouseOver);
			gra.addEventListener(MouseEvent.MOUSE_OUT,mouseOut);
			return gra;
		}
		
		private var hitimer:uint;
		
		private function mouseOut(event:Event):void
		{
			//clearTimeout(hitimer);
		}
		private var popUpRenderer:SWFRenderer = new SWFRenderer();
		
		private function mouseOver(event:Event):void
		{
			var point:MapPoint = (event.currentTarget as Graphic).geometry as MapPoint;
			map.infoWindow.content = popUpRenderer;
			map.infoWindow.show(point);
		}
		
		private function hideInfoWindow():void
		{
			map.infoWindow.hide();
		}
		
	}
}