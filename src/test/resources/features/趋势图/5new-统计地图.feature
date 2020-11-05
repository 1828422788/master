@all @trend @createTrendStatMap @createTrend
Feature: 趋势图新建_统计地图

  Background:
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page

  Scenario Outline: statistical_map
    When I set the parameter "SearchInput" with value "<spl>"
    And I wait for "2000" millsecond
    And I click the "SearchButton" button under some element
    And I wait for "2000" millsecond
    And I click the "SearchButton" button under some element
    And I wait for "40000" millsecond
    And I wait for "Loading" will be invisible
    And I wait for "Header" will be visible
    And I click the "NextButton" button under some element

    And I wait for "Type" will be visible
    And I click the "Type" button
    And I click the "Map" button
    And I click the "<chartType>" button

    And I click the "Type" button
    And I wait for "StatisticalChart" will be visible
    And I drag the scroll bar to the element "StatisticalChart"
    And I wait for "3000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_<caseNum>"
#    And I compare source image "actual/<chartType>_<caseNum>" with target image "expect/<chartType>_<caseNum>"
    Then I click the "NextButton" button under some element

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "NextButton" button under some element
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |chartType      |caseNum  |   spl   |
      |Statisticalmap | 2098    | starttime=\"now/d\" endtime=\"now/d+24h\" tag:vendors_461 \| geostats latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude count() as cnt |
      |Statisticalmap | 2797    | starttime=\"now/d\" endtime=\"now/d+24h\" tag:vendors_461 \| geostats binspanlat=22.5 binspanlat=45.0 latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude maxzoomlevel=3 sum(vendors.Weight)  by vendors.VendorStateProvince|

  Scenario Outline: statistical_map_parameters
    When I set the parameter "SearchInput" with value "<spl>"
    And I wait for "2000" millsecond
    And I click the "SearchButton" button under some element
    And I wait for "2000" millsecond
    And I click the "SearchButton" button under some element
    And I wait for "40000" millsecond
    And I wait for "Loading" will be invisible
    And I wait for "Header" will be visible
    And I click the "NextButton" button under some element

    And I wait for "Type" will be visible
    And I click the "Type" button
    And I click the "Map" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I click the "General" button
    And I set the parameter "Transparency" with value "<tranparencyValue>"
    And I set the parameter "MinRadius" with value "<minRadiusValue>"
    And I set the parameter "MaxRadius" with value "<maxRadiusValue>"
    And I click the "Tile" button
    And I set the parameter "CenterLatitude" with value "35"
    And I set the parameter "CenterLongitude" with value "35"
    And I set the parameter "ZoomLevel" with value "2"
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "StatisticalChart" will be visible
    And I drag the scroll bar to the element "StatisticalChart"
    And I wait for "3000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_<caseNum>"
#    And I compare source image "actual/<chartType>_<caseNum>" with target image "expect/<chartType>_<caseNum>"
    Then I click the "NextButton" button under some element

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "NextButton" button under some element
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |chartType      |   tranparencyValue  | minRadiusValue | maxRadiusValue  | caseNum        |   spl   |
      |Statisticalmap |        0.5          |     10         |      50         |  2098_param    | starttime=\"now/d\" endtime=\"now/d+24h\" tag:vendors_461 \| geostats latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude count() as cnt |
      |Statisticalmap |        0.5          |     10         |      50         |  2797_param    | starttime=\"now/d\" endtime=\"now/d+24h\" tag:vendors_461 \| geostats binspanlat=22.5 binspanlat=45.0 latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude maxzoomlevel=3 sum(vendors.Weight)  by vendors.VendorStateProvince|

@onlinemap
  Scenario Outline: statistical_map_online
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424* | geostats latfield=apache.geo.latitude longfield=apache.geo.longitude count() avg(apache.resp_len) min(apache.resp_len)"
    And I wait for "2000" millsecond
    And I click the "SearchButton" button under some element
    And I wait for "Loading" will be invisible
    And I wait for "Header" will be visible
    And I click the "NextButton" button under some element

    And I wait for "Type" will be visible
    And I click the "Type" button
    And I click the "Map" button
    And I click the "<chartType>" button

    And I click the "Settings" button
    And I click the "OnlineMap" button
    And I click the "Tile" button
    And I set the parameter "ZoomLevel" with value "4"
    And I set the parameter "MapName" with value "<mapName>"
    And I set the parameter "MapURL" with value "<url>"
    And I set the parameter "Subdomains" with value "abc"
    And I set the parameter "MapOpacity" with value "<mapOpacity>"
    And I click the "Value" button
    And I choose the "min(apache.resp_len)" from the "DataCircleLayer"
    And I choose the "count()" from the "HeatmapLayer"
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "StatisticalChart" will be visible
    And I drag the scroll bar to the element "StatisticalChart"
    And I wait for "15000" millsecond
    And take part of "StatisticalChart" with name "actual/online/<chartType>_<mapName>"
#    And I compare source image "actual/online/<chartType>_<mapName>" with target image "expect/online/<chartType>_<mapName>"
    Then I click the "NextButton" button under some element

    When I set the parameter "NameInput" with value "<chartType>_<mapName>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "NextButton" button under some element
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |chartType      | mapName  | mapOpacity   |  url |
      |Statisticalmap | ArcGIS   |   0.8        | https://map.geoq.cn/ArcGIS/rest/services/ChinaOnlineCommunity/MapServer/tile/{z}/{y}/{x} |
      |Statisticalmap | Amap     |   0.9        | http://wprd01.is.autonavi.com/appmaptile?x={x}&y={y}&z={z}&lang=zh_cn&size=1&scl=1&style=7|
      |Statisticalmap | OSM      |   1          | http://{s}.tile.osm.org/{z}/{x}/{y}.png                                                   |
      |Statisticalmap | Gtimg    |   0.6        | http://rt0.map.gtimg.com/realtimerender?z={z}&x={x}&y={-y}&type=vector&style=0|
      |Statisticalmap | Google   |   1          | http://mt2.google.cn/vt/lyrs=m&scale=2&hl=zh-CN&gl=cn&x={x}&y={y}&z={z}|