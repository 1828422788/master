@first
Feature: 数据大屏水球图

  Background:
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"

  Scenario: 新建水球图，默认配置
    And I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And I click the "Create" button
    And I set the parameter "Name" with value "水球图"
    And I click the "Ensure" button
    And I click the "Chart" button
    And I click the "Liquidfill" button
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
    When the galaxee name is "<name>" then I click the "el-button el-button--text" button
    And switch to window "<name>"
    Then I will see the "galaxee.CreatePage" page
    And I click the "Chart" button
    And I click the "Liquidfill" button
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
    And I alter the element "RightArrow" style to "display: inline;"
    And I click the "RightArrow" button
    And I alter the element "LeftArrow" style to "display: inline;"
    And I click the "LeftArrow" button
    And I wait for "1000" millsecond
    And take part of "Preview" with name "galaxee/<name>"
    And I click the "Save" button
    Then I will see the success message "保存成功"

    Examples:
      | name |
      | 水球图  |