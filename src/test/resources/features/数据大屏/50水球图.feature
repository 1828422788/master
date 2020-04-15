@galaxee
Feature: 数据大屏-水球图

  Scenario: 新建水球图，默认配置
#    Given I wait for title change text to "仪表盘"
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And I click the "Create" button
    And I set the parameter "Name" with value "水球图"
    And I click the "Ensure" button
    And I click the "Chart" button
    And I drag the scroll bar to the element "Liquidfill"
    And I click the "Liquidfill" button
    And I click the "Style" button
    And I wait for "Liquidfill" will be invisible
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I set the parameter "ChartXaxis" with value "0"
    And I set the parameter "ChartYaxis" with value "0"
    And I click the "Data" button
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I choose the "p" from the "DataField"
    And I wait for "Save" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"

  Scenario Outline: 修改配置
#    Given I wait for title change text to "仪表盘"
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "el-button el-button--text" edit button
    And switch to window "<name>"
    And I close all tabs except main tab
    Then I will see the "galaxee.CreatePage" page
    And I click the "pictureOne" button
#    And I click the "Chart" button
#    And I click the "Liquidfill" button
    And I click the "Style" button
    And I wait for "Liquidfill" will be invisible
    And I wait for "WaterWavePainting" will be visible
    And I click the "WaterWavePainting" button
    And I switch the "WaterWaveSwitchLabel" button to "disable"
    And I click the "LiquidShapeHeader" button
    And I choose the "pin" from the "LiquidShape"
    And I click the "OuterFrame" button
    And I switch the "OuterFrameSwitch" button to "disable"
    And I click the "Tag" button
    And I set the parameter "TagWordSize" with value "70"
    And I click the "TagColorInWaterWave" button
    And I set the parameter "ColorInput" with value "#F87272"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    And I click the "TagColorOutWaterWave" button
    And I set the parameter "ColorInput" with value "#010206"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    And I click the "WaterWaveColorHeader" button
    And I click the "WaterWaveColor" button
    And I set the parameter "ColorInput" with value "#ECF492"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "500"
    And I set the parameter "height" with value "600"
    And I set the parameter "ChartXaxis" with value "0"
    And I set the parameter "ChartYaxis" with value "200"
    And I click the "Data" button
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I choose the "p" from the "DataField"
    And I click the "Save" button
    Then I will see the success message "保存成功"

    Examples:
      | name |
      | 水球图  |

  Scenario Outline: 发布页截图
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-fabu" release button
    And switch to window "<name>"
    And I close all tabs except main tab
    And I wait for "Loading" will be invisible
    And I wait for "1000" millsecond
    Then take a screenshot with name "galaxee/<name>"

    Examples:
      | name |
      | 水球图   |



  Scenario Outline: 删除关于| 水球图 |的大屏
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-shanchuxuanting_icon" delete button
    Then I click the "Ensure" button

    Examples:
      |name|
      | 水球图   |