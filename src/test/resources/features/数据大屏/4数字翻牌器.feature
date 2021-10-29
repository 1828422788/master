@galaxee @galaxee2   @2.6
Feature: 数据大屏-f数字翻牌器
#  Background:
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible

  Scenario: 数字翻牌器-静态数据
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And switch to another window
    And I close all tabs except main tab
    And I wait for "2000" millsecond
    And I click the "Create" button
    And I wait for "2000" millsecond
    And I set the parameter "Name" with value "数值翻牌器-静态数据"
    And I wait for "3000" millsecond
    And I click the "Ensure" button
    Then I will see the "galaxee.NewCreatePage" page
    And switch to another window
    And I close all tabs except main tab
    And I wait for "1500" millsecond

#    ===============================选择组件
    And I wait for "Module" will be visible
    And I click the "Moudle" button
    And I wait for "1000" millsecond
#    ==============================选择常规图表
    And I wait for "Index" will be visible
    And I click the "Index" button

#    ==============================数字翻牌器
    And I wait for "FlipNumber" will be visible
    And I click the "FlipNumber" button under some element
#    ==============================选择样式
    And I wait for "Style" will be visible
    And I click the "Style" button
    And I wait for "2000" millsecond
 #    ==============================图表布局
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I wait for "Width" will be visible
    And I set the parameter "Width" with value "760"
    And I wait for "1000" millsecond
    And I set the parameter "Height" with value "370"
    And I wait for "1000" millsecond
    And I set the parameter "ChartXaxis" with value "360"
    And I wait for "1000" millsecond
    And I set the parameter "ChartYaxis" with value "350"
    And I wait for "2000" millsecond

    #保存
    And I wait for "Save" will be visible
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存当前大屏成功"

#
#  Scenario Outline: 数值翻牌器-静态数据发布并截图
#    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
#    When the galaxee name is "<name>" then I click the "iconfont icon-fabu" release button
#    And switch to window "<name>"
#    And I close all tabs except main tab
#    And I wait for loading invisible
#    Then take a screenshot with name "galaxee/<name>"
#    #删除
#    Then open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
#    When the galaxee name is "<name>" then I click the "iconfont icon-shanchuxuanting_icon" delete button
#    Then I click the "Ensure" button
#
#    Examples:
#      |name              |
#      |数值翻牌器-静态数据  |

 #############################无耻的分割线################################

  Scenario: 数字翻牌器-样式搜索 RZY-1912,RZY-1967,RZY-1968
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And switch to another window
    And I close all tabs except main tab
    And I wait for "2000" millsecond
    And I click the "Create" button
    And I wait for "2000" millsecond
    And I set the parameter "Name" with value "数值翻牌器-样式搜索"
    And I wait for "3000" millsecond
    And I click the "Ensure" button
    Then I will see the "galaxee.NewCreatePage" page
    And switch to another window
    And I close all tabs except main tab
    And I wait for "1500" millsecond

#    ===============================选择组件
    And I wait for "Module" will be visible
    And I click the "Moudle" button
    And I wait for "1000" millsecond
#    ==============================选择常规图表
    And I wait for "Index" will be visible
    And I click the "Index" button

#    ==============================数字翻牌器
    And I wait for "FlipNumber" will be visible
    And I click the "FlipNumber" button under some element
#    ==============================选择样式
    And I wait for "Style" will be visible
    And I click the "Style" button
    And I wait for "2000" millsecond
 #    ==============================图表布局
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I wait for "Width" will be visible
    And I set the parameter "Width" with value "760"
    And I wait for "1000" millsecond
    And I set the parameter "Height" with value "370"
    And I wait for "1000" millsecond
    And I set the parameter "ChartXaxis" with value "360"
    And I wait for "1000" millsecond
    And I set the parameter "ChartYaxis" with value "350"

 #    ==============================全局
    And I wait for "ListOfTurnsAllStyles" will be visible
    And I click the "ListOfTurnsAllStyles" button
    And I wait for "1500" millsecond
    And I choose the "标题在左" from the "ArrangementMode"
    And I wait for "2000" millsecond
    And I set the parameter "flipSpacing" with value "25"
    And I wait for "2000" millsecond
    And I click the "ListOfTurnsAllStyles" button

