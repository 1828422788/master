@galaxeeWord @galaxee  @galaxee2  @4.2
Feature: 数据大屏-i表格

#  Background:
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible

  Scenario: 新建默认类型的表格
#    Given I wait for title change text to "仪表盘"
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And I click the "Create" button
    And I set the parameter "Name" with value "表格"
    And I click the "Ensure" button
    #选择表格控件
    And I click the "Word" button
    And I click the "Table" button
    And I hide the element "wordDropdown"
    #样式
    And I click the "Style" button
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I wait for "Width" will be visible
    And I set the parameter "Width" with value "551"
    And I set the parameter "Height" with value "500"
    And I set the parameter "ChartXaxis" with value "100"
    And I set the parameter "ChartYaxis" with value "100"
  #表头
    And I click the "TableHeader" button
    #字号
    And I set the parameter "TableHeaderWordSize" with value "20"
    #颜色
    And I click the "color" button
    And I wait for "ColorInput" will be visible
    And I set the parameter "ColorInput" with value "#783737"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    #字体粗细
    And I choose the "bolder" from the "TableHeaderBold"
    #背景颜色
    And I click the "TableHeaderBgColor" button
    And I wait for "ColorInput" will be visible
    And I set the parameter "ColorInput" with value "#D8DA44"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    #边框粗细
    And I set the parameter "TableHeadFrameBold" with value "6"
    #边框颜色
    And I click the "borderColor" button
    And I wait for "ColorInput" will be visible
    And I set the parameter "ColorInput" with value "#C279DD"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    #表头高度
    And I set the parameter "headHeight" with value "25"
  #单元格
    And I click the "TableCell" button
    #字号
    And I set the parameter "CellWordSize" with value "20"
    #颜色
    And I click the "tableColor" button
    And I wait for "ColorInput" will be visible
    And I set the parameter "ColorInput" with value "#787A13"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    #字体粗细
    And I choose the "lighter" from the "CellBold"
    #背景颜色
    And I click the "tableBgColor" button
    And I wait for "ColorInput" will be visible
    And I set the parameter "ColorInput" with value "#9BC577"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    #边框粗细
    And I set the parameter "CellFrameBold" with value "2"
    #边框颜色
    And I click the "tableFrameColor" button
    And I wait for "ColorInput" will be visible
    And I set the parameter "ColorInput" with value "#00CC96"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    #内边距
    And I set the parameter "tablePadding" with value "3"
    #显示行数
    And I set the parameter "tableShowRow" with value "7"
    #滚动间隔
    And I set the parameter "RowNumber" with value "4"
    #数据
    And I click the "Data" button
    And I set the parameter "SplInput" with value "tag:sample04061424 AND apache.x_forward:*1 | stats count() by apache.status,apache.clientip"
#    And I click the "DateEditor" button
#    And I click the "RecentSevenDay" button
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I choose the "apache.clientip,apache.status,count()" from the "DataItem"
    And I wait for "Save" will be visible
    And I click the "Save" button
    And I will see the success message "保存成功"


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
    #删除
    Then open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-shanchuxuanting_icon" delete button
    Then I click the "Ensure" button

    Examples:
      | name |
      | 表格   |

######################################无耻的分割线################################

  Scenario: 表格数据之静态数据
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "表格数据之静态数据"
    And I click the "Ensure" button
    #选择表格控件
    And I click the "Word" button
    And I click the "Table" button
    And I hide the element "wordDropdown"
    And I click the "Style" button
        #数据
    And I click the "Data" button
    And I set the parameter "SplInput" with value "tag:sample04061424 AND apache.x_forward:*1 | stats count() by apache.status,apache.clientip"
#    And I click the "DateEditor" button
#    And I click the "RecentSevenDay" button
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
      #选择静态数据
    And I click the "dataSourceType" button
    And I click the "statisticsData" button
    And I click the "Ensure" button
    And I wait for "tipsText" will be invisible

    And I choose the "apache.clientip,apache.status,count()" from the "DataItem"
      #保存
    And I wait for "Save" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"


  Scenario Outline: 表格数据之静态数据发布并截图
#      Given I will see the "PublicNavBarPage" page
#      And I wait for "Dashboard" will be visible
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-fabu" release button
    And switch to window "<name>"
    And I close all tabs except main tab
    And I wait for loading invisible
    Then take a screenshot with name "galaxee/<name>"
    #删除
    Then open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-shanchuxuanting_icon" delete button
    Then I click the "Ensure" button

    Examples:
      |name              |
      |表格数据之静态数据  |

 ######################################无耻的分割线################################


  Scenario: 表格数据之绑定搜索
#      Given I will see the "PublicNavBarPage" page
#      And I wait for "Dashboard" will be visible
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "表格数据之绑定搜索"
    And I click the "Ensure" button
      #在【其他】中添加一个【搜索】控件
    And I click the "Other" button
    And I click the "otherSearch" button
    And I wait for "SplInput" will be visible
    And I set the parameter "SplInput" with value "tag:sample04061424 AND apache.x_forward:*1 | stats count() by apache.status,apache.clientip"
#    And I click the "DateEditor" button
#    And I click the "RecentSevenDay" button
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I set the parameter "updateFrequency" with value "0.1"
    #选择表格控件
    And I click the "Word" button
    And I click the "Table" button
    And I hide the element "wordDropdown"
    And I click the "Style" button
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
     #对参数进行设置
    And I click the "pictureOne" button
    And I click the "Data" button

    And I choose the "apache.clientip,apache.status,count()" from the "DataItem"
      #保存
    And I click the "Save" button
    Then I will see the success message "保存成功"

  Scenario Outline: 表格数据之绑定搜索发布并截图
#      Given I will see the "PublicNavBarPage" page
#      And I wait for "Dashboard" will be visible
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-fabu" release button
    And switch to window "<name>"
    And I close all tabs except main tab
    And I wait for loading invisible
    Then take a screenshot with name "galaxee/<name>"
    #删除
    Then open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-shanchuxuanting_icon" delete button
    Then I click the "Ensure" button

    Examples:
      |name             |
      |表格数据之绑定搜索 |

