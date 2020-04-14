@galaxee
Feature: 数据大屏-条形图

  Scenario: 新建条形图，默认配置
#    Given I wait for title change text to "仪表盘"
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And I click the "Create" button
    And I set the parameter "Name" with value "条形图"
    And I click the "Ensure" button
    And I click the "Chart" button
    And I click the "BarHorizontal" button
    And I click the "Style" button
    And I wait for "BarHorizontal" will be invisible
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "530"
    And I set the parameter "Height" with value "417"
    And I set the parameter "ChartXaxis" with value "0"
    And I set the parameter "ChartYaxis" with value "0"
    And I click the "Data" button
    And I set the parameter "SplInput" with value "tag:sample04061424_chart | stats count() by apache.clientip,apache.method | limit 7"
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I choose the "count()" from the "DataField"
    And I choose the "apache.clientip" from the "DivideField"
    And I wait for "Save" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"

  Scenario Outline: 条形图修改配置
#    Given I wait for title change text to "仪表盘"
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "el-button el-button--text" edit button
    And switch to window "<name>"
    Then I will see the "galaxee.CreatePage" page
    And I click the "pictureOne" button
#    And I click the "Chart" button
#    And I wait for "BarHorizontal" will be visible
#    And I click the "BarHorizontal" button
    And I click the "Style" button
    And I wait for "BarHorizontal" will be invisible
    And I wait for "Tag" will be visible
    And I click the "Tag" button
    And I set the parameter "TagWordSize" with value "20"
    And I click the "TagWordColor" button
    And I set the parameter "ColorInput" with value "#DFFE19"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    And I choose the "lighter" from the "TagBold"
    And I click the "Layout" button
    And I set the parameter "LayoutBottom" with value "20"
    And I set the parameter "LayoutLeft" with value "20"
    And I set the parameter "LayoutRight" with value "20"
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "703"
    And I set the parameter "height" with value "567"
    And I set the parameter "ChartXaxis" with value "516"
    And I set the parameter "ChartYaxis" with value "2"
#    And I click the "Data" button
#    And I set the parameter "SplInput" with value "tag:sample04061424_chart | stats count() by apache.clientip,apache.method"
#    And I click the "Search" button
#    And I wait for "SearchTip" will be invisible
#    And I choose the "count()" from the "DataField"
#    And I choose the "apache.clientip" from the "DivideField"
    And I click the "Save" button
    Then I will see the success message "保存成功"

    Examples:
      | name |
      | 条形图  |

  Scenario Outline: 增加切分字段
#    Given I wait for title change text to "仪表盘"
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "el-button el-button--text" edit button
    And switch to window "<name>"
    Then I will see the "galaxee.CreatePage" page
    And I click the "pictureOne" button
#    And I click the "Chart" button
#    And I wait for "BarHorizontal" will be visible
#    And I click the "BarHorizontal" button
    And I click the "Style" button
    And I wait for "BarHorizontal" will be invisible
    And I wait for "Tag" will be visible
    And I click the "Tag" button
    And I set the parameter "TagWordSize" with value "20"
    And I click the "TagWordColor" button
    And I set the parameter "ColorInput" with value "#DFFE19"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    And I choose the "lighter" from the "TagBold"
    And I click the "Layout" button
    And I set the parameter "LayoutBottom" with value "20"
    And I set the parameter "LayoutLeft" with value "20"
    And I set the parameter "LayoutRight" with value "20"
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "961"
    And I set the parameter "height" with value "382"
    And I set the parameter "ChartXaxis" with value "-7"
    And I set the parameter "ChartYaxis" with value "406"
    And I click the "Data" button
#    And I set the parameter "SplInput" with value "tag:sample04061424_chart | stats count() by apache.clientip,apache.method"
#    And I click the "Search" button
#    And I wait for "SearchTip" will be invisible
#    And I choose the "count()" from the "DataField"
#    And I choose the "apache.clientip" from the "DivideField"
    And I click the "Add" button
    And I choose the "apache.method" from the "LastDivideField"
    And I click the "Save" button
    Then I will see the success message "保存成功"

    Examples:
      | name |
      | 条形图  |

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
      | name  |
      | 条形图 |

  Scenario Outline: 删除关于| 条形图 |的大屏
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-shanchuxuanting_icon" delete button
    Then I click the "Ensure" button

    Examples:
      |name|
      | 条形图 |