@all @trend @createTrendMap @createTrend
Feature: 趋势图新建_地图
# sample04061424_chart for Yesterday
# vendors_461 for Yesterday


  Background:
    Given open the "trend.ListPage" page for uri "/trend/"

  Scenario Outline: map
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "SearchButton" button
    And I wait for "Loading" will be invisible
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I wait for "Type" will be visible
    And I click the "Type" button
    And I click the "Map" button
    And I click the "<chartType>" button

    And I click the "Type" button
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/<chartType>_<caseNum>"
    Then I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible
    And I compare source image "expect/<chartType>_<caseNum>" with target image "actual/<chartType>_<caseNum>"

    Examples:
      |   chartType   |   caseNum  |   spl   |
      |   Heatmap     |    2539    | starttime=\"now/d-24h\" endtime=\"now/d\" tag:sample04061424_chart \| stats count() by apache.geo.city |
      |   Regionmap   |    2545    | starttime=\"now/d-24h\" endtime=\"now/d\" tag:sample04061424_chart \| stats count() by apache.geo.country, apache.geo.province, apache.geo.city |


  Scenario Outline: attackmap
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "SearchInput" with value "starttime=\"now/d-24h\" endtime=\"now/d\" tag:sample04061424_chart \| parse field=apache.request_query \"\^gw_address=(\?<gw_address>\\d+\\.\\d+\\.\\d+\\.\\d+)\" \| stats count() as cnt, min(apache.geo.latitude) as client_lat, min(apache.geo.longitude) as client_lon by apache.clientip, gw_address \| eval gw_lat=39.5427 \| eval gw_lon=116.2317 <spl>"
    And I click the "SearchButton" button
    And I wait for "Loading" will be invisible
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I wait for "Type" will be visible
    And I click the "Type" button
    And I click the "Map" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I click the "Source" button
    And I choose the "apache.clientip" from the "FieldValue" in config
    And I choose the "clientlon" from the "FieldLongitude" in config
    And I choose the "clientlat" from the "FieldLatitude" in config
    And I click the "Target" button
    And I choose the "gw_address" from the "FieldValue" in config
    And I choose the "gw_lon" from the "FieldLongitude" in config
    And I choose the "gw_lat" from the "FieldLatitude" in config
    And I click the "Weight" button
    And I choose the "cnt" from the "FieldValue" in config
    And I click the "Region" button
    And I click the "Select<regionBut>" button
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/<chartType>_<regionBut>_<caseNum>"
    Then I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<regionBut>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible
    And I compare source image "expect/<chartType>_<regionBut>_<caseNum>" with target image "actual/<chartType>_<regionBut>_<caseNum>"

    Examples:
      |chartType| regionBut |caseNum  | spl   |
      |Attackmap|   World   | 2542    | \|eval clientlon= -0.127758 \| eval clientlat=51.507|
      |Attackmap|   China   | 2543    | \|eval clientlon= 114.109467 \| eval clientlat=22.396427|

  Scenario Outline: regionmap
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "SearchButton" button
    And I wait for "Loading" will be invisible
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I wait for "Type" will be visible
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
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/<chartType>_<region>_<caseNum>"
    Then I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<region>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible
    And I compare source image "expect/<chartType>_<region>_<caseNum>" with target image "actual/<chartType>_<region>_<caseNum>"

    Examples:
      |chartType|  value  | divideField         |  region | provinceDrilldown   | cityDrilldown   |caseNum  |   spl   |
      |Regionmap| count() | apache.geo.province |  China  | apache.geo.province | apache.geo.city | 2546    |starttime=\"now/d-24h\" endtime=\"now/d\" tag:sample04061424_chart \| stats count() by apache.geo.country, apache.geo.province, apache.geo.city |
      |Regionmap| count() | apache.geo.province | Jiangsu | apache.geo.province | apache.geo.city | 2547    |starttime=\"now/d-24h\" endtime=\"now/d\" tag:sample04061424_chart \| stats count() by apache.geo.city |

  Scenario Outline: statistical_map
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "SearchInput" with value "<spl>"
    And I wait for "2000" millsecond
    And I click the "SearchButton" button
    And I wait for "15000" millsecond
    And I wait for "Loading" will be invisible
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I wait for "Type" will be visible
    And I click the "Type" button
    And I click the "Map" button
    And I click the "<chartType>" button

    And I click the "Type" button
    And I wait for "StatisticalChart" will be visible
    And I drag the scroll bar to the element "StatisticalChart"
    And I wait for "3000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_<caseNum>"
    Then I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible
