 @galaxee @galaxee0 @1.16
Feature: 数据大屏-p环形柱图
#  Background:
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible

  Scenario: 环形柱图样式-搜索
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "环形柱图样式-搜索"
    And I click the "Ensure" button
      #选择环形柱图
    And I click the "Chart" button
    And I wait for "circularCylinderChart" will be visible
    And I click the "circularCylinderChart" button
# #设置样式
#   # 1 设置图表尺寸位置
    And I click the "Style" button
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And  I wait for "Width" will be visible
    And I set the parameter "Width" with value "884"
    And I set the parameter "Height" with value "680"
    And I set the parameter "ChartXaxis" with value "440"
    And I set the parameter "ChartYaxis" with value "188"
    #2 修改样式
    And I click the "styleCirCylChart" button
  #文本字体大小
    And I set the parameter "textFontSize" with value "20"
  #文本字体颜色
    And I click the "textFontColor" button
    And I wait for "ColorInput" will be visible
    And I set the parameter "ColorInput" with value "#E0CD41"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
  #文本字体粗细
    And I choose the "bolder" from the "TextWordBold"
  #环柱渐变色1
    And I click the "gradation1" button
    And I wait for "ColorInput" will be visible
    And I set the parameter "ColorInput" with value "#D931DC"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
  #环柱渐变色2
    And I click the "gradation2" button
    And I wait for "ColorInput" will be visible
    And I set the parameter "ColorInput" with value "#8CD927"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
  #环柱渐变色3
    And I click the "gradation3" button
    And I wait for "ColorInput" will be visible
    And I set the parameter "ColorInput" with value "#D75541"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    #3 全局样式修改名成
    And I click the "globalStyle" button
    And I set the parameter "globalStyleName" with value "环形柱图样式修改"
    #开启背景动画
    And I click the "backgroundAuto" button
   #数据设置（数据源类型默认：搜索）
    And I click the "Data" button
    And I set the parameter "SplInput" with value "tag:sample04061424_chart | stats count(apache.clientip) as ip_count by apache.clientip | limit 10"
#    And I click the "DateEditor" button
#    And I click the "RecentSevenDay" button
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I set the parameter "updateFrequency" with value "0.1"

    And I choose the "apache.clientip" from the "dataSearchLabel"
    And I wait for "dataSearchValue" will be visible
    And I choose the "ip_count" from the "dataSearchValue"
          #保存
    And I wait for "Save" will be visible
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存成功"

#  Scenario Outline: 环形柱图数据之样式搜索发布并截图
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
#      |name               |
#      |环形柱图样式-搜索   |


##################################无耻的分割线###############################

  Scenario: 环形柱图数据之静态数据
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "环形柱图数据之静态数据"
    And I click the "Ensure" button
          #选择环形柱图
    And I click the "Chart" button
    And I wait for "circularCylinderChart" will be visible
    And I click the "circularCylinderChart" button
    And I click the "Style" button

    And I click the "ChartPosition" button
    And I wait for "Width" will be visible
    And I set the parameter "Width" with value "884"
    And I set the parameter "Height" with value "680"
    And I set the parameter "ChartXaxis" with value "440"
    And I set the parameter "ChartYaxis" with value "188"
     #数据设置
    And I click the "Data" button
    And I set the parameter "SplInput" with value "tag:sample04061424_chart | stats count(apache.clientip) as ip_count by apache.clientip  | limit 10"
#    And I click the "DateEditor" button
#    And I click the "RecentSevenDay" button
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I set the parameter "updateFrequency" with value "0.1"
      #选择静态数据
    And I click the "dataSourceType" button
    And I click the "statisticsData" button
    And I click the "Ensure" button
    And I wait for "tipsText" will be invisible

    And I choose the "apache.clientip" from the "dataSearchLabel"
    And I wait for "dataSearchValue" will be visible
    And I choose the "ip_count" from the "dataSearchValue"

      #保存
    And I wait for "Save" will be visible
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存成功"


#  Scenario Outline: 环形柱图数据之静态数据发布并截图
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
#      |环形柱图数据之静态数据   |

######################################无耻的分割线################################

   Scenario: 环形柱图数据之绑定搜索
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "环形柱图数据之绑定搜索"
    And I click the "Ensure" button
      #在【其他】中添加一个【搜索】控件
    And I click the "Other" button
    And I click the "otherSearch" button
     And I hide the element "otherDropdown"
    And I wait for "SplInput" will be visible
    And I set the parameter "SplInput" with value "tag:sample04061424_chart | stats count(apache.clientip) as ip_count by apache.clientip  | limit 10"
#     And I click the "DateEditor" button
#     And I click the "RecentSevenDay" button
     And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I set the parameter "updateFrequency" with value "0.1"
            #选择环形柱图
     And I click the "Chart" button
     And I wait for "circularCylinderChart" will be visible
     And I click the "circularCylinderChart" button
     And I click the "Style" button

     And I click the "ChartPosition" button
     And I wait for "Width" will be visible
     And I set the parameter "Width" with value "884"
     And I set the parameter "Height" with value "680"
     And I set the parameter "ChartXaxis" with value "440"
     And I set the parameter "ChartYaxis" with value "188"
      #在数据源类型中选择绑定搜索
    And I click the "Data" button
    And I click the "dataSourceType" button
    And I click the "bindingSearch" button
      #选择上步添加的搜索
    And I click the "bindingSearchChoose" button
    And I click the "search_widget" button
      #再次点击搜索控件中的【搜索按钮】
    And I click the "pictureTwo" button
    And I click the "Search" button
     And I wait for "SearchTip" will be invisible
     #对占比图的参数进行设置
    And I click the "pictureOne" button
    And I click the "Data" button

    And I choose the "apache.clientip" from the "dataSearchLabel"
     And I wait for "dataSearchValue" will be visible
    And I choose the "ip_count" from the "dataSearchValue"
        #保存
     And I wait for "Save" will be visible
     And I click the "Save" button
     And I wait for "SuccessMessage" will be visible
     Then I will see the success message "保存成功"

#
#  Scenario Outline: 环形柱图数据之绑定搜索发布并截图
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
#      |name              |
#      |环形柱图数据之绑定搜索 |



