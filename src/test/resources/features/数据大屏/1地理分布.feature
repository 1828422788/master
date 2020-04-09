@galaxee
Feature: 数据大屏-地理分布

  Scenario: 新建默认类型的地理分布
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "地理分布"
    And I click the "Ensure" button
    And I click the "Map" button
    And I click the "Globelabel" button
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "500"
    And I set the parameter "Height" with value "607"
    And I set the parameter "ChartXaxis" with value "0"
    And I set the parameter "ChartYaxis" with value "0"
    And I click the "Data" button
    And I set the parameter "SplInput" with value "logtype:apache | parse field=apache.request_query "^gw_address=(?<gw_address>\d+\.\d+\.\d+\.\d+)" | bucket timestamp span=1h as ts| stats count() as cnt, min(apache.geo.latitude) as client_lat, min(apache.geo.longitude) as client_lon by apache.clientip, gw_address,ts | eval gw_lat=39.5427 | eval gw_lon=116.2317"
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I choose the "client_lat" from the "SourceLatitude"
    And I choose the "client_lon" from the "SourceLongitude"
    And I choose the "apache.clientip" from the "MapName"
    And I choose the "cnt" from the "MeasureValue"
    And I click the "Update" button
    And I wait for "Save" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"

  Scenario Outline: 修改配置
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "el-button el-button--text" edit button
    And switch to window "<name>"
    Then I will see the "galaxee.CreatePage" page
    And I click the "pictureOne" button
   # And I click the "Map" button
   # And I click the "Globelabel" button
    And I wait for "GlobelabelMapHeader" will be visible
    And I click the "GlobelabelMapHeader" button
    And I click the "AreaColor" button
    And I set the parameter "ColorInput" with value "#AA5353"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    And I click the "MarkColor" button
    And I set the parameter "ColorInput" with value "#6CF26A"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "976"
    And I set the parameter "Height" with value "660"
    And I set the parameter "ChartXaxis" with value "364"
    And I set the parameter "ChartYaxis" with value "-3"
    And I click the "Data" button
    And I set the parameter "SplInput" with value "logtype:apache | parse field=apache.request_query "^gw_address=(?<gw_address>\d+\.\d+\.\d+\.\d+)" | bucket timestamp span=1h as ts| stats count() as cnt, min(apache.geo.latitude) as client_lat, min(apache.geo.longitude) as client_lon by apache.clientip, gw_address,ts | eval gw_lat=39.5427 | eval gw_lon=116.2317"
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I choose the "client_lat" from the "SourceLatitude"
    And I choose the "client_lon" from the "SourceLongitude"
    And I choose the "apache.clientip" from the "MapName"
    And I choose the "cnt" from the "MeasureValue"
    And I click the "Update" button
    And I click the "Save" button
    Then I will see the success message "保存成功"

    Examples:
      | name |
      | 地理分布 |

  Scenario Outline: 发布页截图
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-fabu" release button
    And switch to window "<name>"
    And I wait for "Loading" will be invisible
    And I wait for "1000" millsecond
    Then take a screenshot with name "galaxee/<name>"

    Examples:
      | name |
      | 地理分布 |