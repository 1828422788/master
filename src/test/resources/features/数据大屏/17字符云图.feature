@galaxeeLast
Feature: 数据大屏-字符云图


  Scenario: 字符云图样式-搜索
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "字符云图样式-搜索"
    And I click the "Ensure" button
     #选择上方的图表
    And I click the "Chart" button
    And I drag the scroll bar to the element "characterCloudChart"
      #选择字符云图
    And I click the "characterCloudChart" button
 #设置样式
   # 1 设置图表尺寸位置
    And I click the "Style" button
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "660"
    And I set the parameter "Height" with value "450"
    And I set the parameter "ChartXaxis" with value "520"
    And I set the parameter "ChartYaxis" with value "300"
   #2修改样式
    And I click the "styleCloudChart" button
    #图表起始颜色
    And I click the "chartStartColor" button
    And I click the "yellow" button
    #字体类型
    And I choose the "cursive" from the "fontType"
    #最大字号
    And I set the parameter "maxFont" with value "50"
    #3 全局样式修改名成
    And I click the "globalStyle" button
    And I set the parameter "globalStyleName" with value "字符云图样式修改"
#数据设置（数据源类型默认：搜索）
    And I click the "Data" button
    And I set the parameter "SplInput" with value "tag:*display | stats count() by apache.clientip | limit 5"
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I set the parameter "updateFrequency" with value "0.1"
    #数值字段
    And I choose the "count()" from the "cloudDataSearchNumber"
    #切分字段
    And I choose the "apache.clientip" from the "cloudDataSearchSegmentation"
       #保存
    And I click the "Save" button
    Then I will see the success message "保存成功"

  Scenario Outline: 字符云图样式-搜索发布并截图
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-fabu" release button
    And switch to window "<name>"
    And I close all tabs except main tab
    And I wait for loading invisible
    Then take a screenshot with name "galaxee/<name>"

    Examples:
      |name              |
      |字符云图样式-搜索    |


######################################无耻的分割线################################

  Scenario: 字符云图字体类型fantasy
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "字符云图字体类型fantasy"
    And I click the "Ensure" button
     #选择上方的图表
    And I click the "Chart" button
    And I drag the scroll bar to the element "characterCloudChart"
      #选择字符云图
    And I click the "characterCloudChart" button
    And I click the "Style" button
   #选择字体类型fantasy
    And I click the "styleCloudChart" button
    And I choose the "fantasy" from the "fontType"

    And I wait for "Save" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"

  Scenario Outline: 字符云图字体类型fantasy发布并截图
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-fabu" release button
    And switch to window "<name>"
    And I close all tabs except main tab
    And I wait for loading invisible
    Then take a screenshot with name "galaxee/<name>"

    Examples:
      |name              |
      |字符云图字体类型fantasy   |

######################################无耻的分割线################################
  Scenario: 字符云图数据之静态数据
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "字符云图数据之静态数据"
    And I click the "Ensure" button
    #选择上方的图表
    And I click the "Chart" button
    And I drag the scroll bar to the element "characterCloudChart"
      #选择字符云图
    And I click the "characterCloudChart" button
    And I click the "Style" button
     #选择字体类型serif
    And I click the "styleCloudChart" button
    And I choose the "serif" from the "fontType"
     #数据设置
    And I click the "Data" button
    And I set the parameter "SplInput" with value "tag:*display | stats count() by apache.clientip | limit 5"
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I set the parameter "updateFrequency" with value "0.1"
      #选择静态数据
    And I click the "dataSourceType" button
    And I click the "statisticsData" button
    And I click the "Ensure" button
    And I wait for "6000" millsecond
    #数值字段
    And I choose the "count()" from the "cloudDataSearchNumber"
    #切分字段
    And I choose the "apache.clientip" from the "cloudDataSearchSegmentation"

    #保存
    And I wait for "Save" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"


  Scenario Outline: 字符云图数据之静态数据发布并截图
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-fabu" release button
    And switch to window "<name>"
    And I close all tabs except main tab
    And I wait for loading invisible
    Then take a screenshot with name "galaxee/<name>"

    Examples:
      |name            |
      |字符云图数据之静态数据  |

######################################无耻的分割线################################


  Scenario: 字符云图数据之绑定搜索
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "字符云图数据之绑定搜索"
    And I click the "Ensure" button
      #在【其他】中添加一个【搜索】控件
    And I click the "Other" button
    And I click the "otherSearch" button
    And I set the parameter "SplInput" with value "tag:*display | stats count() by apache.clientip | limit 5"
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I set the parameter "updateFrequency" with value "0.1"
      #添加一个字符云图控件
     #选择上方的图表
    And I click the "Chart" button
    And I drag the scroll bar to the element "characterCloudChart"
      #选择字符云图
    And I click the "characterCloudChart" button
    And I click the "Style" button
    #选择字体类型monospace
    And I click the "styleCloudChart" button
    And I choose the "monospace" from the "fontType"
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
     #参数进行设置
    And I click the "pictureOne" button
    And I click the "pictureTwo" button
    And I click the "Data" button
    And I wait for "3000" millsecond
    #数值字段
    And I choose the "count()" from the "cloudDataSearchNumber"
    #切分字段
    And I choose the "apache.clientip" from the "cloudDataSearchSegmentation"
    Then take a screenshot with name "galaxee/字符云图数据之绑定搜索编辑页"
      #保存
    And I click the "Save" button
    Then I will see the success message "保存成功"

  Scenario Outline: 字符云图数据之绑定搜索发布并截图
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-fabu" release button
    And switch to window "<name>"
    And I close all tabs except main tab
    And I wait for loading invisible
    Then take a screenshot with name "galaxee/<name>"

    Examples:
      |name                |
      |字符云图数据之绑定搜索 |




  Scenario Outline: 删除关于字符云图大屏
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-shanchuxuanting_icon" delete button
    Then I click the "Ensure" button

    Examples:
      |name|
      |字符云图样式-搜索    |
      |字符云图字体类型fantasy   |
      |字符云图数据之静态数据  |
      |字符云图数据之绑定搜索 |