package widgets.NoWidget
{
	import com.esri.ags.Map;
	import com.esri.ags.geometry.MapPoint;
	import com.esri.ags.layers.ArcGISDynamicMapServiceLayer;
	import com.esri.ags.layers.FeatureLayer;
	import com.esri.ags.layers.GraphicsLayer;
	import com.esri.ags.layers.Layer;
	import com.esri.viewer.AppEvent;
	import com.esri.viewer.ViewerContainer;
	import com.esri.viewer.WidgetStates;
	
	import mx.collections.ArrayCollection;
	import mx.events.EffectEvent;
	
	public class Reset
	{
		private var map:Map;
		public function Reset()
		{
		}
		
		public function SetReset(param:String,map0:Map):void
		{
			var paramArray:Array = param.split(';');
			map = map0;
			var centerX:Number =  Number(paramArray[0])||12660365.68;
			var centerY:Number =  Number(paramArray[1])||2538300;
			var level:Number =  Number(paramArray[2])||4;
			map.infoWindow.hide();//隐藏infowindow
			showGraphicLayer();//显示点数据
			removeExistLayers();//移除图像
			CloseWidgetWaveAnimation();//关闭海浪动画
			//设置地图初始化范围,level是加载上来的级数从0开始
			map.level = level;
			map.centerAt(new MapPoint(centerX,centerY));
		}
		
		
		private function showGraphicLayer():void
		{
			for each(var layer:Layer in map.layers)
			{
				if(layer.id == "SiteFeatures")
				{
					if((layer as GraphicsLayer).visible == false)
					{
						(layer as GraphicsLayer).visible = true;
					}
				}
			}
		}

		//分发自定义事件，以关闭WaveAnimationWidget
		//不直接用AppEvent.CHANGE_WIDGET_STATE是因为WaveAnimationWidget不一定打开着，若没打开会跳错
		//在WaveAnimationWidget中监听AppEvent.CloseWaveAnimation事件可以解决该问题
		private function CloseWidgetWaveAnimation():void
		{
			ViewerContainer.dispatchEvent(new AppEvent(AppEvent.CloseWaveAnimation));
		} 
		
		//移除所有动态图层，若一边找图层一边删除，会出现删不干净的bug，所以先将所有的待删除的图层放在列表中，一起删除
		private function removeExistLayers():void
		{
			var layerList:Array = new Array();
			for each(var layer:Layer in map.layers)
			{
				if((layer is ArcGISDynamicMapServiceLayer)||(layer.id == "ContourLabel"))
				{
					layerList.push(layer);
				}
			}
			if(layerList.length>0)
			{
				for each(var layer:Layer in layerList)
				{
					map.removeLayer(layer);
				}
			}
		}
	}
}