package com.util
{
	import mx.core.FlexGlobals;

	public class GlobalProperty
	{
		/**
		 *通过设置url+？version，控制版本
		 * ViewerContainer的DEFAULT_CONFIG_FILE(config.xml)
		 * ConfigManager的controlConfig与controlUrl(configXML.widget的xml与swf)
		 * ConfigManager的createWidgets的wConfig与wUrl(configXML.widgetcontainer.widget的xml与swf)
		 * ConfigManager的createWidgets的wgConfig与wgUrl(configXML.widgetcontainer.widget的xml与swf)
		 */
		private static var _version:String = "";
		
		public static function get version():String
		{
			if(_version == "")
			{
				var i:int = FlexGlobals.topLevelApplication.url.indexOf("?");
				if(i != -1)
				{
					_version += FlexGlobals.topLevelApplication.url.substring(i);
				}
				else
				{
					_version += "?";
				}
			}
			return _version;
		}
	}
}