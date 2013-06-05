///////////////////////////////////////////////////////////////////////////
//ProductsItemDataGroup.as
//路由不同的产品功能视图
//根据HeaderItem的url返回不同的类
//
//林贤辉
//2013-03-22
///////////////////////////////////////////////////////////////////////////
package widgets.Products
{
	import mx.core.ClassFactory;
	
	import spark.components.DataGroup;
	
	import widgets.HeaderController.HeaderItem;
	import widgets.Products.ArgoSite.ProductArgoSite;
	import widgets.Products.FxZd.ProductBchl;
	import widgets.Products.FxZd.ProductHhc;
	import widgets.Products.FxZd.ProductZac;
	import widgets.Products.FxZd.ProductZcdw;
	import widgets.Products.NumericalPrediction.ProductCu;
	import widgets.Products.NumericalPrediction.ProductReAlys;
	import widgets.Products.NumericalPrediction.ProductTcTd;
	import widgets.Products.NumericalPrediction.ProductWave;
	import widgets.Products.NumericalPrediction.ProductWind;
	import widgets.Products.Typhoon.ProductTyphoon;
	
	public class ProductsItemDataGroup extends DataGroup
	{
		public function ProductsItemDataGroup()
		{
			super();
			
			this.itemRendererFunction = rendererFunction;
		}
		
		private function rendererFunction(item:HeaderItem):ClassFactory
		{
			switch (item.url)
			{
				case "typhoon":
					return new ClassFactory(ProductTyphoon);
				case "argoSite":
					return new ClassFactory(ProductArgoSite);
				case "wind":
					return new ClassFactory(ProductWind);
				case "wave":
					return new ClassFactory(ProductWave);
				case "cu":
					return new ClassFactory(ProductCu);
				case "tctd":
					return new ClassFactory(ProductTcTd);
				case "realys":
					return new ClassFactory(ProductReAlys);
				case "bchl":
					return new ClassFactory(ProductBchl);
				case "hhc":
					return new ClassFactory(ProductHhc);
				case "zac":
					return new ClassFactory(ProductZac);
				case "zcdw":
					return new ClassFactory(ProductZcdw);
				default:
					return null;
			}
		}
	}
}