#    And I compare source image "expect/<chartType>_<caseNum>" with target image "actual/<chartType>_<caseNum>"

    Examples:
      |chartType      |caseNum  |   spl   |
      |Statisticalmap | 2098    | starttime=\"now/d-24h\" endtime=\"now/d\" tag:vendors_461 \| geostats latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude count() as cnt |
      |Statisticalmap | 2797    | starttime=\"now/d-24h\" endtime=\"now/d\" tag:vendors_461 \| geostats binspanlat=22.5 binspanlat=45.0 latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude maxzoomlevel=3 sum(vendors.Weight)  by vendors.VendorStateProvince|

  Scenario Outline: statistical_map_parameters
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "SearchInput" with value "<spl>"
    And I wait for "2000" millsecond
    And I click the "SearchButton" button
    And I wait for "15000" millsecond
    And I wait for "Loading" will be invisible
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

    And I click the "Settings" button
    And I wait for "StatisticalChart" will be visible
    And I drag the scroll bar to the element "StatisticalChart"
    And I wait for "3000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_<caseNum>"
    Then I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible
#    And I compare source image "expect/<chartType>_<caseNum>" with target image "actual/<chartType>_<caseNum>"

    Examples:
      |chartType      |   tranparencyValue  | minRadiusValue | maxRadiusValue  | caseNum        |   spl   |
      |Statisticalmap |        0.5          |     10         |      50         |  2098_param    | starttime=\"now/d-24h\" endtime=\"now/d\" tag:vendors_461 \| geostats latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude count() as cnt |
      |Statisticalmap |        0.5          |     10         |      50         |  2797_param    | starttime=\"now/d-24h\" endtime=\"now/d\" tag:vendors_461 \| geostats binspanlat=22.5 binspanlat=45.0 latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude maxzoomlevel=3 sum(vendors.Weight)  by vendors.VendorStateProvince|

  Scenario Outline: regionmap_world_white
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "SearchButton" button
    And I wait for "Loading" will be invisible
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I wait for "Type" will be visible
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
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/<chartType>_<caseNum>"
    Then I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible
    And I compare source image "expect/<chartType>_<caseNum>" with target image "actual/<chartType>_<caseNum>"

    Examples:
      |   chartType   |   caseNum        |   spl   |
      |   Regionmap   |    2545_white    | starttime=\"now/d-24h\" endtime=\"now/d\" tag:sample04061424_chart \| stats count() by apache.geo.country, apache.geo.province, apache.geo.city |

  Scenario Outline: regionmap_white
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "SearchButton" button
    And I wait for "Loading" will be invisible
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I wait for "Type" will be visible
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
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/<chartType>_<region>_<caseNum>"
    Then I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<region>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible
    And I compare source image "expect/<chartType>_<region>_<caseNum>" with target image "actual/<chartType>_<region>_<caseNum>"

    Examples:
      |chartType|  value  | divideField         |  region | provinceDrilldown   | cityDrilldown   |caseNum     |   spl   |
      |Regionmap| count() | apache.geo.province |  China  | apache.geo.province | apache.geo.city | 2546_white |starttime=\"now/d-24h\" endtime=\"now/d\" tag:sample04061424_chart \| stats count() by apache.geo.country, apache.geo.province, apache.geo.city |
      |Regionmap| count() | apache.geo.province | Jiangsu | apache.geo.province | apache.geo.city | 2547_white |starttime=\"now/d-24h\" endtime=\"now/d\" tag:sample04061424_chart \| stats count() by apache.geo.city |
