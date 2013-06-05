////////////////////////////////////////////////////////////////////////////////
//
// Copyright (c) 2012 GIS KEY LAB ZJU
//
//LineChart titleRenderer
//
////////////////////////////////////////////////////////////////////////////////

package widgets.Station
{
	import flash.display.*;
	import flash.geom.Matrix;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	import mx.charts.*;
	import mx.charts.chartClasses.ChartLabel;
	import mx.core.FlexBitmap;
	
	public class MyTextRenderer extends ChartLabel{
		
		// The title is renderered in a TextField.
		//private var myText:TextField; 
		
		public function MyTextRenderer() {
			super();            
		}       
		
		override protected function createChildren():void{ 
			super.createChildren();
			//myText = new TextField();
		}
		
		override protected function updateDisplayList(w:Number, h:Number):void {
			
			//this.data = null;
			super.updateDisplayList(w, h);
			this.x += w;
			this.y += h;
			this.rotationZ = 180;
			this.data = null;
			// The data property provides access to the title text.
			//			if(data.hasOwnProperty('text')) {
			//				myText.text = data.text;
			//			} else {
			//				myText.text = data.toString();
			//			}
			//this.setStyle("textAlign","center");
			
			//			var g:Graphics = graphics; 
			//			g.clear();  
			//			var m:Matrix = new Matrix();
			//			m.createGradientBox(w+100,h,0,0,0);
			//			g.beginGradientFill(GradientType.LINEAR,[0x3B3A3A,0x222121],
			//				[.2,.4],[1,255],m,null,null,0);
			//			g.drawRect(-50,0,w+100,h);
			//			g.endFill(); 
		}
	}
}