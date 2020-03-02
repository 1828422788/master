@galaxee
Feature: 时间器

  Scenario: 时间器默认设置
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "时间器默认设置"
    And I click the "Ensure" button
      #选择上方的其他
    And I click the "Other" button
      #选择时间器
    And I click the "Clock" button
      #保存
    And I wait for "Save" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"


  Scenario Outline: 时间器默认设置默认设置发布并截图
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-fabu" button
    And switch to window "<name>"
    And I wait for loading invisible
    Then take a screenshot with name "galaxee/<name>"

    Examples:
      |name            |
      |时间器默认设置    |

######################################无耻的分割线################################

  Scenario: 时间器样式
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "时间器样式"
    And I click the "Ensure" button
      #选择上方的其他
    And I click the "Other" button
      #选择时间器
    And I click the "Clock" button
#设置样式
      #1 设置图表尺寸位置
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "1000"
    And I set the parameter "Height" with value "250"
    And I set the parameter "ChartXaxis" with value "100"
    And I set the parameter "ChartYaxis" with value "400"
      #2设置时间器外观
    And I click the "styleClock" button
    #字体大小
    And I set the parameter "ClockWordSize" with value "40"
    #字体颜色
     And I click the "clockFontColor" button
    And I set the parameter "ColorInput" with value "#E8EB1B"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    #字体粗细
    And I choose the "bold" from the "ClockWordBold"
    #对齐方式
    And I choose the "居左" from the "ClockHorizontal"
    #时间格式
    And I choose the "yyyy-MM-dd" from the "timeFormat"
      #3 全局样式修改名成
    And I click the "globalStyle" button
    And I set the parameter "globalStyleName" with value "齿轮组合样式修改"
      #保存
    And I click the "Save" button
    Then I will see the success message "保存成功"


  Scenario Outline: 时间器样式发布并截图
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-fabu" button
    And switch to window "<name>"
    And I wait for loading invisible
    Then take a screenshot with name "galaxee/<name>"

    Examples:
      |name            |
      |时间器样式   |

######################################无耻的分割线################################

  Scenario: 时间器样式2
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "时间器样式2"
    And I click the "Ensure" button
      #选择上方的其他
    And I click the "Other" button
      #选择时间器
    And I click the "Clock" button
#设置样式
     #1 设置图表尺寸位置
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "1000"
    And I set the parameter "Height" with value "250"
    And I set the parameter "ChartXaxis" with value "100"
    And I set the parameter "ChartYaxis" with value "400"
      #2设置齿轮组合外观
    And I click the "styleClock" button
    #字体粗细
    And I choose the "bolder" from the "ClockWordBold"
    #对齐方式
    And I choose the "居右" from the "ClockHorizontal"
    #时间格式
    And I choose the "yyyy-MM-dd hh:mm:ss" from the "timeFormat"
      #保存
    And I wait for "Save" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"


  Scenario Outline: 时间器样式2发布并截图
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-fabu" button
    And switch to window "<name>"
    And I wait for loading invisible
    Then take a screenshot with name "galaxee/<name>"

    Examples:
      |name            |
      |时间器样式2   |

    ######################################无耻的分割线################################

  Scenario: 时间器样式3
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "时间器样式3"
    And I click the "Ensure" button
      #选择上方的其他
    And I click the "Other" button
      #选择时间器
    And I click the "Clock" button
#设置样式
     #1 设置图表尺寸位置
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "1000"
    And I set the parameter "Height" with value "250"
    And I set the parameter "ChartXaxis" with value "100"
    And I set the parameter "ChartYaxis" with value "400"
      #2设置齿轮组合外观
    And I click the "styleClock" button
    #字体粗细
    And I choose the "lighter" from the "ClockWordBold"
    #时间格式
    And I choose the "yyyy/MM/dd hh:mm:ss" from the "timeFormat"

      #保存
    And I wait for "Save" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"


  Scenario Outline: 时间器样式3发布并截图
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-fabu" button
    And switch to window "<name>"
    And I wait for loading invisible
    Then take a screenshot with name "galaxee/<name>"

    Examples:
      |name            |
      |时间器样式3   |
