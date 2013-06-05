package widgets.CommonUtil
{
	import flash.events.Event;
	import flash.events.FocusEvent;
	import flash.text.TextLineMetrics;
	
	import mx.containers.HBox;
	import mx.controls.NumericStepper;
	import mx.controls.Text;
	import mx.controls.TextInput;
	import mx.core.UITextField;
	import mx.core.mx_internal;
	import mx.events.FlexEvent;
	import mx.graphics.Stroke;
	import mx.managers.IFocusManager;

	use namespace mx_internal;
	
	[Event(name="change",type="flash.events.Event")]
	[Event(name="hoursChange",type="flash.events.Event")]
	[Event(name="minutesChange",type="flash.events.Event")]
	[Event(name="secondsChange",type="flash.events.Event")]
	public class TimeInput extends NumericStepper
	{
		public function TimeInput()
		{
			super();
			this.maxChars=2;
			this.minimum=0;
			this.maximum=23;
			this.stepSize=1;
			this.addEventListener(FlexEvent.VALUE_COMMIT,valueCommandHandler);
		}
		protected  var inputBox:HBox;   
		protected  var sText1:Text;   
		protected  var sText2:Text;   
		protected  var hoursInputField:TextInput;
		protected  var minutesInputField:TextInput;
		protected  var secondsInputField:TextInput;
		protected var _hours:Number = 0;
		protected var _minutes:Number = 0;
		protected var _seconds:Number = 0;
		protected var _timeDate:Date;
		private var _enabled:Boolean=true;
		
		override protected function createChildren():void
		{
			super.createChildren();
			
			
			if(!inputBox)
			{
				
				inputBox=new HBox();
				addChild(inputBox);
				
				inputBox.setStyle("paddingLeft",0);
				inputBox.setStyle("paddingRight",0);
				inputBox.setStyle("paddingTop",0);
				inputBox.setStyle("paddingBottom",0);
				inputBox.setStyle("horizontalGap",0);
				inputBox.setStyle("backgroundAlpha","0");
//				inputBox.setStyle("borderStyle","none");
				inputBox.setStyle("verticalAlign","middle");
			}
			
			var widestNumber:Number=61;
			var lineMetrics:TextLineMetrics = measureText(widestNumber.toString());
			var textWidth:Number = lineMetrics.width + UITextField.TEXT_WIDTH_PADDING + 4;
			if (!hoursInputField)
			{
				hoursInputField = new TextInput();   
				hoursInputField.focusEnabled = false;
				hoursInputField.styleName = this;
				hoursInputField.width=textWidth;         
				hoursInputField.restrict = "0-9";
				hoursInputField.maxChars = 2;
				hoursInputField.text = formatNumberWithChar(_hours,2,"0");
				hoursInputField.setStyle("textAlign","right");
				hoursInputField.setStyle("borderStyle","none");   
				hoursInputField.setStyle("paddingLeft",0);
				hoursInputField.setStyle("paddingRight",0);
				hoursInputField.setStyle("paddingTop",0);
				hoursInputField.setStyle("paddingBottom",0);
				hoursInputField.setStyle("horizontalGap",0);  
				hoursInputField.addEventListener(FocusEvent.FOCUS_IN,inputField_focusInHandler);
				hoursInputField.addEventListener(FocusEvent.FOCUS_OUT, inputField_focusOutHandler);
				
				inputBox.addChild(hoursInputField);
			}
			inputField=hoursInputField;
			if(!sText1){
				sText1=new Text();
				sText1.text=":";
				sText1.setStyle("textAlign","center");
				sText1.setStyle("paddingLeft",0);
				sText1.setStyle("paddingRight",0);
				sText1.setStyle("paddingTop",0);
				sText1.setStyle("paddingBottom",0);
				sText1.setStyle("horizontalGap",0);
				inputBox.addChild(sText1);
			}
			if (!minutesInputField)
			{
				minutesInputField = new TextInput();  
				minutesInputField.focusEnabled = false;
				minutesInputField.styleName = this;
				minutesInputField.width=textWidth;
				minutesInputField.restrict = "0-9";
				minutesInputField.maxChars = 2;
				minutesInputField.text = formatNumberWithChar(_minutes,2,"0");
				minutesInputField.setStyle("textAlign","left");
				minutesInputField.setStyle("borderStyle","none"); 
				minutesInputField.setStyle("paddingLeft",0);
				minutesInputField.setStyle("paddingRight",0);
				minutesInputField.setStyle("paddingTop",0);
				minutesInputField.setStyle("paddingBottom",0);
				minutesInputField.setStyle("horizontalGap",0);
				minutesInputField.addEventListener(FocusEvent.FOCUS_IN,inputField_focusInHandler);
				minutesInputField.addEventListener(FocusEvent.FOCUS_OUT, inputField_focusOutHandler);
				
				inputBox.addChild(minutesInputField);
			}
			if(!sText2){
				sText2=new Text();
				sText2.text=":";
				sText2.setStyle("textAlign","center");
				sText2.setStyle("paddingLeft",0);
				sText2.setStyle("paddingRight",0);
				sText2.setStyle("paddingTop",0);
				sText2.setStyle("paddingBottom",0);
				sText2.setStyle("horizontalGap",0);
				inputBox.addChild(sText2);
			}
			if (!secondsInputField)
			{
				secondsInputField = new TextInput();  
				secondsInputField.focusEnabled = false;
				secondsInputField.styleName = this;
				secondsInputField.width=textWidth;
				secondsInputField.restrict = "0-9";
				secondsInputField.maxChars = 2;
				secondsInputField.text = formatNumberWithChar(_minutes,2,"0");
				secondsInputField.setStyle("textAlign","left");
				secondsInputField.setStyle("borderStyle","none"); 
				secondsInputField.setStyle("paddingLeft",0);
				secondsInputField.setStyle("paddingRight",0);
				secondsInputField.setStyle("paddingTop",0);
				secondsInputField.setStyle("paddingBottom",0);
				secondsInputField.setStyle("horizontalGap",0);
				secondsInputField.addEventListener(FocusEvent.FOCUS_IN,inputField_focusInHandler);
				secondsInputField.addEventListener(FocusEvent.FOCUS_OUT, inputField_focusOutHandler);
				
				inputBox.addChild(secondsInputField);
			}
			
			
		}
		override protected function measure():void
		{
			super.measure();
			var inputBoxHeight:Number = inputBox.getExplicitOrMeasuredHeight();
			var buttonHeight:Number = prevButton.getExplicitOrMeasuredHeight() +
				nextButton.getExplicitOrMeasuredHeight();
			var h:Number = Math.max(inputBoxHeight, buttonHeight);
			h = Math.max(DEFAULT_MEASURED_MIN_HEIGHT, h);
			var inputBoxWidth:Number = inputBox.getExplicitOrMeasuredWidth();
			var buttonWidth:Number = Math.max(prevButton.getExplicitOrMeasuredWidth(),
				nextButton.getExplicitOrMeasuredWidth());
			var w:Number = inputBoxWidth + buttonWidth;
			w = Math.max(DEFAULT_MEASURED_MIN_WIDTH, w);
			measuredMinWidth = DEFAULT_MEASURED_MIN_WIDTH;
			measuredMinHeight = DEFAULT_MEASURED_MIN_HEIGHT;
			measuredWidth = w;
			measuredHeight = h;
		}
		override protected function updateDisplayList(unscaledWidth:Number,
													  unscaledHeight:Number):void
		{
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			
			var w:Number = nextButton.getExplicitOrMeasuredWidth();
			var h:Number = Math.round(unscaledHeight / 2);
			var h2:Number = unscaledHeight - h;
			nextButton.x = unscaledWidth - w;
			nextButton.y = 0;
			nextButton.setActualSize(w, h2);
			
			prevButton.x = unscaledWidth - w;
			prevButton.y = unscaledHeight - h;
			prevButton.setActualSize(w, h);
			var inputBoxHeight:Number = inputBox.getExplicitOrMeasuredHeight();
			var inputBoxWidth:Number = inputBox.getExplicitOrMeasuredWidth();
			inputBox.setActualSize(inputBoxWidth,inputBoxHeight);
		}
		private function inputField_focusInHandler(event:FocusEvent):void
		{
			
			inputField=event.currentTarget as TextInput;
			if(inputField == hoursInputField){
				this.value=parseInt(inputField.text);
				this.minimum=0;
				this.maximum=23;
			}else if(inputField == minutesInputField){
				this.value=parseInt(inputField.text);
				this.minimum=0;
				this.maximum=59;
			}else{
				this.value=parseInt(inputField.text);
				this.minimum=0;
				this.maximum=59;
			}
			
			focusInHandler(event);
			dispatchEvent(new FocusEvent(event.type, false, false,
				event.relatedObject,
				event.shiftKey, event.keyCode));
		}
		private function inputField_focusOutHandler(event:FocusEvent):void
		{

			
			focusOutHandler(event);

			dispatchEvent(new FocusEvent(event.type, false, false,
				event.relatedObject,
				event.shiftKey,event.keyCode));
			

		}
		
		private function valueCommandHandler(event:FlexEvent):void{
			inputField.text=formatNumberWithChar(value,2,"0");
			if(inputField==hoursInputField){
				this.hours=value;
			}else if(inputField==minutesInputField){
				this.minutes=value;
			}else{
				this.seconds=value;
			}
		}
		override protected function focusInHandler(event:FocusEvent):void
		{
			super.focusInHandler(event);
			var fm:IFocusManager = focusManager;
			if (fm)
				fm.defaultButtonEnabled = false;
		}
		override protected function focusOutHandler(event:FocusEvent):void
		{
			var FieldMarker:int = -1
			var textMarker:String = inputField.text;
			
			if(inputField == hoursInputField){
				FieldMarker=0;
			}else if(inputField == minutesInputField){
				FieldMarker=1
			}else{
				FieldMarker=2
			}
			
			super.focusOutHandler(event);
			
			var num:Number = new Number(textMarker);
			
			switch(FieldMarker)
			{
				case 0:
					hoursInputField.text = formatNumberWithChar(num, 2, "0");
					break;
				case 1:
					minutesInputField.text = formatNumberWithChar(num, 2, "0");
					break;
				case 2:
					secondsInputField.text = formatNumberWithChar(num, 2, "0");
					break;
				default:
					break;
				
			}
		}
		
		[Bindable]
		public function get hours():Number
		{
			return _hours;
		}
		
		[Inspectable(defaultValue=0,category="Time",name="Hours")]
		public function set hours(val:Number):void
		{
			if (val >= 0 || val <= 24)
			{
				this._hours = val;
				if(inputField==hoursInputField && val!=value)
					value=val;
				else{
					hoursInputField.text=formatNumberWithChar(val,2,"0");
				}
			} 
			
			dispatchEvent(new Event("hoursChange"));
			dispatchEvent(new Event("change"));
		}
		
		[Bindable]
		public function get minutes():Number
		{
			return _minutes;
		}
		
		[Inspectable(defaultValue=30,category="Time",name="Minutes")]
		public function set minutes(val:Number):void
		{
			if (val >= 0 || val <= 59)
			{
				this._minutes = val;
				if(inputField==minutesInputField && val!=value)
					value=val;
				else{
					minutesInputField.text=formatNumberWithChar(val,2,"0");
				}
			}
			
			dispatchEvent(new Event("minutesChange"));
			dispatchEvent(new Event("change"));
		}
		
		[Bindable]
		public function get seconds():Number
		{
			return _seconds;
		}
		
		[Inspectable(defaultValue=30,category="Time",name="Seconds")]
		public function set seconds(val:Number):void
		{
			if (val >= 0 || val <= 59)
			{
				this._seconds = val;
				if(inputField==secondsInputField && val!=value)
					value=val;
				else{
					secondsInputField.text=formatNumberWithChar(val,2,"0");
				}
			}
			
			dispatchEvent(new Event("secondsChange"));
			dispatchEvent(new Event("change"));
		}
		
		public function get Time():Date{
			var date:Date=new Date();
			date.hours=_hours;
			date.minutes=_minutes;
			date.seconds=_seconds;
			return date;
		}
		public function set Time(time:Date):void{
			this._timeDate=time;
			this.hours=time.hours;
			this.minutes=time.minutes;
			this.seconds=time.seconds;
		}
		
		override public function set enabled(value:Boolean):void
		{
			_enabled = value;
			if(hoursInputField){
				hoursInputField.enabled=value;
				minutesInputField.enabled=value;  
				secondsInputField.enabled=value;
				sText1.enabled=value;
				sText2.enabled=value;
				nextButton.enabled=value;
				prevButton.enabled=value;
			}
			
		}       
		override public function get enabled():Boolean
		{
			return _enabled;
		} 
		
		public static function formatNumberWithChar(value:Number,length:int=2,pref:String="0"):String
		{
			var str:String=new String(value);
			var len:int=str.length;
			
			if(len>length)
				return str.substr(len-length, length);
			else
			{
				var n:int=length-len;
				for(var i:int=0;i<n;i++)
				{
					str=pref+str;
				}
				return str;
			}
		}
	}
}
