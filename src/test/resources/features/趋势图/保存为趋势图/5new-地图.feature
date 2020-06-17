@saveAsTrend @saveAsTrendMap
Feature: 保存为趋势图_地图
# 10
# sample04061424_chart for Today
# vendors_461 for Today
# uncomment comparison

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"

  Scenario Outline: map
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page

    And I wait for "Type" will be visible
    And I click the "Type" button
    And I click the "Map" button
    And I click the "<chartType>" button

    And I click the "Type" button
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "saveAsTrend/<chartType>_<caseNum>"
#    Then I compare source image "src/test/resources/expect/趋势图/<chartType>_<caseNum>.png" with target image "target/cucumber-html-reports/embeddings/actual_img/日志展现_趋势图/<chartType>_<caseNum>.png"
    And I click the "SaveAsTrend" button

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "CreateEnsureButton" button
    Then I will see the success message "创建成功"

    Examples:
      |   chartType   |   caseNum  |   spl   |
      |   Heatmap     |    2539    |  tag:sample04061424_chart \| stats count() by apache.geo.city |
      |   Regionmap   |    2545    | tag:sample04061424_chart \| stats count() by apache.geo.country, apache.geo.province, apache.geo.city |

  Scenario Outline: attackmap
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart \| parse field=apache.request_query \"\^gw_address=(\?<gw_address>\\d+\\.\\d+\\.\\d+\\.\\d+)\" \| stats count() as cnt, min(apache.geo.latitude) as client_lat, min(apache.geo.longitude) as client_lon by apache.clientip, gw_address \| eval gw_lat=39.5427 \| eval gw_lon=116.2317 <spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page

    And I wait for "Type" will be visible
    And I click the "Type" button
    And I click the "Map" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I click the "Source" button
    And I choose the "<source>" from the "FieldValue"
    And I choose the "<sourceLon>" from the "FieldLongitude"
    And I choose the "<sourceLat>" from the "FieldLatitude"
    And I click the "Target" button
    And I choose the "<target>" from the "FieldValue"
    And I choose the "<targetLon>" from the "FieldLongitude"
    And I choose the "<targetLat>" from the "FieldLatitude"
    And I click the "Weight" button
    And I choose the "<weight>" from the "FieldValue"
    And I click the "Region" button
    And I click the "Select<regionBut>" button
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "saveAsTrend/<chartType>_<regionBut>_<caseNum>"
#    Then I compare source image "src/test/resources/expect/趋势图/<chartType>_<regionBut>_<caseNum>.png" with target image "target/cucumber-html-reports/embeddings/actual_img/日志展现_趋势图/<chartType>_<regionBut>_<caseNum>.png"
    And I click the "SaveAsTrend" button

    When I set the parameter "NameInput" with value "<chartType>_<regionBut>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "CreateEnsureButton" button
    Then I will see the success message "创建成功"

    Examples:
      |chartType|      source     |  sourceLon | sourceLat  | target     | targetLon | targetLat |  weight | regionBut |caseNum  | spl   |
      |Attackmap| apache.clientip | clientlon  | clientlat  | gw_address | gw_lon    |  gw_lat   |   cnt   |   World   | 2542    | \|eval clientlon= -0.127758 \| eval clientlat=51.507|
      |Attackmap| apache.clientip | clientlon  | clientlat  | gw_address | gw_lon    |  gw_lat   |   cnt   |   China   | 2543    | \|eval clientlon= 114.109467 \| eval clientlat=22.396427|

  Scenario Outline: regionmap
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page

    And I wait for "Type" will be visible
    And I click the "Type" button
    And I click the "Map" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I click the "Value" button
    And I choose the "<value>" from the "FieldValue"
    And I click the "Divide" button
    And I choose the "<divideField>" from the "FieldValue"
    And I click the "Region" button
    And I click the "Select<region>" button
    And I click the "GoingDown" button
    And I choose the "<provinceDrilldown>" from the "Province"
    And I choose the "<cityDrilldown>" from the "City"
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "saveAsTrend/<chartType>_<region>_<caseNum>"
#    Then I compare source image "src/test/resources/expect/趋势图/<chartType>_<region>_<caseNum>.png" with target image "target/cucumber-html-reports/embeddings/actual_img/日志展现_趋势图/<chartType>_<region>_<caseNum>.png"
    And I click the "SaveAsTrend" button

    When I set the parameter "NameInput" with value "<chartType>_<region>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "CreateEnsureButton" button
    Then I will see the success message "创建成功"

    Examples:
      |chartType|  value  | divideField         |  region | provinceDrilldown   | cityDrilldown   |caseNum  |   spl   |
      |Regionmap| count() | apache.geo.province |  China  | apache.geo.province | apache.geo.city | 2546    |tag:sample04061424_chart \| stats count() by apache.geo.country, apache.geo.province, apache.geo.city |
      |Regionmap| count() | apache.geo.province | Jiangsu | apache.geo.province | apache.geo.city | 2547    |tag:sample04061424_chart \| stats count() by apache.geo.city |

  Scenario Outline: statistical_map
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page

    And I wait for "Type" will be visible
    And I click the "Type" button
    And I click the "Map" button
    And I click the "<chartType>" button

    And I click the "Type" button
    And I wait for "StatisticalChart" will be visible
    And I drag the scroll bar to the element "StatisticalChart"
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "saveAsTrend/<chartType>_<caseNum>"
    #    Then I compare source image "src/test/resources/expect/趋势图/<chartType>_<caseNum>.png" with target image "target/cucumber-html-reports/embeddings/actual_img/日志展现_趋势图/<chartType>_<caseNum>.png"
    And I click the "SaveAsTrend" button

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "CreateEnsureButton" button
    Then I will see the success message "创建成功"

    Examples:
      |chartType      |caseNum  |   spl   |
      |Statisticalmap | 2098    | tag:vendors_461 \| geostats latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude count() as cnt |
      |Statisticalmap | 2797    | tag:vendors_461 \| geostats binspanlat=22.5 binspanlat=45.0 latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude maxzoomlevel=3 sum(vendors.Weight)  by vendors.VendorStateProvince|

  Scenario Outline: statistical_map_parameters
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page

    And I wait for "Type" will be visible
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
    And I drag the scroll bar to the element "StatisticalChart"
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "saveAsTrend/<chartType>_<caseNum>"
    #    Then I compare source image "src/test/resources/expect/趋势图/<chartType>_<caseNum>.png" with target image "target/cucumber-html-reports/embeddings/actual_img/日志展现_趋势图/<chartType>_<caseNum>.png"
    And I click the "SaveAsTrend" button

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "CreateEnsureButton" button
    Then I will see the success message "创建成功"

    Examples:
      |chartType      |   tranparencyValue  | minRadiusValue | maxRadiusValue  | caseNum        |   spl   |
      |Statisticalmap |        0.5          |     10         |      50         |  2098_param    | tag:vendors_461 \| geostats latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude count() as cnt |
      |Statisticalmap |        0.5          |     10         |      50         |  2797_param    | tag:vendors_461 \| geostats binspanlat=22.5 binspanlat=45.0 latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude maxzoomlevel=3 sum(vendors.Weight)  by vendors.VendorStateProvince|
