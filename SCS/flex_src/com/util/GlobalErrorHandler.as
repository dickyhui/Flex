package com.util
{
	import flash.display.LoaderInfo;
	import flash.events.ErrorEvent;
	import flash.events.UncaughtErrorEvent;
	
	import mx.controls.Alert;
	
	
	/**
	 * 
	 * desc:捕获未catch的异常信息
	 * 
	 * @author hanjn
	 * @version 1.0.0
	 * @date 2011-8-21
	 */
	public class GlobalErrorHandler
	{
		
		private static var globalErrorHandler:GlobalErrorHandler=null;
		[Embed(source="assets/images/Error.png")]
		private var errorLogo:Class;
		public static var errorMessage:String = "";
		/**
		 * 得到GlobalErrorHandler实例
		 * @return GlobalErrorHandler一个实例
		 * 
		 */
		public static function  getInstance():GlobalErrorHandler {
			if(globalErrorHandler==null){
				globalErrorHandler=new GlobalErrorHandler();
			}
			return globalErrorHandler;
		}
		/**
		 * 对一个LoaderInfo添加Uncaught事件 
		 * @param loaderInfo
		 * 
		 */
		public function addUncaughtEvent(loaderInfo:LoaderInfo):void{
			if(loaderInfo.hasOwnProperty("uncaughtErrorEvents")){
				loaderInfo.uncaughtErrorEvents.addEventListener(UncaughtErrorEvent.UNCAUGHT_ERROR,uncaughtErrorHandler);
			}
		}
		/**
		 *处理caught事件 
		 * @param event
		 * 
		 */
		private function uncaughtErrorHandler(event:UncaughtErrorEvent):void{
			//取消事件流中当前节点中和所有后续节点中的事件侦听器进行处理
			//event.stopImmediatePropagation();
			//event.stopPropagation();
			event.preventDefault();
			
			//alert显示错误事件，开发的时候用
			showEvent(event);
			
			//存储错误事件，部署的时候用
			//MapManager中有添加map的右键contextMenu（显示异常）
			StoreEvent(event);
		}
		
		private function showEvent(event:UncaughtErrorEvent):void
		{
			var errorStr:String = "";
			if (event.error is Error)
			{
				var error:Error = event.error as Error;
				errorStr = "errorId=" + error.errorID 
					+ "  message=" + error.message + "\n  stack=" + error.getStackTrace();
				Alert.show(errorStr, "捕获异常",4, null, null,errorLogo);
			}
			else if (event.error is ErrorEvent)
			{
				var errorEvent:ErrorEvent = event.error as ErrorEvent;
				errorStr = "errorId=" + error.errorID 
					+ "  message=" + error.message + "\n  stack=" + error.getStackTrace();
				Alert.show(errorStr, "捕获异常",4, null, null,errorLogo);
			}
			else
			{
				errorStr = "Uncaught Error!";
				Alert.show(errorStr,"捕获异常", 4, null, null,errorLogo);
			}
		}
		private function StoreEvent(event:UncaughtErrorEvent):void
		{
			var errorStr:String = "";
			if (event.error is Error)
			{
				var error:Error = event.error as Error;
				errorStr = "errorId=" + error.errorID 
					+ "  message=" + error.message + "\n  stack=" + error.getStackTrace();
				GlobalErrorHandler.errorMessage += errorStr;
			}
			else if (event.error is ErrorEvent)
			{
				var errorEvent:ErrorEvent = event.error as ErrorEvent;
				errorStr = "errorId=" + error.errorID 
					+ "  message=" + error.message + "\n  stack=" + error.getStackTrace();
				GlobalErrorHandler.errorMessage += errorStr;
			}
			else
			{
				errorStr = "Uncaught Error!";
				GlobalErrorHandler.errorMessage += errorStr;
			}
		}
	}
}