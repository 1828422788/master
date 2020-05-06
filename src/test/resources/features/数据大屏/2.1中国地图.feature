@galaxeeMap
Feature: 数据大屏-中国地图

  Scenario: 中国地图-样式搜索
   Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And I click the "Create" button
    And I set the parameter "Name" with value "中国地图-样式搜索"
    And I click the "Ensure" button
    #中国地图
    And I click the "Map" button
    And I click the "ChinaMap" button
#样式
    And I click the "Style" button
    And I click the "MapHeader" button
     #区域颜色
    And I click the "AreaColor" button
    And I set the parameter "ColorInput" with value "#9FF50B"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    #边界颜色
    And I click the "BoundaryColor" button
    And I set the parameter "ColorInput" with value "#0E0E0E"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    #标注类型
    And I choose the "气球" from the "MarkType"
    #缩放
    And I set the parameter "Scale" with value "1.5"
    #字体大小
    And I set the parameter "MapWordSize" with value "20"
    #字体颜色
    And I click the "WordColor" button
    And I set the parameter "ColorInput" with value "#F5CACA"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    #字体粗细
    And I choose the "bolder" from the "MapWordBold"
    #尺寸
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "618"
    And I set the parameter "Height" with value "406"
    And I set the parameter "ChartXaxis" with value "768"
    And I set the parameter "ChartYaxis" with value "0"
#数据-区域是中国
    And I click the "Data" button
    And I set the parameter "SplInput" with value "* | stats count() by apache.geo.province"
    And I click the "DateEditor" button
    And I click the "RecentSevenDay" button
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I set the parameter "updateFrequency" with value "0.1"

    And I choose the "apache.geo.province" from the "NameField"
    And I choose the "count()" from the "DataField"
     #设置值范围
    And I set the parameter "normalMin" with value "0"
    And I set the parameter "normalMax" with value "3"

    And I set the parameter "abnormalMin" with value "3"
    And I set the parameter "abnormalMax" with value "6"

    And I set the parameter "seriousMin" with value "6"
    And I set the parameter "seriousMax" with value "100"
    And I click the "Save" button
#    Then I will see the success message "保存成功"


  Scenario Outline: 中国地图-样式搜索发布并截图
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-fabu" release button
    And switch to window "<name>"
    And I close all tabs except main tab
    And I wait for loading invisible
    Then take a screenshot with name "galaxee/<name>"

    Examples:
      |name            |
      |中国地图-样式搜索   |

#####################################无耻的分割线################################


  Scenario: 中国地图四川-静态数据
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And I click the "Create" button
    And I set the parameter "Name" with value "中国地图四川-静态数据"
    And I click the "Ensure" button
    #中国地图
    And I click the "Map" button
    And I click the "ChinaMap" button
    #省份-四川
    And I click the "Style" button
    And I wait for "MapHeader" will be visible
    And I click the "MapHeader" button
    And I choose the "四川" from the "MapArea"
    #数据
    And I click the "Data" button
    And I set the parameter "SplInput" with value "* AND apache.geo.province:四川 | stats count() by apache.geo.city"
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

    And I choose the "apache.geo.city" from the "NameField"
    And I choose the "count()" from the "DataField"
    And I click the "Save" button
#    Then I will see the success message "保存成功"


  Scenario Outline: 中国地图四川-静态数据发布页截图
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-fabu" release button
    And switch to window "<name>"
    And I close all tabs except main tab
    And I wait for "Loading" will be invisible
    And I wait for "1000" millsecond
    Then take a screenshot with name "galaxee/<name>"

    Examples:
      | name |
      | 中国地图四川-静态数据 |

######################################无耻的分割线################################

  Scenario: 中国地图四川-绑定搜索
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    And I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "中国地图四川-绑定搜索"
    And I click the "Ensure" button
      #在【其他】中添加一个【搜索】控件
    And I click the "Other" button
    And I click the "otherSearch" button
    And I click the "Data" button
    And I set the parameter "SplInput" with value "* AND apache.geo.province:四川 | stats count() by apache.geo.city"
    And I click the "DateEditor" button
    And I click the "RecentSevenDay" button
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I set the parameter "updateFrequency" with value "0.1"
      #中国地图
    And I click the "Map" button
    And I click the "ChinaMap" button
    #省份-甘肃
    And I click the "Style" button
    And I wait for "MapHeader" will be visible
    And I click the "MapHeader" button
    And I choose the "四川" from the "MapArea"
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
    And I wait for "3000" millsecond

    And I choose the "apache.geo.city" from the "NameField"
    And I choose the "count()" from the "DataField"
      #保存
    And I click the "Save" button
#      Then I will see the success message "保存成功"


  Scenario Outline: 中国地图四川-绑定搜索发布并截图
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-fabu" release button
    And switch to window "<name>"
    And I close all tabs except main tab
    And I wait for loading invisible
    Then take a screenshot with name "galaxee/<name>"

    Examples:
      |name              |
      |中国地图四川-绑定搜索|


  Scenario Outline: 删除关于中国地图大屏
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-shanchu1" delete button
    Then I click the "Ensure" button

    Examples:
      |name|
      |中国地图-样式搜索   |
      | 中国地图四川-静态数据 |
      |中国地图四川-绑定搜索|