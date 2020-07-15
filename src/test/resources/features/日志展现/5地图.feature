@all @logDisplay @logDisplayMap
Feature: 日志展现_地图

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"

  Scenario Outline:heatmap(RZY-1229)
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Map" button
    And I click the "<chartType>" button

    And I click the "Type" button
    And I wait for "Chart" will be visible
#    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/5地图/<caseNum>_<chartType>"
    Then I compare source image "actual/高级搜索视图/5地图/<caseNum>_<chartType>" with target image "expect/高级搜索视图/5地图/<caseNum>_<chartType>"

    Examples:
      |   chartType   |   caseNum  |   spl   |
      |   Heatmap     |    1229    |  starttime=\"now/d-24h\" endtime=\"now/d\" tag:sample04061424_chart \| stats count() by apache.geo.city |


  Scenario Outline: attackMap(RZY-2302)
    When I set the parameter "SearchInput" with value "starttime=\"now/d-24h\" endtime=\"now/d\" tag:sample04061424_chart \| parse field=apache.request_query \"\^gw_address=(\?<gw_address>\\d+\\.\\d+\\.\\d+\\.\\d+)\" \| stats count() as cnt, min(apache.geo.latitude) as client_lat, min(apache.geo.longitude) as client_lon by apache.clientip, gw_address \| eval gw_lat=39.5427 \| eval gw_lon=116.2317"
    And I click the "SearchButton" button
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Map" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I click the "Source" button
    And I choose the "<source>" from the "FieldValue" in config
    And I choose the "<sourceLon>" from the "FieldLongitude" in config
    And I choose the "<sourceLat>" from the "FieldLatitude" in config
    And I click the "Target" button
    And I choose the "<target>" from the "FieldValue" in config
    And I choose the "<targetLon>" from the "FieldLongitude" in config
    And I choose the "<targetLat>" from the "FieldLatitude" in config
    And I click the "Weight" button
    And I choose the "<weight>" from the "FieldValue" in config
    And I click the "Region" button
    And I click the "Select<regionBut>" button
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "Chart" will be visible
#    And I drag the scroll bar to the element "Chart"
    And I wait for "3000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/5地图/<caseNum>_<regionBut>_<chartType>"
    Then I compare source image "actual/高级搜索视图/5地图/<caseNum>_<regionBut>_<chartType>" with target image "expect/高级搜索视图/5地图/<caseNum>_<regionBut>_<chartType>"

    Examples:
      |chartType|      source     |  sourceLon | sourceLat  | target     | targetLon | targetLat |  weight | regionBut |caseNum  |
      |Attackmap| apache.clientip | client_lon | client_lat | gw_address | gw_lon    |  gw_lat   |   cnt   |   World   | 2302    |
      |Attackmap| apache.clientip | client_lon | client_lat | gw_address | gw_lon    |  gw_lat   |   cnt   |   China   | 2302    |

  Scenario Outline: regionmap(RZY-2790)
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Map" button
    And I click the "<chartType>" button

    And I click the "Type" button
    And I wait for "Chart" will be visible
#    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/5地图/<caseNum>_<chartType>"
    Then I compare source image "actual/高级搜索视图/5地图/<caseNum>_<chartType>" with target image "expect/高级搜索视图/5地图/<caseNum>_<chartType>"

    Examples:
      |chartType|caseNum  |   spl   |
      |Regionmap| 2790    | starttime=\"now/d-24h\" endtime=\"now/d\" tag:sample04061424_chart \| stats count() by apache.geo.country, apache.geo.province, apache.geo.city |

  Scenario Outline: regionMap(RZY-2793,2794)
    When I set the parameter "SearchInput" with value "starttime=\"now/d-24h\" endtime=\"now/d\" <spl>"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Map" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I click the "Value" button
    And I choose the "<value>" from the "FieldValue" in config
    And I click the "Divide" button
    And I choose the "<divideField>" from the "FieldValue" in config
    And I click the "Region" button
    And I click the "Select<region>" button
    And I click the "GoingDown" button
    And I choose the "<provinceDrilldown>" from the "Province" in config
    And I choose the "<cityDrilldown>" from the "City" in config
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "Chart" will be visible
#    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/5地图/<caseNum>_<chartType>_<region>"
    Then I compare source image "actual/高级搜索视图/5地图/<caseNum>_<chartType>_<region>" with target image "expect/高级搜索视图/5地图/<caseNum>_<chartType>_<region>"

    Examples:
      |chartType|  value  | divideField         |  region | provinceDrilldown   | cityDrilldown   |caseNum  |   spl   |
      |Regionmap| count() | apache.geo.province |  China  | apache.geo.province | apache.geo.city | 2793    | tag:sample04061424_chart \| stats count() by apache.geo.country, apache.geo.province, apache.geo.city |
      |Regionmap| count() | apache.geo.province | Jiangsu | apache.geo.province | apache.geo.city | 2794    | tag:sample04061424_chart \| stats count() by apache.geo.city |

