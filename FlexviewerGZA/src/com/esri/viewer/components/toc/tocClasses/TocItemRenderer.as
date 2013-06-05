////////////////////////////////////////////////////////////////////////////////
//
// Copyright (c) 2010 ESRI
//
// All rights reserved under the copyright laws of the United States.
// You may freely redistribute and use this software, with or
// without modification, provided you include the original copyright
// and use restrictions.  See use restrictions in the file:
// <install location>/License.txt
//
////////////////////////////////////////////////////////////////////////////////
package com.esri.viewer.components.toc.tocClasses
{

import com.esri.ags.Map;
import com.esri.ags.events.MapEvent;
import com.esri.ags.layers.Layer;
import com.esri.ags.layers.TiledMapServiceLayer;
import com.esri.viewer.components.toc.TOC;
import com.esri.viewer.components.toc.controls.CheckBoxIndeterminate;

import flash.events.MouseEvent;

import mx.controls.Button;
import mx.controls.Image;
import mx.controls.treeClasses.TreeItemRenderer;
import mx.controls.treeClasses.TreeListData;

import spark.components.Button;

/**
 * A custom tree item renderer for a map Table of Contents.
 */
public class TocItemRenderer extends TreeItemRenderer
{
    // Renderer UI components
    private var _checkbox:CheckBoxIndeterminate;
	private var _closebutton:Image;
	private var _hasCloseButton:Boolean;
	
    // UI component spacing
    private static const PRE_CHECKBOX_GAP:Number = 5;

    private static const POST_CHECKBOX_GAP:Number = 4;

    /**
     * @private
     */
    override protected function createChildren():void
    {
        super.createChildren();

        // Create a checkbox child component for toggling layer visibility.
        if (!_checkbox)
        {
            _checkbox = new CheckBoxIndeterminate();
            _checkbox.addEventListener(MouseEvent.CLICK, onCheckBoxClick);
            _checkbox.addEventListener(MouseEvent.DOUBLE_CLICK, onCheckBoxDoubleClick);
            _checkbox.addEventListener(MouseEvent.MOUSE_DOWN, onCheckBoxMouseDown);
            _checkbox.addEventListener(MouseEvent.MOUSE_UP, onCheckBoxMouseUp);
            addChild(_checkbox);
        }
	
		if(!_closebutton)
		{
			_closebutton = new mx.controls.Image();
			_closebutton.source="assets/images/w_close.png";
			_closebutton.buttonMode=true;
			_closebutton.smoothBitmapContent=true;
			_closebutton.useHandCursor=true;
			_closebutton.addEventListener(MouseEvent.CLICK, onCloseButtonClick);
			_closebutton.addEventListener(MouseEvent.ROLL_OVER, onCloseBtnRollOver);
			_closebutton.addEventListener(MouseEvent.ROLL_OUT, onCloseBtnRollOut);
			addChild(_closebutton);
		}
		
		
    }

    /**
     * @private
	 * 2011-8-30
	 * linxianhui
	 * 展开不显示父图层checkbox（不然会有bug）
     */
    override protected function commitProperties():void
    {
        super.commitProperties();

        if (data is TocItem)
        {
            var item:TocItem = TocItem(data);
			//始终将子图层visible设为true
			if(item.isGroupLayer())
			{
				var childItem:TocItem = TocItem(item.children.getItemAt(0));
				childItem.setVisible(true,true);
			}
            // Set the checkbox state
            _checkbox.indeterminate = item.indeterminate;
            // The indeterminate state has visual priority over the selected state
            //_checkbox.selected = item.visible && !item.indeterminate;
			_checkbox.selected = item.visible;
			
			//若存在父图层，用indeterminate作为显示checkbox的一个必要条件
			//若打开子图层，不显示父图层很子图层的checkbox
			if(item.parent != null)
			{
				item.indeterminate = true;   //子图层
				item.parent.indeterminate = true;//父图层
				var toc:TOC = this.owner as TOC;
				toc.validateDisplayList();					//刷新toc
			}
			
            // Hide the checkbox for child items of tiled map services
            var checkboxVisible:Boolean = true;
            if (isTiledLayerChild(item))
            {
                checkboxVisible = false;
            }
            _checkbox.visible = checkboxVisible && !item.indeterminate;
			item.indeterminate = false;						//重新改回false
			
            // Apply a bold label style to root nodes
            if (item.isTopLevel())
            {
                setStyle("fontWeight", "bold");
            }
            else
            {
                setStyle("fontWeight", "normal");
            }
        }
    }
	


    /**
     * @private
     */
    override protected function measure():void
    {
        super.measure();

        // Add space for the checkbox and gaps
        if (isNaN(explicitWidth) && !isNaN(measuredWidth))
        {
            var w:Number = measuredWidth;
            w += _checkbox.measuredWidth;
            w += PRE_CHECKBOX_GAP + POST_CHECKBOX_GAP;
            measuredWidth = w;
        }
    }

    /**
     * @private
     */
    override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void
    {
        super.updateDisplayList(unscaledWidth, unscaledHeight);

		
        var startx:Number = data ? TreeListData(listData).indent : 0;
        if (icon)
        {
            startx = icon.x;
        }
        else if (disclosureIcon)
        {
            startx = disclosureIcon.x + disclosureIcon.width;
        }
        startx += PRE_CHECKBOX_GAP;

        // Position the checkbox between the disclosure icon and the item icon
        _checkbox.x = startx;
        _checkbox.setActualSize(_checkbox.measuredWidth, _checkbox.measuredHeight);
        _checkbox.y = (unscaledHeight - _checkbox.height) / 2;
        startx = _checkbox.x + _checkbox.width + POST_CHECKBOX_GAP;

        if (icon)
        {
            icon.x = startx;
            startx = icon.x + icon.width;
        }

        label.x = startx;
        label.setActualSize(unscaledWidth - startx, measuredHeight);
		
		if(startx <50 && label.text.length>10)
		{
			_closebutton.x = this.width - 30;
			_closebutton.setActualSize(20, 20);
//			_closebutton.y = (unscaledHeight - _checkbox.measuredHeight) / 2;
		}
		else
		{
			//底图不显示按钮
			//子图层不显示能否关闭~
			_closebutton.visible = false;
			_closebutton.enabled = false;
		}

    }

    /**
     * Whether the specified TOC item is a child of a tiled map service layer.
     */
    private function isTiledLayerChild(item:TocItem):Boolean
    {
        while (item)
        {
            item = item.parent;
            if (item is TocMapLayerItem)
            {
                if (TocMapLayerItem(item).layer is TiledMapServiceLayer)
                {
                    return true;
                }
            }
        }
        return false;
    }

	
	private function onCloseButtonClick(event:MouseEvent):void
	{
		if (data is TocItem)
		{
			var item:TocItem = data as TocItem;
			var parent:TOC = this.owner as TOC;
			if(parent)
			{
				var lyr:Layer = parent.map.getLayer(item.label);
				parent.map.removeLayer(lyr);
			}
		}
	}
	
	private function onCloseBtnRollOver(event:MouseEvent):void
	{

	}
	
	private function onCloseBtnRollOut(event:MouseEvent):void
	{

	}
	
    /**
     * Updates the visible property of the underlying TOC item.
     */
    private function onCheckBoxClick(event:MouseEvent):void
    {


        if (data is TocItem)
        {
            var item:TocItem = TocItem(data);
            item.visible = _checkbox.selected;

			var parent:TOC = this.owner as TOC;
			if(parent)
			{
				var lryOrder:int =0;
				for (;lryOrder < parent.map.layerIds.length; lryOrder++)
				{
					if(item.label == parent.map.layerIds[lryOrder].toString())
						break;
				}

				parent.map.reorderLayer(item.label, lryOrder);
			}
        }
    }

    private function onCheckBoxDoubleClick(event:MouseEvent):void
    {
		
    }

    private function onCheckBoxMouseDown(event:MouseEvent):void
    {

    }

    private function onCheckBoxMouseUp(event:MouseEvent):void
    {

    }
}

}
