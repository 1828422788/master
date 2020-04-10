@galaxee
Feature: 数据大屏-弧形柱图

  Scenario: 新建默认类型的弧形柱图
#    Given I wait for title change text to "仪表盘"
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And I click the "Create" button
    And I set the parameter "Name" with value "弧形柱图"
    And I click the "Ensure" button
    And I click the "Chart" button
    And I click the "ArcBar" button
    And I click the "Style" button
    And I wait for "ArcBar" will be invisible
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "576"
    And I set the parameter "Height" with value "363"
    And I set the parameter "ChartXaxis" with value "0"
    And I set the parameter "ChartYaxis" with value "0"
    And I click the "Data" button
    And I set the parameter "SplInput" with value "tag:sample04061424_chart | stats count() by apache.clientip,apache.method"
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I choose the "apache.clientip" from the "RadialAxis"
    And I choose the "count()" from the "AngleAxis"
    And I wait for "Save" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"

  Scenario Outline: 修改配置
#    Given I wait for title change text to "仪表盘"
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "el-button el-button--text" edit button
    And switch to window "<name>"
    Then I will see the "galaxee.CreatePage" page
    And I click the "pictureOne" button

    And I click the "Style" button
    And I wait for "ArcBar" will be invisible
    And I wait for "RadiusAxis" will be visible
    And I click the "RadiusAxis" button
    And I set the parameter "RadiusAxisSize" with value "20"
    And I click the "RadiusAxisColor" button
    And I set the parameter "ColorInput" with value "#41F1F1"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    And I choose the "bold" from the "RadiusAxisBold"
    And I choose the "倾斜" from the "RadiusAxisAngle"
    And I click the "AngleAxisHeader" button
    And I set the parameter "AngleAxisSize" with value "20"
    And I click the "AngleAxisColor" button
    And I set the parameter "ColorInput" with value "#E3A6F2"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    And I choose the "lighter" from the "AngleAxisBold"
    And I click the "PolarCoordinates" button
    And I set the parameter "PolarXaxis" with value "40%"
    And I set the parameter "PolarYaxis" with value "60%"
    And I set the parameter "PolarRadius" with value "70%"
    And I click the "Example" button
    And I set the parameter "ExampleWordSize" with value "20"
    And I click the "ExampleColor" button
    And I set the parameter "ColorInput" with value "#D73535"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    And I choose the "lighter" from the "ExampleWordBold"
    And I choose the "居中" from the "ExampleHorizontal"
    And I choose the "顶部" from the "ExampleVertical"
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "510"
    And I set the parameter "Height" with value "378"
    And I set the parameter "ChartXaxis" with value "527"
    And I set the parameter "ChartYaxis" with value "208"
#    And I click the "Data" button
#    And I set the parameter "SplInput" with value "tag:sample04061424_chart | stats count() by apache.clientip,apache.method"
#    And I click the "Search" button
#    And I wait for "SearchTip" will be invisible
#    And I choose the "apache.clientip" from the "RadialAxis"
#    And I choose the "count()" from the "AngleAxis"
    And I wait for "Save" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"

    Examples:
      | name |
      | 弧形柱图 |

  Scenario Outline: 增加分组
#    Given I wait for title change text to "仪表盘"
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "el-button el-button--text" edit button
    And switch to window "<name>"
    Then I will see the "galaxee.CreatePage" page
    And I click the "pictureOne" button

    And I click the "Style" button
    And I wait for "ArcBar" will be invisible
    And I wait for "RadiusAxis" will be visible
    And I click the "RadiusAxis" button
    And I set the parameter "RadiusAxisSize" with value "20"
    And I click the "RadiusAxisColor" button
    And I set the parameter "ColorInput" with value "#41F1F1"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    And I choose the "bold" from the "RadiusAxisBold"
    And I choose the "倾斜" from the "RadiusAxisAngle"
    And I click the "AngleAxisHeader" button
    And I set the parameter "AngleAxisSize" with value "20"
    And I click the "AngleAxisColor" button
    And I set the parameter "ColorInput" with value "#E3A6F2"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    And I choose the "lighter" from the "AngleAxisBold"
    And I click the "PolarCoordinates" button
    And I set the parameter "PolarXaxis" with value "40%"
    And I set the parameter "PolarYaxis" with value "60%"
    And I set the parameter "PolarRadius" with value "70%"
    And I click the "Example" button
    And I set the parameter "ExampleWordSize" with value "20"
    And I click the "ExampleColor" button
    And I set the parameter "ColorInput" with value "#D73535"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    And I choose the "lighter" from the "ExampleWordBold"
    And I choose the "居中" from the "ExampleHorizontal"
    And I choose the "顶部" from the "ExampleVertical"
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "494"
    And I set the parameter "Height" with value "367"
    And I set the parameter "ChartXaxis" with value "73"
    And I set the parameter "ChartYaxis" with value "369"

    And I click the "Data" button
#    And I set the parameter "SplInput" with value "tag:sample04061424_chart | stats count() by apache.clientip,apache.method"
#    And I click the "Search" button
#    And I wait for "SearchTip" will be invisible
#    And I choose the "apache.clientip" from the "RadialAxis"
#    And I choose the "count()" from the "AngleAxis"
    And I click the "AddGroup" button
    And I choose the "apache.method" from the "Group"
    And I switch the "Pile" button to "enable"
    And I click the "Save" button
    Then I will see the success message "保存成功"

    Examples:
      | name |
      | 弧形柱图 |

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
      | 弧形柱图 |



  Scenario Outline: 删除关于 弧形柱图的大屏
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-shanchuxuanting_icon" delete button
    Then I click the "Ensure" button

    Examples:
      |name|
      | 弧形柱图 |