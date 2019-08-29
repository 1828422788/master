@galaxee
Feature: 数据大屏其他组件

  Background:
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"

  Scenario: 新建
    And I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And I click the "Create" button
    And I set the parameter "Name" with value "其他组件"
    And I click the "Ensure" button
    And I click the "Other" button
    And I click the "Fullscreen" button
    And I click the "Other" button
    And I click the "Picture" button
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I set the parameter "ChartXaxis" with value "58"
    And I set the parameter "ChartYaxis" with value "114"
    And I click the "OverallStyle" button
    And I set the parameter "Pellucidity" with value "0.6"
    And I click the "SinglePicture" button
    And I upload a file with name "/src/test/resources/testdata/image/pikachu.jpeg"
    And I click the "Other" button
    And I click the "Frame" button
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "325"
    And I set the parameter "Height" with value "242"
    And I set the parameter "ChartXaxis" with value "43"
    And I set the parameter "ChartYaxis" with value "94"
    And I click the "Other" button
    And I click the "Clocktime" button
    And I click the "TimeMachine" button
    And I click the "TimeWordColor" button
    And I set the parameter "ColorInput" with value "#292514"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "300"
    And I set the parameter "Height" with value "41"
    And I set the parameter "ChartXaxis" with value "58"
    And I set the parameter "ChartYaxis" with value "114"
    And I wait for "Save" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"

  Scenario Outline: 修改背景颜色
    When the galaxee name is "<name>" then I click the "el-button el-button--text" button
    And switch to window "<name>"
    Then I will see the "galaxee.CreatePage" page
    And I click the "TableHeaderBgColor" button
    And I set the parameter "ColorInput" with value "#37064F"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    And I alter the element "RightArrow" style to "display: inline;"
    And I click the "RightArrow" button
    And I alter the element "LeftArrow" style to "display: inline;"
    And I click the "LeftArrow" button
    And I wait for "1000" millsecond
    And take part of "Preview" with name "galaxee/其他组件改背景颜色"
    And I wait for "Save" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"

    Examples:
      | name |
      | 其他组件 |

  Scenario Outline: 更换背景图片
    When the galaxee name is "<name>" then I click the "el-button el-button--text" button
    And switch to window "<name>"
    Then I will see the "galaxee.CreatePage" page
    And I upload a file with name "/src/test/resources/testdata/image/bg.jpg"
    And I alter the element "RightArrow" style to "display: inline;"
    And I click the "RightArrow" button
    And I alter the element "LeftArrow" style to "display: inline;"
    And I click the "LeftArrow" button
    And I wait for "1000" millsecond
    And take part of "Preview" with name "galaxee/其他组件"
    And I wait for "Save" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"

    Examples:
      | name |
      | 其他组件 |
