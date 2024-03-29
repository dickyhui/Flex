///////////////////////////////////////////////////////////////////////////
// Copyright (c) 2010-2011 Esri. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
///////////////////////////////////////////////////////////////////////////
package widgets.HeaderController
{
	
	import mx.core.ClassFactory;
	
	import spark.components.DataGroup;
	
	// these events bubble up from the WidgetItemRenderer and GroupWidgetItemRenderer
	[Event(name="headerItemClick", type="flash.events.Event")]
	[Event(name="headerItemMouseOver", type="flash.events.Event")]
	[Event(name="headerItemMouseOut", type="flash.events.Event")]
	
	public class HeaderItemDataGroup extends DataGroup
	{
		public function HeaderItemDataGroup()
		{
			super();
			
			this.itemRendererFunction = rendererFunction;
		}
		
		private function rendererFunction(item:Object):ClassFactory
		{
			if (item.isGroup)
			{
				return new ClassFactory();
			}
			else
			{
				return new ClassFactory(HeaderItemDataGroupRenderer);
			}
		}
	}
	
}
