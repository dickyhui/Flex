/*
	url为nowidget的响应类,不弹出widget，而是直接响应类函数
*/
package widgets.NoWidget
{
	import com.esri.ags.Map;
	
	import flash.display.Stage;
	
	import widgets.HeaderController.WidgetItem;
	
	import flash.net.navigateToURL;
	import flash.net.URLRequest;

	public class NoWidget
	{
		private static var noWidget:NoWidget;
		
		public static function GetNoWidget():NoWidget
		{
			if(noWidget == null)
			{
				noWidget = new NoWidget();
			}
			return noWidget;
		}
		
		public function DoNoWidget(map:Map,widgetItem:WidgetItem):void
		{
			var param:String;//url中?后面的是传入的参数
			if(widgetItem.url.indexOf("?") != -1)
			{
				param = widgetItem.url.split('?')[1];
			}
			switch(widgetItem.label)
			{
				case "复位":
					var reset:Reset = new Reset();
					reset.SetReset(param,map);
					break;
				case "海浪动画":
					navigateToURL(new URLRequest(encodeURI("http://" +param )),'_blank');
					break;
			}
		}
	}
}