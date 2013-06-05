package widgets.HeaderController
{
	import mx.core.ClassFactory;
	
	import spark.components.DataGroup;

	// these events bubble up from the WidgetListItemRenderer
	[Event(name="headerListItemClick", type="flash.events.Event")]
	public class HeaderListDataGroup extends DataGroup
	{
		public function HeaderListDataGroup()
		{
			super();
			
			this.itemRenderer = new ClassFactory(HeaderListItemRenderer);
		}
	}
}