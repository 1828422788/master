@galaxee
Feature: 数据大屏-滚动列表三


  Scenario: 滚动列表3样式-搜索
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "滚动列表3样式-搜索"
    And I click the "Ensure" button
    #选择上方的图表
    And I click the "Chart" button
      #选择滚动列表三
    And I click the "rollList3" button
    And I hide the element "ChartDropdown"
#修改样式
    And I click the "Style" button
    # 1 设置图表尺寸位置
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "971"
    And I set the parameter "Height" with value "557"
    And I set the parameter "ChartXaxis" with value "406"
    And I set the parameter "ChartYaxis" with value "230"
    #2 设置滚动频率
    And I click the "roll" button
    And I set the parameter "rollF" with value "4"
    #3 设置外观
    And I click the "styleRollList3" button
    #字体大小
    And I set the parameter "RollList3WordSize" with value "28"
    #字体粗细
    And I choose the "bold" from the "RollList3WordBold"
    #单位不显示
    And I click the "danWei" button
    #4 全局样式修改名成
    And I click the "globalStyle" button
    And I set the parameter "globalStyleName" with value "滚动列表3样式修改"
    And I wait for "3000" millsecond
    #数据设置（数据源类型默认：搜索）
    And I click the "Data" button
    And I set the parameter "SplInput" with value "tag:sample04061424_chart | stats count(apache.clientip) as ip_count by apache.clientip | sort by ip_count | limit 10"
    And I click the "DateEditor" button
    And I click the "RecentSevenDay" button
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I set the parameter "updateFrequency" with value "0.1"

    And I choose the "apache.clientip" from the "scrollBarSearchName"
    And I choose the "ip_count" from the "ScrollBarSearchNumber"
     #保存
    And I wait for "Save" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"


  Scenario Outline: 滚动列表3样式-搜索发布并截图
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-fabu" release button
    And switch to window "<name>"

    And I wait for loading invisible
    Then take a screenshot with name "galaxee/<name>"

    Examples:
      |name              |
      |滚动列表3样式-搜索    |

######################################无耻的分割线################################

  Scenario: 滚动列表3数据之静态数据
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "滚动列表3数据之静态数据"
    And I click the "Ensure" button
       #选择上方的图表
    And I click the "Chart" button
      #选择滚动列表三
    And I click the "rollList3" button
    And I hide the element "ChartDropdown"
    # 设置图表尺寸位置
    And I click the "Style" button
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "971"
    And I set the parameter "Height" with value "557"
    And I set the parameter "ChartXaxis" with value "406"
    And I set the parameter "ChartYaxis" with value "230"
    #数据设置（数据源类型默认：搜索）
    And I click the "Data" button
    And I set the parameter "SplInput" with value "tag:sample04061424_chart | stats count(apache.clientip) as ip_count by apache.clientip | sort by ip_count | limit 10"
    And I click the "DateEditor" button
    And I click the "RecentSevenDay" button
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I set the parameter "updateFrequency" with value "0.1"
      #选择静态数据
    And I click the "dataSourceType" button
    And I click the "statisticsData" button
    And I click the "Ensure" button
    And I wait for "6000" millsecond

    And I choose the "apache.clientip" from the "scrollBarSearchName"
    And I choose the "ip_count" from the "ScrollBarSearchNumber"

    And I wait for "3000" millsecond
    #保存
    And I wait for "Save" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"


  Scenario Outline: 滚动列表3数据之静态数据发布并截图
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-fabu" release button
    And switch to window "<name>"

    And I wait for loading invisible
    Then take a screenshot with name "galaxee/<name>"

    Examples:
      |name            |
      |滚动列表3数据之静态数据 |


##################################无耻的分割线###############################


  Scenario: 滚动列表3数据之绑定搜索
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "滚动列表3数据之绑定搜索"
    And I click the "Ensure" button
      #在【其他】中添加一个【搜索】控件
    And I click the "Other" button
    And I click the "otherSearch" button
    And I set the parameter "SplInput" with value "tag:sample04061424_chart | stats count(apache.clientip) as ip_count by apache.clientip | sort by ip_count | limit 10"
    And I click the "DateEditor" button
    And I click the "RecentSevenDay" button
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I set the parameter "updateFrequency" with value "0.1"
      #添加一个滚动列表3控件
      #选择上方的图表
    And I click the "Chart" button
      #选择滚动列表三
    And I click the "rollList3" button
    And I hide the element "ChartDropdown"

    # 设置图表尺寸位置
    And I click the "Style" button
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "971"
    And I set the parameter "Height" with value "557"
    And I set the parameter "ChartXaxis" with value "406"
    And I set the parameter "ChartYaxis" with value "230"
      #在数据源类型中选择绑定搜索
    And I click the "Data" button
    And I click the "dataSourceType" button
    And I click the "bindingSearch" button
      #选择上步添加的搜索
    And I click the "bindingSearchChoose" button
    And I click the "search_widget" button
      #再次点击搜索控件中的【搜索按钮】
    And I click the "pictureTwo" button
    And I click the "pictureOne" button
    And I click the "Search" button
     #对滚动列表3的参数进行设置
    And I click the "pictureOne" button
    And I click the "pictureTwo" button
    And I click the "Data" button
    And I wait for "3000" millsecond

    And I choose the "apache.clientip" from the "scrollBarSearchName"
    And I choose the "ip_count" from the "ScrollBarSearchNumber"

    And I wait for "3000" millsecond
      #保存
    And I click the "Save" button
    Then I will see the success message "保存成功"


  Scenario Outline: 滚动列表3数据之绑定搜索发布并截图
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-fabu" release button
    And switch to window "<name>"

    And I wait for loading invisible
    Then take a screenshot with name "galaxee/<name>"

    Examples:
      |name              |
      |滚动列表3数据之绑定搜索 |


  Scenario Outline: 删除关于滚动列表3大屏
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-shanchuxuanting_icon" delete button
    Then I click the "Ensure" button

    Examples:
      |name|
      |滚动列表3样式-搜索    |
      |滚动列表3数据之绑定搜索 |
      |滚动列表3数据之静态数据 |