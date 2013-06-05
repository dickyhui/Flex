package com.util
{
	import com.esri.viewer.AppEvent;
	
	import flash.display.*;
	import flash.events.*;
	import flash.filters.BitmapFilterQuality;
	import flash.filters.BlurFilter;
	import flash.geom.Matrix;
	import flash.net.*;
	import flash.system.Capabilities;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.utils.*;
	
	import mx.events.*;
	import mx.preloaders.*;
	
	public class DownloadProgressBar extends Sprite implements IPreloaderDisplay
	{        
		[Embed(source="assets/images/cn.png", mimeType="application/octet-stream")]
		public var _loadingLogo:Class;
		
		private var dpbImageControl:Loader;
		private var _barSprite:Sprite;
		private var progressText:TextField;        
		private var ProgressBarSpritIsAdded:Boolean = false;
		
		public function DownloadProgressBar() {   
			super();                            
		}
		
		// Specify the event listeners.
		public function set preloader(preloader:Sprite):void {
			//Listen for 正在下载
			preloader.addEventListener(ProgressEvent.PROGRESS, handleProgress); 
			//Listen for 下载完成
			preloader.addEventListener(Event.COMPLETE, handleComplete);
			//Listen for 正在初始化
			preloader.addEventListener(FlexEvent.INIT_PROGRESS, handleInitProgress);
			//Listen for 初始化完成
			preloader.addEventListener(FlexEvent.INIT_COMPLETE, handleInitComplete);
		}
		
		// Initialize the Loader control in the override 
		// of IPreloaderDisplay.initialize().
		//配置下载进度栏的起始点，读取logo
		public function initialize():void {
			//添加logo图
			dpbImageControl = new Loader();       
			dpbImageControl.contentLoaderInfo.addEventListener(Event.COMPLETE, loader_completeHandler);
			dpbImageControl.loadBytes(new _loadingLogo() as ByteArray);
			//dpbImageControl.load(new URLRequest("loadinglogo.swf")); 
		}
		
		// After the SWF file loads, set the size of the Loader control.
		private function loader_completeHandler(event:Event):void
		{        
			addChild(dpbImageControl);
			dpbImageControl.width = 48;
			dpbImageControl.height= 48;
			dpbImageControl.x = this.stage.stageWidth/2 - dpbImageControl.width/2;
			dpbImageControl.y = this.stage.stageHeight/2 - dpbImageControl.height/2 - 48; 
		}   
		
		//
		private function addProgressBarSprit():void{
			//绘制背景渐变
			this.graphics.beginFill(0x282828);        
			this.graphics.drawRect(0,0,this.stage.stageWidth,this.stage.stageHeight);
			this.graphics.endFill(); 
//			var matrix:Matrix=new Matrix();
//			matrix.createGradientBox(this.stage.stageWidth,this.stage.stageHeight,Math.PI/2);
//			var colors:Array=[0x484848,0x161616];
//			var alphas:Array=[1,1];
//			var ratios:Array=[0,255];
//			this.graphics.lineStyle();
//			this.graphics.beginGradientFill(GradientType.LINEAR,colors,alphas,ratios,matrix);        
//			this.graphics.drawRect(0,0,this.stage.stageWidth,this.stage.stageHeight);
//			this.graphics.endFill(); 
			
			//绘制中心发光
			var _Sprite1:Sprite = new Sprite();
			addChild(_Sprite1);
			_Sprite1.graphics.beginFill(0xA5BFDD,0.45);
			_Sprite1.graphics.drawEllipse(this.stage.stageWidth/2-200, this.stage.stageHeight/2-120, 400, 240);
			_Sprite1.graphics.endFill();
			
			//滤镜实现发光边缘柔和            
			var blur:BlurFilter = new BlurFilter();
			blur.blurX = 100;
			blur.blurY = 50;
			blur.quality = BitmapFilterQuality.HIGH;
			_Sprite1.filters = [blur];
			
			//-------------------------------------------------
			
			//绘制进度条背景
			var _Sprite2:Sprite = new Sprite();
			addChild(_Sprite2);
			//_Sprite2.graphics.lineStyle(1, 0x484848);
			_Sprite2.graphics.beginFill(0xffffff);
			_Sprite2.graphics.drawRect((this.stage.stageWidth/2 - 151), (this.stage.stageHeight/2 - 11), 302, 22);   
			_Sprite2.graphics.endFill();
			
			//-------------------------------------------------
			
			//加载进度条Sprite
			_barSprite = new Sprite();
			addChild(_barSprite);
			_barSprite.x = this.stage.stageWidth/2 - 150;
			_barSprite.y = this.stage.stageHeight/2 - 10;
			
			//-------------------------------------------------
			
			//加载进度条文字
			progressText = new TextField();
			addChild(progressText); 
			progressText.defaultTextFormat = new TextFormat("Microsoft Yahei",14,0xffffff,null,null,null,null,null,"center");
			//progressText.textColor = 0x333333;
			progressText.width = 500;
			progressText.height = 22;
			progressText.x = this.stage.stageWidth/2 - 250;
			progressText.y = this.stage.stageHeight/2 + 20; 
		}
		
		//刷新进度条
		private function drawProgressBar(bytesLoaded:Number, bytesTotal:Number):void
		{   
			if (_barSprite != null && progressText != null){
				var g:Graphics = _barSprite.graphics;
				g.clear();
			    g.beginFill(0xE96F72);
			    g.drawRect(0, 0, 300*(bytesLoaded/bytesTotal),20);   
			    g.endFill();    
				
//				var matrix:Matrix=new Matrix();
//				matrix.createGradientBox(300*(bytesLoaded/bytesTotal),16,Math.PI/2);
//				var colors:Array=[0x3993C7,0x3993C7];
//				var alphas:Array=[1,1];
//				var ratios:Array=[0,255];
//				g.lineStyle();
//				g.beginGradientFill(GradientType.LINEAR,colors,alphas,ratios,matrix);        
//				g.drawRect(0,0,300*(bytesLoaded/bytesTotal),20);
//				g.endFill(); 
			}
		}
		
		//正在下载的进度
		private function handleProgress(event:ProgressEvent):void {
			//第一次处理时绘制进度条Sprit
			if (ProgressBarSpritIsAdded == false){
				ProgressBarSpritIsAdded = true;
				addProgressBarSprit();
				//trace(event.bytesTotal);
			}
			
			if (progressText != null){
				progressText.text = "下载进度：" + Number(event.bytesLoaded/event.bytesTotal*100).toFixed(1) + "%";
				//progressText.text = "下载进度：已下载 " + event.bytesLoaded + " byte，总大小 " + event.bytesTotal + " byte.";
			}        
			drawProgressBar(event.bytesLoaded, event.bytesTotal);
		}
		
		private function handleComplete(event:Event):void {
			if (progressText != null){
				progressText.text = "下载完成";
			} 
			drawProgressBar(1,1);       
		}
		
		private function handleInitProgress(event:Event):void {
//			if (progressText != null){
//				progressText.text = "正在初始化...";
//			}
//			drawProgressBar(1,1);
		}
		
		private var timer:Timer = new Timer(500,0);
		private function handleInitComplete(event:Event):void {
			if (progressText != null){
				//progressText.text = "初始化完成.";
			}
			drawProgressBar(1,1);  
			progressText.text = "正在初始化";
			//trace("初始化完成.");
			timer.addEventListener(TimerEvent.TIMER, onTimer);
			timer.start();     
			
			AppEvent.addListener(AppEvent.WIDGETDOWNLOADCOMPLETE,onWidgetDownloadComplete);
		}
		
		//widget下载完毕触发事件，当所有widget下载完切换界面
		private var widgetCount:Number = 0;
		private function onWidgetDownloadComplete(event:AppEvent):void {
			widgetCount++;
			if(widgetCount>=5)
			{
				AppEvent.removeListener(AppEvent.WIDGETDOWNLOADCOMPLETE,onWidgetDownloadComplete);
				timer.removeEventListener(TimerEvent.TIMER, onTimer);
				dispatchEvent(new Event(Event.COMPLETE));
			}
		}
		
		//显示动态文本
		private function onTimer(event:TimerEvent):void {
			if(progressText.text.length < 10)
			{
				progressText.appendText(".");
			}
			else
			{
				progressText.text = "正在初始化";
			}
		}
		
		// Implement IPreloaderDisplay interface
		
		public function get backgroundColor():uint {
			return 0;
		}
		
		public function set backgroundColor(value:uint):void {
		}
		
		public function get backgroundAlpha():Number {
			return 0;
		}
		
		public function set backgroundAlpha(value:Number):void {
		}
		
		public function get backgroundImage():Object {
			return undefined;
		}
		
		public function set backgroundImage(value:Object):void {
		}
		
		public function get backgroundSize():String {
			return "";
		}
		
		public function set backgroundSize(value:String):void {
		}
		
		public function get stageWidth():Number {
			return 500;
		}
		
		public function set stageWidth(value:Number):void {
		}
		
		public function get stageHeight():Number {
			return 375;
		}
		
		public function set stageHeight(value:Number):void {
		}
	}
}