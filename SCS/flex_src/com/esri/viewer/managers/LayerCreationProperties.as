///////////////////////////////////////////////////////////////////////////
// Copyright (c) 2012 Esri. All Rights Reserved.
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
package com.esri.viewer.managers
{

import com.esri.ags.clusterers.ESRIClusterer;

public class LayerCreationProperties
{
    public var alpha:Number;
    public var autoRefresh:Number;
    public var bandIds:String;
    public var bingMapKey:String;
    public var clusterer:ESRIClusterer;
    public var culture:String;
    public var definitionExpression:String;
    public var displayLevels:String;
    public var gdbVersion:String;
    public var imageFormat:String;
    public var label:String;
    public var layerId:String;
    public var maxAllowableOffset:Number;
    public var maxImageHeight:Number;
    public var maxImageWidth:Number;
    public var minScale:Number;
    public var maxScale:Number;
    public var mode:String;
    public var noData:Number;
    public var password:String;
    public var proxyUrl:String;
    public var serviceHost:String;
    public var serviceName:String;
    public var serviceMode:String;
    public var serviceURL:String;
    public var skipGetCapabilities:String;
    public var style:String;
    public var token:String;
    public var type:String;
    public var url:String;
    public var useAMF:String;
    public var useMapTime:Boolean;
    public var useProxy:Boolean;
    public var username:String;
    public var version:String;
    public var visible:Boolean;
    public var visibleLayers:String;
    public var wkid:Number;

    public static function fromLayerObject(layerObject:Object):LayerCreationProperties
    {
        var creationProps:LayerCreationProperties = new LayerCreationProperties();

        creationProps.alpha = Number(layerObject.alpha);
        creationProps.autoRefresh = Number(layerObject.autoRefresh);
        creationProps.bandIds = layerObject.bandIds;
        creationProps.bingMapKey = layerObject.key;
        creationProps.clusterer = layerObject.clusterer;
        creationProps.culture = layerObject.culture;
        creationProps.definitionExpression = layerObject.definitionExpression;
        creationProps.displayLevels = layerObject.displayLevels;
        creationProps.gdbVersion = layerObject.gdbVersion;
        creationProps.imageFormat = layerObject.imageFormat;
        creationProps.label = layerObject.label;
        creationProps.layerId = layerObject.layerId;
        creationProps.maxAllowableOffset = layerObject.maxAllowableOffset;
        creationProps.maxImageHeight = layerObject.maxImageHeight;
        creationProps.maxImageWidth = layerObject.maxImageWidth;
        creationProps.minScale = layerObject.minScale;
        creationProps.maxScale = layerObject.maxScale;
        creationProps.mode = layerObject.mode;
        creationProps.noData = Number(layerObject.noData);
        creationProps.password = layerObject.password;
        creationProps.proxyUrl = layerObject.proxyUrl;
        creationProps.serviceHost = layerObject.serviceHost;
        creationProps.serviceName = layerObject.serviceName;
        creationProps.serviceMode = layerObject.serviceMode;
        creationProps.serviceURL = layerObject.serviceURL;
        creationProps.skipGetCapabilities = layerObject.skipGetCapabilities;
        creationProps.style = layerObject.style;
        creationProps.token = layerObject.token;
        creationProps.type = layerObject.type;
        creationProps.url = layerObject.url;
        creationProps.useAMF = layerObject.useAMF;
        creationProps.useMapTime = layerObject.useMapTime;
        creationProps.useProxy = layerObject.useProxy;
        creationProps.username = layerObject.username;
        creationProps.version = layerObject.version;
        creationProps.visible = layerObject.visible;
        creationProps.visibleLayers = layerObject.visibleLayers;
        creationProps.wkid = layerObject.wkid;

        return creationProps;
    }
}
}
