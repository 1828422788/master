@galaxee
Feature: 数据大屏-其他组件

  Scenario: 新建其他组件
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
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
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "300"
    And I set the parameter "Height" with value "41"
    And I set the parameter "ChartXaxis" with value "58"
    And I set the parameter "ChartYaxis" with value "114"
    And I click the "TimeMachine" button
    And I click the "TimeWordColor" button
    And I set the parameter "ColorInput" with value "#292514"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    And I wait for "Save" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"

  Scenario Outline: 修改背景颜色
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "el-button el-button--text" edit button
    And switch to window "<name>"
    Then I will see the "galaxee.CreatePage" page
    And I wait for "TableHeaderBgColor" will be visible
    And I click the "TableHeaderBgColor" button
    And I set the parameter "ColorInput" with value "#37064F"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    And I wait for "Save" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"

    Examples:
      | name |
      | 其他组件 |

  Scenario Outline: 更换背景图片
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "el-button el-button--text" edit button
    And switch to window "<name>"
    Then I will see the "galaxee.CreatePage" page
    And I upload a file with name "/src/test/resources/testdata/image/bg.jpg"
    And I wait for "Save" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"

    Examples:
      | name |
      | 其他组件 |

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
      | 其他组件 |


  Scenario Outline: 删除关于其他组件的大屏
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-shanchuxuanting_icon" delete button
    Then I click the "Ensure" button

    Examples:
      |name|
      | 其他组件 |