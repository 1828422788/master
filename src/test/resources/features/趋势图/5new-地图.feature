Feature: 趋势图新建_地图

  Background:
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page

  Scenario Outline: map
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I click the "Type" button
    And I click the "Map" button
    And I click the "<chartType>" button
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "日志展现/trend/<caseNum>_<chartType>"
    And I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "AutoTest" from the "GroupField"
    And I choose the "无数集app之api全部测试用例" from the "AppField"
    And I click the "FinishButton" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |   chartType   |   caseNum  |   spl   |
   #   |   Heatmap     |    2539    |  tag:sample04061424_chart \| stats count() by apache.geo.city |
      |   Regionmap   |    2545    | tag:sample04061424_chart \| stats count() by apache.geo.country, apache.geo.province, apache.geo.city |

  Scenario Outline: attackmap
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart \| parse field=apache.request_query \"\^gw_address=(\?<gw_address>\\d+\\.\\d+\\.\\d+\\.\\d+)\" \| stats count() as cnt, min(apache.geo.latitude) as client_lat, min(apache.geo.longitude) as client_lon by apache.clientip, gw_address \| eval gw_lat=39.5427 \| eval gw_lon=116.2317"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button

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
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "日志展现/trend/<caseNum>_<chartType>"
    And I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<regionBut>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "AutoTest" from the "GroupField"
    And I choose the "无数集app之api全部测试用例" from the "AppField"
    And I click the "FinishButton" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |chartType|      source     |  sourceLon | sourceLat  | target     | targetLon | targetLat |  weight | regionBut |caseNum  |
      |Attackmap| apache.clientip | client_lon | client_lat | gw_address | gw_lon    |  gw_lat   |   cnt   |   World   | 2542    |
      |Attackmap| apache.clientip | client_lon | client_lat | gw_address | gw_lon    |  gw_lat   |   cnt   |   China   | 2543    |

  Scenario Outline: regionmap
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button

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
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "日志展现/trend/<caseNum>_<region>_<chartType>"
    And I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<region>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "AutoTest" from the "GroupField"
    And I choose the "无数集app之api全部测试用例" from the "AppField"
    And I click the "FinishButton" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |chartType|  value  | divideField         |  region | provinceDrilldown   | cityDrilldown   |caseNum  |   spl   |
      |Regionmap| count() | apache.geo.province |  China  | apache.geo.province | apache.geo.city | 2546    |tag:sample04061424_chart \| stats count() by apache.geo.country, apache.geo.province, apache.geo.city |
      |Regionmap| count() | apache.geo.province | Jiangsu | apache.geo.province | apache.geo.city | 2547    |tag:sample04061424_chart \| stats count() by apache.geo.city |

  Scenario Outline: statistical_map
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I wait for "Type" will be visible
    And I click the "Type" button
    And I click the "Map" button
    And I click the "<chartType>" button
    And I wait for "StatisticalChart" will be visible
    And I drag the scroll bar to the element "StatisticalChart"
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "日志展现/trend/<caseNum>_<chartType>"
    And I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "AutoTest" from the "GroupField"
    And I choose the "无数集app之api全部测试用例" from the "AppField"
    And I click the "FinishButton" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |chartType      |caseNum  |   spl   |
      |Statisticalmap | 2098    | tag:vendors_461 \| geostats latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude count() as cnt |

  Scenario Outline: statistical_map_parameters
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button

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
    And I wait for "StatisticalChart" will be visible
    And I drag the scroll bar to the element "StatisticalChart"
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "日志展现/trend/<caseNum>_<chartType>"
    And I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "AutoTest" from the "GroupField"
    And I choose the "无数集app之api全部测试用例" from the "AppField"
    And I click the "FinishButton" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |chartType      |   tranparencyValue  | minRadiusValue | maxRadiusValue  | caseNum        |   spl   |
      |Statisticalmap |        0.5          |     10         |      50         |  2098_param    | tag:vendors_461 \| geostats latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude count() as cnt |