@maptest
  Scenario Outline: regionMap_click(RZY-2792)
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Map" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I click the "Value" button
    And I choose the "<value>" from the "FieldValue" in config
    And I click the "Divide" button
    And I choose the "<divideField>" from the "FieldValue" in config
    And I click the "Region" button
    And I click the "Select<region>" button
    And I click the "GoingDown" button
    And I choose the "<provinceDrilldown>" from the "Province" in config
    And I choose the "<cityDrilldown>" from the "City" in config
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "Chart" will be visible
#    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/5地图/<caseNum>_<chartType>/World"
    Then I compare source image "actual/高级搜索视图/5地图/<caseNum>_<chartType>/World" with target image "expect/高级搜索视图/5地图/<caseNum>_<chartType>/World"

    When I click the "CountryChina" button
    And I wait for "Chart" will be visible
#    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/5地图/<caseNum>_<chartType>/China"
    Then I compare source image "actual/高级搜索视图/5地图/<caseNum>_<chartType>/China" with target image "expect/高级搜索视图/5地图/<caseNum>_<chartType>/China"

    When I click the "ProvinceJiangsu" button
    And I wait for "Chart" will be visible
#    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/5地图/<caseNum>_<chartType>/Jiangsu"
    Then I compare source image "actual/高级搜索视图/5地图/<caseNum>_<chartType>/Jiangsu" with target image "expect/高级搜索视图/5地图/<caseNum>_<chartType>/Jiangsu"

    Examples:
      |chartType|  value  | divideField         |  region | provinceDrilldown   | cityDrilldown   |caseNum  |   spl   |
      |Regionmap| count() | apache.geo.country  |  World  | apache.geo.province | apache.geo.city | 2792    |starttime=\"now/d-24h\" endtime=\"now/d\" tag:sample04061424_chart \| stats count() by apache.geo.country, apache.geo.province, apache.geo.city |

  Scenario Outline: statMap(RZY-2795,2797)
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" <spl>"
    And I click the "SearchButton" button
    And I wait for "10000" millsecond
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Map" button
    And I click the "<chartType>" button

    And I click the "Type" button
    And I wait for "StatisticalChart" will be visible
#    And I drag the scroll bar to the element "StatisticalChart"
    And I wait for "3000" millsecond
    And take part of "StatisticalChart" with name "actual/高级搜索视图/5地图/<caseNum>_<chartType>"
#    Then I compare source image "actual/高级搜索视图/5地图/<caseNum>_<chartType>" with target image "expect/高级搜索视图/5地图/<caseNum>_<chartType>"

    Examples:
      |chartType      |caseNum  |   spl   |
      |Statisticalmap | 2795    |  tag:vendors_461 \| geostats latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude count() as cnt |
      |Statisticalmap | 2797    |  tag:vendors_461 \| geostats binspanlat=22.5 binspanlat=45.0 latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude maxzoomlevel=3 sum(vendors.Weight)  by vendors.VendorStateProvince |


  Scenario Outline: statMap(RZY-2796)
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "SearchButton" button
    And I wait for "10000" millsecond
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Map" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I click the "General" button
    And I set the parameter "Transparency" with value "<tranparencyValue>"
    And I set the parameter "MinRadius" with value "<minRadiusValue>"
    And I set the parameter "MaxRadius" with value "<maxRadiusValue>"
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "StatisticalChart" will be visible
#    And I drag the scroll bar to the element "StatisticalChart"
    And I wait for "3000" millsecond
    And take part of "StatisticalChart" with name "actual/高级搜索视图/5地图/<caseNum>_<chartType>"
