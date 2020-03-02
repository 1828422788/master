@galaxee
Feature: 综合列表

  Scenario: 综合列表默认设置
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "综合列表默认设置"
    And I click the "Ensure" button
      #选择上方的图表
    And I click the "Chart" button
      #选择综合列表
    And I click the "comprehensiveList" button
    And I hide the element "ChartDropdown"
       #保存
    And I wait for "Save" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"


  Scenario Outline: 综合列表默认设置发布并截图
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-fabu" button
    And switch to window "<name>"
    And I wait for loading invisible
    Then take a screenshot with name "galaxee/<name>"

    Examples:
      |name              |
      |综合列表默认设置    |

######################################无耻的分割线################################

  Scenario: 综合列表样式
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "综合列表样式"
    And I click the "Ensure" button
      #选择上方的图表
    And I click the "Chart" button
      #选择综合列表
    And I click the "comprehensiveList" button
    And I hide the element "ChartDropdown"
#修改样式
    # 1 设置图表尺寸位置
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "770"
    And I set the parameter "Height" with value "770"
    And I set the parameter "ChartXaxis" with value "448"
    And I set the parameter "ChartYaxis" with value "145"
    #2 设置滚动频率
    And I click the "roll" button
    And I set the parameter "rollF" with value "5"
    #3 设置外观
    And I click the "styleComprehensiveList" button

    #标题颜色
    And I click the "listTitleColor" button
    And I set the parameter "ColorInput" with value "#DEE119"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    #数值颜色
    And I click the "numberColor" button
    And I set the parameter "ColorInput" with value "#58DA29"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    #条颜色
    And I click the "aspectColor" button
    And I set the parameter "ColorInput" with value "#E047FF"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    #缩略比例
    And I choose the "1" from the "abbRatio"
    #单位不显示
    And I click the "danWei" button
    #4 全局样式修改名成
    And I click the "globalStyle" button
    And I set the parameter "globalStyleName" with value "综合列表样式修改"
    And I wait for "3000" millsecond
    Then take a screenshot with name "galaxee/综合列表样式编辑页"
     #保存
    And I wait for "Save" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"


  Scenario Outline: 综合列表样式发布并截图
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-fabu" button
    And switch to window "<name>"
    And I wait for loading invisible
    Then take a screenshot with name "galaxee/<name>"

    Examples:
      |name              |
      |综合列表样式    |

######################################无耻的分割线################################


  Scenario: 综合列表数据之搜索
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "综合列表数据之搜索"
    And I click the "Ensure" button
     #选择上方的图表
    And I click the "Chart" button
      #选择综合列表
    And I click the "comprehensiveList" button
    And I hide the element "ChartDropdown"
     #设置图表尺寸位置
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "770"
    And I set the parameter "Height" with value "770"
    And I set the parameter "ChartXaxis" with value "448"
    And I set the parameter "ChartYaxis" with value "145"
    #数据设置（数据源类型默认：搜索）
    And I click the "Data" button
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I set the parameter "updateFrequency" with value "0.1"

    And I choose the "hostname" from the "scrollBarSearchName"
    And I choose the "spk" from the "ScrollBarSearchNumber"
    #保存
    And I wait for "3000" millsecond
    And I click the "Save" button
    Then I will see the success message "保存成功"


  Scenario Outline: 综合列表数据之搜索发布并截图
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-fabu" button
    And switch to window "<name>"
    And I wait for loading invisible
    Then take a screenshot with name "galaxee/<name>"

    Examples:
      |name               |
      |综合列表数据之搜索   |


##################################无耻的分割线###############################

  Scenario: 综合列表数据之静态数据
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "综合列表数据之静态数据"
    And I click the "Ensure" button
       #选择上方的图表
    And I click the "Chart" button
      #选择综合列表
    And I click the "comprehensiveList" button
    And I hide the element "ChartDropdown"
     #设置图表尺寸位置
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "770"
    And I set the parameter "Height" with value "770"
    And I set the parameter "ChartXaxis" with value "448"
    And I set the parameter "ChartYaxis" with value "145"
    #数据设置（数据源类型默认：搜索）
    And I click the "Data" button

    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I set the parameter "updateFrequency" with value "0.1"
      #选择静态数据
    And I click the "dataSourceType" button
    And I click the "statisticsData" button
    And I click the "Ensure" button
    And I wait for "6000" millsecond

    And I choose the "hostname" from the "scrollBarSearchName"
    And I choose the "spk" from the "ScrollBarSearchNumber"
    And I wait for "3000" millsecond
    #保存
    And I wait for "Save" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"


  Scenario Outline: 综合列表数据之静态数据发布并截图
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-fabu" button
    And switch to window "<name>"
    And I wait for loading invisible
    Then take a screenshot with name "galaxee/<name>"

    Examples:
      |name            |
      |综合列表数据之静态数据  |

##################################无耻的分割线###############################

  Scenario: 综合列表数据之绑定搜索
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "综合列表数据之绑定搜索"
    And I click the "Ensure" button
      #在【其他】中添加一个【搜索】控件
    And I click the "Other" button
    And I click the "otherSearch" button
    And I set the parameter "SplInput" with value "* | stats sparkline(count(), 1m) as spk by hostname"

    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I set the parameter "updateFrequency" with value "0.1"
      #添加一个综合列表的控件
      #选择上方的图表
    And I click the "Chart" button
      #选择综合列表
    And I click the "comprehensiveList" button
    And I hide the element "ChartDropdown"
     #设置图表尺寸位置
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "770"
    And I set the parameter "Height" with value "770"
    And I set the parameter "ChartXaxis" with value "448"
    And I set the parameter "ChartYaxis" with value "145"

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
     #对综合列表的参数进行设置
    And I click the "pictureOne" button
    And I click the "pictureTwo" button
    And I click the "Data" button
    And I wait for "3000" millsecond
    And I choose the "hostname" from the "scrollBarSearchName"
    And I choose the "spk" from the "ScrollBarSearchNumber"
    And I wait for "3000" millsecond
      #保存
    And I click the "Save" button
    Then I will see the success message "保存成功"


  Scenario Outline: 综合列表数据之绑定搜索发布并截图
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-fabu" button
    And switch to window "<name>"
    And I wait for loading invisible
    Then take a screenshot with name "galaxee/<name>"

    Examples:
      |name              |
      |综合列表数据之绑定搜索 |

