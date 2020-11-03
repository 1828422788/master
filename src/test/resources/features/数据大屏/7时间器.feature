 @galaxee  @galaxee2  @6.4
Feature: 数据大屏-o时间器
#  Background:
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible

  @v33gs
  Scenario: 时间器默认设置 RZY-3665
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "时间器默认设置"
    And I click the "Ensure" button
      #选择时间器
    And I wait for "500" millsecond
    And I move the mouse pointer to the "Other"
#    And I click the "Other" button
    And I wait for "Clock" will be visible
    And I click the "Clock" button
    And I hide the element "otherDropdown"
     #保存
    And I wait for "Save" will be visible
    And  I wait for "2000" millsecond
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存成功"



#  Scenario Outline: 时间器默认设置默认设置发布并截图
#    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
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
#      |name            |
#      |时间器默认设置    |

######################################无耻的分割线################################

  @v33gs
  Scenario: 时间器样式 RZY-3752,RZY-4346

    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "时间器样式"
    And I click the "Ensure" button
      #选择时间器
    And I wait for "500" millsecond
    And I move the mouse pointer to the "Other"
#    And I click the "Other" button
    And I wait for "Clock" will be visible
    And I click the "Clock" button
    And I hide the element "otherDropdown"
#设置样式
      #1 设置图表尺寸位置
    And I wait for "Style" will be visible
    And I click the "Style" button
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I wait for "Width" will be visible
    And I set the parameter "Width" with value "1000"
    And I set the parameter "Height" with value "250"
    And I set the parameter "ChartXaxis" with value "100"
    And I set the parameter "ChartYaxis" with value "400"
      #2设置时间器外观
    And I click the "styleClock" button
    #字体大小
    And I set the parameter "ClockWordSize" with value "40"
    #字体颜色
#     And I click the "clockFontColor" button
    And I wait for "clockFontColor" will be visible
    And I set the parameter "clockFontColor" with value "#E8EB1B"
    And I click the "EnsureColor" button
#    And I wait for "EnsureColor" will be invisible
    #字体粗细
    And I wait for "ClockWordBold" will be visible
    And I choose the "bold" from the "ClockWordBold"
    #对齐方式
    And I choose the "居左" from the "ClockHorizontal"
    #时间格式
    And I choose the "yyyy-MM-dd" from the "timeFormat"
      #3 全局样式修改名成
    And I click the "globalStyle" button
    And I set the parameter "globalStyleName" with value "时间器样式修改"
    And I wait for "1000" millsecond
    Then I will see the element "PictureOne" value is "时间器样式修改"
     #保存
    And I wait for "Save" will be visible
    And  I wait for "2000" millsecond
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存成功"



#  Scenario Outline: 时间器样式发布并截图
#
#    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
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
#      |name            |
#      |时间器样式   |

######################################无耻的分割线################################
  @v33gs
  Scenario: 时间器样式2 RZY-3665
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "时间器样式2"
    And I click the "Ensure" button
      #选择时间器
    And I wait for "500" millsecond
    And I move the mouse pointer to the "Other"
#    And I click the "Other" button
    And I wait for "Clock" will be visible
    And I click the "Clock" button
    And I hide the element "otherDropdown"
#设置样式
    And I wait for "Style" will be visible
    And I click the "Style" button
     #1 设置图表尺寸位置
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I wait for "Width" will be visible
    And I set the parameter "Width" with value "1000"
    And I set the parameter "Height" with value "250"
    And I set the parameter "ChartXaxis" with value "100"
    And I set the parameter "ChartYaxis" with value "400"
      #2设置齿轮组合外观
    And I click the "styleClock" button
    #字体粗细
    And  I wait for "1000" millsecond
    And I wait for "ClockWordBold" will be visible
    And I choose the "bolder" from the "ClockWordBold"
    #对齐方式
    And I choose the "居右" from the "ClockHorizontal"
    #时间格式
    And I choose the "yyyy-MM-dd hh:mm:ss" from the "timeFormat"
     #保存
    And I wait for "Save" will be visible
    And  I wait for "2000" millsecond
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存成功"


#
#  Scenario Outline: 时间器样式2发布并截图
#
#    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
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
#      |name            |
#      |时间器样式2   |

    ######################################无耻的分割线################################
  @v33gs
  Scenario: 时间器样式3

    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "时间器样式3"
    And I click the "Ensure" button
      #选择时间器
    And I wait for "500" millsecond
    And I move the mouse pointer to the "Other"
#    And I click the "Other" button
    And I wait for "Clock" will be visible
    And I click the "Clock" button
    And I hide the element "otherDropdown"
#设置样式
    And I wait for "Style" will be visible
    And I click the "Style" button
     #1 设置图表尺寸位置
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I wait for "Width" will be visible
    And I set the parameter "Width" with value "1000"
    And I set the parameter "Height" with value "250"
    And I set the parameter "ChartXaxis" with value "100"
    And I set the parameter "ChartYaxis" with value "400"
      #2设置齿轮组合外观
    And I click the "styleClock" button
    And  I wait for "500" millsecond
    #字体粗细
    And I wait for "ClockWordBold" will be visible
    And I choose the "lighter" from the "ClockWordBold"
    #对齐方式
    And I choose the "居中" from the "ClockHorizontal"
    #时间格式
    And I choose the "yyyy/MM/dd hh:mm:ss" from the "timeFormat"
#保存
    And I wait for "Save" will be visible
    And  I wait for "2000" millsecond
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存成功"


#
#  Scenario Outline: 时间器样式3发布并截图
#
#    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
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
#      |name            |
#      |时间器样式3   |



