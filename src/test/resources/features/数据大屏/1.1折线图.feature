@galaxee
Feature: 数据大屏-折线图

  Scenario Outline: RZY-1931:编辑大屏流程
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And I click the "Create" button
    And I set the parameter "Name" with value "<name>"
    And I click the "Ensure" button
    And I wait for "Chart" will be visible
    And I click the "Chart" button
    And I click the "Line" button
    And I click the "Style" button
    And I wait for "Line" will be invisible
    And I click the "Data" button
    And I set the parameter "SplInput" with value "* | bucket timestamp span=450s as ts| stats count() by ts | sort by +ts"
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I choose the "ts" from the "Xaxis"
    And I choose the "count()" from the "Yaxis"
    And I click the "Style" button
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "1100"
    And I set the parameter "Height" with value "569"
    And I set the parameter "ChartXaxis" with value "280"
    And I set the parameter "ChartYaxis" with value "230"
    And I wait for "Save" will be visible
    And I click the "Save" button
#    Then I will see the success message "保存成功"

    Examples:
      | name |
      | 折线图  |

  Scenario Outline: 折线图设置

    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "el-button el-button--text" edit button
    And switch to window "<name>"
    And I close all tabs except main tab
    Then I will see the "galaxee.CreatePage" page
    And I click the "pictureOne" button
#样式
    And I click the "Style" button
#X轴设置
    And I click the "XaxisHeader" button
    #文本
    And I set the parameter "XaxisWordSize" with value "20"
    And I click the "XaxisWordColor" button
    And I set the parameter "ColorInput" with value "#CF3131"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    And I choose the "bold" from the "XaxisWordBold"
    #轴标签
    And I set the parameter "XaxisShift" with value "5"
    And I choose the "倾斜" from the "XaxisAngle"
    And I switch the "XaxisSeparator" button to "enable"
#Y轴设置
    And I click the "YaxisHeader" button
    And I set the parameter "YaxisWordSize" with value "20"
    And I click the "YaxisWordColor" button
    And I set the parameter "ColorInput" with value "#19B535"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    And I choose the "lighter" from the "YaxisWordBold"
    And I set the parameter "YaxisShift" with value "10"
    And I choose the "倾斜" from the "YaxisAngle"
    And I switch the "YaxisSeparator" button to "disable"
    And I click the "Example" button
    And I set the parameter "ExampleWordSize" with value "20"
    And I click the "ExampleColor" button
    And I set the parameter "ColorInput" with value "#D73535"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    And I choose the "lighter" from the "ExampleWordBold"
    And I choose the "居中" from the "ExampleHorizontal"
    And I choose the "顶部" from the "ExampleVertical"
    And I click the "Layout" button
    And I set the parameter "LayoutBottom" with value "20"
    And I set the parameter "LayoutLeft" with value "20"
    And I set the parameter "LayoutRight" with value "20"

    And I click the "DataSeries" button
    And I wait for "DataSeriesColor" will be visible
    And I click the "DataSeriesColor" button
    And I set the parameter "ColorInput" with value "#D73535"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible

    And I set the parameter "DataSeriesBold" with value "5"
    And I click the "Smooth" button
    And I click the "Area" button

    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "1000"
    And I set the parameter "height" with value "300"
    And I set the parameter "ChartXaxis" with value "0"
    And I set the parameter "ChartYaxis" with value "207"
    And I click the "Save" button
#    Then I will see the success message "保存成功"

    Examples:
      | name |
      | 折线图  |

  Scenario Outline: 折线图设置增加分组
#    Given I wait for title change text to "仪表盘"
   And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "el-button el-button--text" edit button
    And switch to window "<name>"
    And I close all tabs except main tab
    Then I will see the "galaxee.CreatePage" page
    And I click the "pictureOne" button

    And I click the "Data" button

    And I click the "AddGroup" button
    And I choose the "count()" from the "Group"

    And I click the "Style" button
    And I click the "XaxisHeader" button
    And I set the parameter "XaxisWordSize" with value "20"
    And I click the "XaxisWordColor" button
    And I set the parameter "ColorInput" with value "#CF3131"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    And I choose the "bold" from the "XaxisWordBold"
    And I set the parameter "XaxisShift" with value "5"
    And I choose the "倾斜" from the "XaxisAngle"
    And I switch the "XaxisSeparator" button to "enable"
    And I click the "YaxisHeader" button
    And I set the parameter "YaxisWordSize" with value "20"
    And I click the "YaxisWordColor" button
    And I set the parameter "ColorInput" with value "#19B535"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    And I choose the "lighter" from the "YaxisWordBold"
    And I set the parameter "YaxisShift" with value "10"
    And I choose the "倾斜" from the "YaxisAngle"
    And I switch the "YaxisSeparator" button to "disable"
    And I click the "Example" button
    And I set the parameter "ExampleWordSize" with value "20"
    And I click the "ExampleColor" button
    And I set the parameter "ColorInput" with value "#D73535"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    And I choose the "lighter" from the "ExampleWordBold"
    And I choose the "居中" from the "ExampleHorizontal"
    And I choose the "顶部" from the "ExampleVertical"
    And I click the "Layout" button
    And I set the parameter "LayoutBottom" with value "20"
    And I set the parameter "LayoutLeft" with value "20"
    And I set the parameter "LayoutRight" with value "20"
    And I click the "DataSeries" button
    And I wait for "DataSeriesColor" will be visible
    And I click the "DataSeriesColor" button
    And I set the parameter "ColorInput" with value "#D73535"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible

    And I set the parameter "DataSeriesBold" with value "5"
    And I click the "Smooth" button
    And I click the "Area" button
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "1000"
    And I set the parameter "height" with value "300"
    And I set the parameter "ChartXaxis" with value "0"
    And I set the parameter "ChartYaxis" with value "500"
    And I click the "Save" button
#    Then I will see the success message "保存成功"

    Examples:
      | name |
      | 折线图  |

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
      | 折线图 |




  Scenario Outline: 删除关于|折线图|的大屏
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-shanchuxuanting_icon" delete button
    Then I click the "Ensure" button

    Examples:
      |name|
      | 折线图 |