#    ==============================标题
    And I click the "Title" button
    And I wait for "CirleTextStyle1" will be visible
    And I click the "CirleTextStyle1" button
    And I wait for "2000" millsecond
    And I set the parameter "CircleWorldSize1" with value "30"
    And I choose the "bolder" from the "CircleWorleBold1"
    And I set the parameter "CircleWorldColor1" with value "#D931DC"
    And I wait for "2000" millsecond
    And I click the "CirleTextStyle1" button
    And I wait for "2000" millsecond
    And I click the "Title" button
    And I wait for "2000" millsecond

    #    ==============================翻牌器
    And I wait for "DoubleDealer" will be visible
    And I click the "DoubleDealer" button
    And I choose the "居中对齐" from the "FlipNumberHorizontal"
    And I wait for "2000" millsecond
    And I set the parameter "BeforeSpacing" with value "28"
    And I set the parameter "AfterSpacing" with value "14"
    And I wait for "2000" millsecond

    #    ==============================前缀
    And I click the "Prefix" button
    And I set the parameter "PrefixText" with value "$"
    And I wait for "1000" millsecond
    And I click the "Prefix" button

#    ==============================数字
    And I click the "Number1" button
    And I wait for "1000" millsecond
    And I wait for "CirleTextStyle2" will be visible
    And I click the "CirleTextStyle2" button
    And I wait for "2000" millsecond
    And I set the parameter "CircleWorldSize2" with value "30"
    And I choose the "bolder" from the "CircleWorleBold2"
    And I set the parameter "CircleWorldColor2" with value "#D931DC"
    And I wait for "2000" millsecond
    And I click the "CirleTextStyle2" button
    And I wait for "2000" millsecond

    And I set the parameter "NumberSpacing" with value "15"
    And I set the parameter "FlipBackground" with value "#FFCC00"
    And I wait for "2000" millsecond
    And I set the parameter "RoundCorner" with value "40"
    And I set the parameter "DecimalPlaces" with value "3"
    And I wait for "2000" millsecond
    And I set the parameter "FixedWidth" with value "35"
    And I click the "DataJitterCorrection" button
    And I click the "OpenAnimation" button
    And I wait for "2000" millsecond
    And I click the "Number1" button
#    ==============================后缀
    And I click the "Suffix" button
    And I set the parameter "SuffixText" with value "¥"
    And I wait for "1000" millsecond
    And I click the "Suffix" button

    And I wait for "2000" millsecond
    And I click the "DoubleDealer" button

#    ===============================================数据
    And I wait for "Data" will be visible
    And I click the "Data" button
    And I choose the "SPL" from the "DataSourceType"
    And I wait for "2000" millsecond
    And I click the "DataCon" button
    And I wait for "SplInput" will be visible
    And I set the parameter "SplInput" with value "tag:sample04061424_display  | stats count() by apache.resp_len"
    And I wait for "2000" millsecond

    And I click the "DateEditor" button
    And I click the "WholeTime" button
    And I wait for "2000" will be visible

    And I click the "Search" button
    And I wait for "6000" millsecond
    And I wait for "SearchTip" will be visible
    And I click the "CloseData" button
    And I wait for "2000" millsecond
    And I set the parameter "DataField" with value "count()"
    And I wait for "2000" millsecond
    And I click the "UpdateData" button
    And I set the parameter "updateFrequency" with value "1"

    And I wait for element "DataFieldText1" change text to "匹配成功"
    And I wait for "2000" millsecond

#   ==========================================保存
    And I wait for "Save" will be visible
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存当前大屏成功"

#
#  Scenario Outline: 数值翻牌器-样式搜索发布并截图
#    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
#    When the galaxee name is "<name>" then I click the "iconfont icon-fabu" release button
#    And switch to window "<name>"
#    And I close all tabs except main tab
#    And I wait for loading invisible
#    Then take a screenshot with name "galaxee/<name>"
#    #删除
#    Then open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
#    When the galaxee name is "<name>" then I click the "iconfont icon-shanchuxuanting_icon" delete button
#    Then I click the "Ensure" button
#
#    Examples:
#      |name              |
#      |数值翻牌器-样式搜索 |



