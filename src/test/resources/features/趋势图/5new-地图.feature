@trend @createTrendMap @createTrend
Feature: 趋势图新建_地图

  Background:
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page
    And I wait for element "SearchStatus" change text to "搜索完成!"

  Scenario Outline: 热力地图，区划地图
    When I set the parameter "SearchInput" with value "<spl>"
    And I wait for "1000" millsecond
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I wait for "Type" will be visible
    And I wait for "2000" millsecond
    And I click the "Type" button
    And I click the "Map" button
    And I click the "<chartType>" button

    And I click the "Type" button
    And I wait for "2000" millsecond
    And I wait for "<element>Element" will be visible
    And I wait for "Type" will be visible
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_<caseNum>"
    And I compare source image "actual/<chartType>_<caseNum>" with target image "expect/<chartType>_<caseNum>"
    Then I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "Complete" button
    Then I wait for "SuccessCreate" will be visible
    And I click the "ReturnButton" button

    When I will see the "trend.ListPage" page
    And I wait for "AppOfTheLastItem" will be visible
    And the data name is "{'column':'0','name':'<chartType>_<caseNum>'}" then i click the "展示趋势图" button in more menu
    And switch to window "查看趋势图"
    And I close all tabs except main tab
    Then I will see the "trend.ViewPage" page
    And I wait for "ChartName" will be visible
    And I wait for "ChartView" will be visible
    And I will see the element "ChartName" contains "<chartType>_<caseNum>"
    Then I will see the "trend.CreatePage" page
    And I wait for "<element>Element" will be visible

    Examples:
      |   chartType   |  element      | caseNum  |   spl   |
      |   Heatmap     | Heatmap       |  2539    | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| stats count() by apache.geo.city |
      |   Regionmap   | RegionmapDark |  2545    | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| stats count() by apache.geo.country, apache.geo.province, apache.geo.city |

  Scenario Outline: 攻击地图
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| parse field=apache.request_query \"\^gw_address=(\?<gw_address>\\d+\\.\\d+\\.\\d+\\.\\d+)\" \| stats count() as cnt, min(apache.geo.latitude) as client_lat, min(apache.geo.longitude) as client_lon by apache.clientip, gw_address \| eval gw_lat=39.5427 \| eval gw_lon=116.2317 <spl>"
    And I wait for "1000" millsecond
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I wait for "Type" will be visible
    And I wait for "2000" millsecond
    And I click the "Type" button
    And I click the "Map" button
    And I click the "<chartType>" button
    And I click the "Type" button
    And I click the "Settings" button
    And I click the "Source" button
    And I choose the "clientlat" from the "FieldLatitude"
    And I choose the "clientlon" from the "FieldLongitude"
    And I choose the "apache.clientip" from the "FieldValue"
    And I click the "Target" button
    And I choose the "gw_lat" from the "FieldLatitude"
    And I choose the "gw_lon" from the "FieldLongitude"
    And I choose the "gw_address" from the "FieldValue"
    And I click the "Weight" button
    And I choose the "cnt" from the "FieldValue"
    And I click the "Region" button
    And I click the "Select<regionBut>" button
    And I wait for "1000" millsecond
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "2000" millsecond
    And I wait for "<chartType>Element" will be visible
    And I wait for "Type" will be visible
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_<regionBut>_<caseNum>"
    And I compare source image "actual/<chartType>_<regionBut>_<caseNum>" with target image "expect/<chartType>_<regionBut>_<caseNum>"
    Then I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<regionBut>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "Complete" button
    Then I wait for "SuccessCreate" will be visible
    And I click the "ReturnButton" button

    When I will see the "trend.ListPage" page
    And I wait for "AppOfTheLastItem" will be visible
    And the data name is "{'column':'0','name':'<chartType>_<regionBut>_<caseNum>'}" then i click the "展示趋势图" button in more menu
    And switch to window "查看趋势图"
    And I close all tabs except main tab
    Then I will see the "trend.ViewPage" page
    And I wait for "ChartName" will be visible
    And I wait for "ChartView" will be visible
    And I will see the element "ChartName" contains "<chartType>_<regionBut>_<caseNum>"
    Then I will see the "trend.CreatePage" page
    And I wait for "<chartType>Element" will be visible

    @trendSmoke
    Examples:
      |chartType| regionBut |caseNum  | spl   |
      |Attackmap|   World   | 2542    | \|eval clientlon= -0.127758 \| eval clientlat=51.507|
    Examples:
      |chartType| regionBut |caseNum  | spl   |
      |Attackmap|   China   | 2543    | \|eval clientlon= 114.109467 \| eval clientlat=22.396427|

  Scenario Outline: regionmap
    When I set the parameter "SearchInput" with value "<spl>"
    And I wait for "1000" millsecond
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I wait for "Type" will be visible
    And I wait for "2000" millsecond
    And I click the "Type" button
    And I click the "Map" button
    And I click the "<chartType>" button
    And I click the "Type" button
    And I click the "Settings" button
    And I click the "Divide" button
    And I click the "DeleteLast" button
    And I choose the "<divideField>" from the "FieldValue"
    And I click the "Region" button
    And I click the "Select<region>" button
    And I click the "GoingDown" button
    And I choose the "apache.geo.province" from the "Province"
    And I choose the "apache.geo.city" from the "City"
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "2000" millsecond
    And I wait for "<chartType>DarkElement" will be visible
    And I wait for "Type" will be visible
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_<region>_<caseNum>"
    And I compare source image "actual/<chartType>_<region>_<caseNum>" with target image "expect/<chartType>_<region>_<caseNum>"
    Then I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<region>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "Complete" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |chartType| divideField         |  region |caseNum  |   spl   |
      |Regionmap| apache.geo.province |  China  | 2546    |starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| stats count() by apache.geo.country, apache.geo.province, apache.geo.city |
      |Regionmap| apache.geo.city     | Jiangsu | 2547    |starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| stats count() by apache.geo.city, apache.geo.province |


  Scenario Outline: regionmap_world_white
    When I set the parameter "SearchInput" with value "<spl>"
    And I wait for "1000" millsecond
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I wait for "Type" will be visible
    And I wait for "2000" millsecond
    And I click the "Type" button
    And I click the "Map" button
    And I click the "<chartType>" button
    And I click the "Type" button

    And I click the "Settings" button
    And I click the "Exhibition" button
    # Switch to white map
    And I click the "ShowBubbles" button
    And I wait for "1000" millsecond
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "2000" millsecond
    And I wait for "<chartType>LightElement" will be visible
    And I wait for "Type" will be visible
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_<caseNum>"
    And I compare source image "actual/<chartType>_<caseNum>" with target image "expect/<chartType>_<caseNum>"
    Then I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "Complete" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |   chartType   |   caseNum        |   spl   |
      |   Regionmap   |    2545_white    | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| stats count() by apache.geo.country, apache.geo.province, apache.geo.city |

  Scenario Outline: regionmap_white
    When I set the parameter "SearchInput" with value "<spl>"
    And I wait for "1000" millsecond
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I wait for "Type" will be visible
    And I wait for "2000" millsecond
    And I click the "Type" button
    And I click the "Map" button
    And I click the "<chartType>" button
    And I click the "Type" button
    And I click the "Settings" button
    And I click the "Value" button
    And I choose the "count()" from the "FieldValue"
    And I click the "Divide" button
    And I click the "DeleteLast" button
    And I choose the "<divideField>" from the "FieldValue"
    And I click the "Region" button
    And I click the "Select<region>" button
    And I click the "Exhibition" button
    # Switch to white map
    And I click the "ShowBubbles" button
    And I click the "GoingDown" button
    And I choose the "apache.geo.province" from the "Province"
    And I choose the "apache.geo.city" from the "City"
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "2000" millsecond
    And I wait for "<chartType>LightElement" will be visible
    And I wait for "Type" will be visible
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_<region>_<caseNum>"
    And I compare source image "actual/<chartType>_<region>_<caseNum>" with target image "expect/<chartType>_<region>_<caseNum>"
    Then I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<region>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "Complete" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |chartType| divideField         |  region |caseNum     |   spl   |
      |Regionmap| apache.geo.province |  China  | 2546_white |starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| stats count() by apache.geo.country, apache.geo.province, apache.geo.city |
      |Regionmap| apache.geo.city     | Jiangsu | 2547_white |starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| stats count() by apache.geo.city, apache.geo.province |


  Scenario Outline: heatmap_facet
    When I set the parameter "SearchInput" with value "<spl>"
    And I wait for "1000" millsecond
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I wait for "Type" will be visible
    And I wait for "2000" millsecond
    And I click the "Type" button
    And I click the "Map" button
    And I click the "<chartType>" button
    And I click the "Type" button

    And I click the "Settings" button
    And I click the "Facet" button
    And I choose the "apache.status" from the "FieldValue"
    And I set the parameter "RowNum" with value "1"
    And I set the parameter "ColumnNum" with value "2"
    And I wait for "1000" millsecond
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "2000" millsecond
    And I wait for "<chartType>Element" will be visible
    And I wait for "Type" will be visible
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_<caseNum>"
    And I compare source image "actual/<chartType>_<caseNum>" with target image "expect/<chartType>_<caseNum>"
    Then I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "Complete" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |   chartType   |   caseNum  |   spl   |
      |   Heatmap     |    分面    |  starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| stats count() by apache.geo.city, apache.status |


  Scenario Outline: regionmap_facet
    When I set the parameter "SearchInput" with value "<spl>"
    And I wait for "1000" millsecond
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I wait for "Type" will be visible
    And I wait for "2000" millsecond
    And I click the "Type" button
    And I click the "Map" button
    And I click the "<chartType>" button
    And I click the "Type" button

    And I click the "Settings" button
    And I click the "Facet" button
    And I choose the "apache.status" from the "FieldValue"
    And I set the parameter "RowNum" with value "1"
    And I set the parameter "ColumnNum" with value "2"
    And I click the "Divide" button
    And I click the "DeleteLast" button
    And I choose the "apache.geo.province" from the "FieldValue"
    And I click the "Region" button
    And I click the "SelectChina" button
    And I wait for "1000" millsecond
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "2000" millsecond
    And I wait for "<chartType>DarkElement" will be visible
    And I wait for "Type" will be visible
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_<caseNum>"
    And I compare source image "actual/<chartType>_<caseNum>" with target image "expect/<chartType>_<caseNum>"
    Then I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "Complete" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |   chartType   |   caseNum  |   spl   |
      |   Regionmap   |    分面    |  starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| stats count() by apache.geo.province, apache.geo.city, apache.status |