#    Then I compare source image "actual/高级搜索视图/5地图/<caseNum>_<chartType>" with target image "expect/高级搜索视图/5地图/<caseNum>_<chartType>"

    Examples:
      |chartType      |   tranparencyValue  | minRadiusValue | maxRadiusValue  | caseNum  |   spl   |
      |Statisticalmap |        0.5          |     10         |      50         |  2796    | starttime=\"now/d\" endtime=\"now/d+24h\" tag:vendors_461 \| geostats latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude count() as cnt |

  Scenario Outline: regionmap(RZY-2790white)
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Map" button
    And I click the "<chartType>" button

    And I click the "Settings" button
    And I click the "Exhibition" button
    # Switch to white map
    And I click the "ShowBubbles" button
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "Chart" will be visible
#    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/5地图/<caseNum>_<chartType>"
    Then I compare source image "actual/高级搜索视图/5地图/<caseNum>_<chartType>" with target image "expect/高级搜索视图/5地图/<caseNum>_<chartType>"

    Examples:
      |chartType|caseNum        |   spl   |
      |Regionmap| 2790_white    | starttime=\"now/d-24h\" endtime=\"now/d\" tag:sample04061424_chart \| stats count() by apache.geo.country, apache.geo.province, apache.geo.city |

  Scenario Outline: regionMap(RZY-2793,2794white)
    When I set the parameter "SearchInput" with value "starttime=\"now/d-24h\" endtime=\"now/d\" <spl>"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Map" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I click the "Value" button
    And I choose the "<value>" from the "FieldValue" in config
    And I click the "Divide" button
    And I choose the "<divideField>" from the "FieldValue" in config
    And I click the "Region" button
    And I click the "Select<region>" button
    And I click the "Exhibition" button
    # Switch to white map
    And I click the "ShowBubbles" button
    And I click the "GoingDown" button
    And I choose the "<provinceDrilldown>" from the "Province" in config
    And I choose the "<cityDrilldown>" from the "City" in config
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "Chart" will be visible
#    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/5地图/<caseNum>_<chartType>_<region>"
    Then I compare source image "actual/高级搜索视图/5地图/<caseNum>_<chartType>_<region>" with target image "expect/高级搜索视图/5地图/<caseNum>_<chartType>_<region>"

    Examples:
      |chartType|  value  | divideField         |  region | provinceDrilldown   | cityDrilldown   |caseNum      |   spl   |
      |Regionmap| count() | apache.geo.province |  China  | apache.geo.province | apache.geo.city | 2793_white  | tag:sample04061424_chart \| stats count() by apache.geo.country, apache.geo.province, apache.geo.city |
      |Regionmap| count() | apache.geo.province | Jiangsu | apache.geo.province | apache.geo.city | 2794_white  | tag:sample04061424_chart \| stats count() by apache.geo.city |
  @maptest
  Scenario Outline: regionMap_click(RZY-2792_white)
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Map" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I click the "Value" button
    And I choose the "<value>" from the "FieldValue" in config
    And I click the "Divide" button
    And I choose the "<divideField>" from the "FieldValue" in config
    And I click the "Region" button
    And I click the "Select<region>" button
    And I click the "Exhibition" button
    # Switch to white map
    And I click the "ShowBubbles" button
    And I click the "GoingDown" button
    And I choose the "<provinceDrilldown>" from the "Province" in config
    And I choose the "<cityDrilldown>" from the "City" in config
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "Chart" will be visible
#    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/5地图/<caseNum>_<chartType>/World_white"
    Then I compare source image "actual/高级搜索视图/5地图/<caseNum>_<chartType>/World_white" with target image "expect/高级搜索视图/5地图/<caseNum>_<chartType>/World_white"

    When I click the "OpenChina" button
    And I wait for "Chart" will be visible
#    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/5地图/<caseNum>_<chartType>/China_white"
    Then I compare source image "actual/高级搜索视图/5地图/<caseNum>_<chartType>/China_white" with target image "expect/高级搜索视图/5地图/<caseNum>_<chartType>/China_white"

    When I click the "OpenJiangsu" button
    And I wait for "Chart" will be visible
#    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/5地图/<caseNum>_<chartType>/Jiangsu_white"
    Then I compare source image "actual/高级搜索视图/5地图/<caseNum>_<chartType>/Jiangsu_white" with target image "expect/高级搜索视图/5地图/<caseNum>_<chartType>/Jiangsu_white"

    Examples:
      |chartType|  value  | divideField         |  region | provinceDrilldown   | cityDrilldown   |caseNum  |   spl   |
      |Regionmap| count() | apache.geo.country  |  World  | apache.geo.province | apache.geo.city | 2792    |starttime=\"now/d-24h\" endtime=\"now/d\" tag:sample04061424_chart \| stats count() by apache.geo.country, apache.geo.province, apache.geo.city |

  @facetmap @facet
  Scenario Outline:heatmap_facet
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Map" button
    And I click the "<chartType>" button

    And I click the "Settings" button
    And I click the "Facet" button
    And I click the "AddField" button
    And I choose the "apache.status" from the "FieldValue"
    And I set the parameter "RowNum" with value "1"
    And I set the parameter "ColumnNum" with value "2"
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "StatisticalChart" will be visible
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/高级搜索视图/5地图/<caseNum>_<chartType>"
    Then I compare source image "actual/高级搜索视图/5地图/<caseNum>_<chartType>" with target image "expect/高级搜索视图/5地图/<caseNum>_<chartType>"

    Examples:
      |   chartType   |   caseNum  |   spl   |
      |   Heatmap     |    分面    |  starttime=\"now/d-24h\" endtime=\"now/d\" tag:sample04061424_chart \| stats count() by apache.geo.city, apache.status |

  @facet
  Scenario Outline:regionmap_facet
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Map" button
    And I click the "<chartType>" button

    And I click the "Settings" button
    And I click the "Facet" button
    And I click the "AddField" button
    And I choose the "apache.status" from the "FieldValue"
    And I set the parameter "RowNum" with value "1"
    And I set the parameter "ColumnNum" with value "2"
    And I click the "Divide" button
    And I choose the "apache.geo.province" from the "FieldValue" in config
    And I click the "Region" button
    And I click the "SelectChina" button
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "StatisticalChart" will be visible
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/高级搜索视图/5地图/<caseNum>_<chartType>"
    Then I compare source image "actual/高级搜索视图/5地图/<caseNum>_<chartType>" with target image "expect/高级搜索视图/5地图/<caseNum>_<chartType>"

    Examples:
      |   chartType   |   caseNum  |   spl   |
      |   Regionmap   |    分面    |  starttime=\"now/d-24h\" endtime=\"now/d\" tag:sample04061424_chart \| stats count() by apache.geo.province, apache.geo.city, apache.status |