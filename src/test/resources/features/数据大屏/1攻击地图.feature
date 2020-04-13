@galaxee
Feature: 数据大屏-攻击地图

  Background:
#    Given I wait for title change text to "仪表盘"
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"

  Scenario: 新建默认类型的攻击地图
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And I click the "Create" button
    And I set the parameter "Name" with value "攻击地图"
    And I click the "Ensure" button
    And I click the "Map" button
    And I click the "Attackmap" button
    And I click the "Style" button
    And I wait for "MapHeader" will be visible
    And I click the "MapHeader" button
    And I set the parameter "Scaling" with value "1"
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "800"
    And I set the parameter "Height" with value "602"
    And I set the parameter "ChartXaxis" with value "145"
    And I set the parameter "ChartYaxis" with value "194"
    And I click the "Data" button
    And I set the parameter "SplInput" with value "logtype:apache | parse field=apache.request_query "^gw_address=(?<gw_address>\d+\.\d+\.\d+\.\d+)" | bucket timestamp span=1h as ts| stats count() as cnt, min(apache.geo.latitude) as client_lat, min(apache.geo.longitude) as client_lon by apache.clientip, gw_address,ts | eval gw_lat=39.5427 | eval gw_lon=116.2317"
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I choose the "client_lat" from the "SourceLatitude"
    And I choose the "client_lon" from the "SourceLongitude"
    And I choose the "gw_lat" from the "TargetLatitude"
    And I choose the "gw_lon" from the "TargetLongitude"
    And I choose the "ts" from the "Time"
    And I choose the "cnt" from the "MeasureValue"
    And I click the "Update" button
    And I wait for "Save" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"

  Scenario Outline: 修改攻击地图配置
    When the galaxee name is "<name>" then I click the "el-button el-button--text" edit button
    And switch to window "<name>"
    Then I will see the "galaxee.CreatePage" page
    And I click the "pictureOne" button
#    And I click the "Map" button
#    And I click the "Attackmap" button
    And I click the "Style" button
    And I wait for "MapHeader" will be visible
    And I click the "MapHeader" button
    And I click the "BoundaryColor" button
    And I set the parameter "ColorInput" with value "#00EEFF"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    And I click the "AreaColor" button
    And I set the parameter "ColorInput" with value "#AA5353"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    And I click the "EventColor" button
    And I set the parameter "ColorInput" with value "#F2321D"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    And I set the parameter "Scaling" with value "1"
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "752"
    And I set the parameter "Height" with value "439"
    And I set the parameter "ChartXaxis" with value "800"
    And I set the parameter "ChartYaxis" with value "295"
    And I click the "Data" button
    And I set the parameter "SplInput" with value "logtype:apache | parse field=apache.request_query "^gw_address=(?<gw_address>\d+\.\d+\.\d+\.\d+)" | bucket timestamp span=1h as ts| stats count() as cnt, min(apache.geo.latitude) as client_lat, min(apache.geo.longitude) as client_lon by apache.clientip, gw_address,ts | eval gw_lat=39.5427 | eval gw_lon=116.2317"
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I choose the "client_lat" from the "SourceLatitude"
    And I choose the "client_lon" from the "SourceLongitude"
    And I choose the "gw_lat" from the "TargetLatitude"
    And I choose the "gw_lon" from the "TargetLongitude"
    And I choose the "ts" from the "Time"
    And I choose the "cnt" from the "MeasureValue"
    And I click the "Update" button
    And I click the "Save" button
    Then I will see the success message "保存成功"

    Examples:
      | name |
      | 攻击地图 |

  Scenario Outline: 发布页截图
    When the galaxee name is "<name>" then I click the "iconfont icon-fabu" release button
    And switch to window "<name>"
    And I close all tabs except main tab
    And I wait for "Loading" will be invisible
    And I wait for "1000" millsecond
    Then take a screenshot with name "galaxee/<name>"

    Examples:
      | name |
      | 攻击地图 |


  Scenario Outline: 删除关于| 攻击地图 |的大屏
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-shanchuxuanting_icon" delete button
    Then I click the "Ensure" button

    Examples:
      |name|
      | 攻击地图 |