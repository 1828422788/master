@galaxeeIndex @galaxee
Feature: 数据大屏-数值翻牌器
  Background:
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible


  Scenario: 数值翻牌器-样式搜索
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And I click the "Create" button
    And I set the parameter "Name" with value "数值翻牌器-样式搜索"
    And I click the "Ensure" button
    #选择数值翻牌器
    And I click the "Index" button
    And I click the "FlipNumber" button
    And I hide the element "IndexDropdown"
    #样式
    And I click the "Style" button
    And I click the "Flip" button
      #字体
    And I choose the "DINPro-Bold" from the "FlipWord"
    #字体大小
    And I set the parameter "FlipWordSize" with value "62"
    #字体颜色
    And I click the "numberFontColor" button
    And I set the parameter "ColorInput" with value "#D74B7A"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    #字体粗细
    And I choose the "bold" from the "FlipNumberWordBold"
    #对齐
    And I choose the "居左" from the "FlipNumberHorizontal"
    #前后缀
    And I set the parameter "Prefix" with value "$"
    And I set the parameter "Suffix" with value "¥"
    #样式1
    And I choose the "样式1" from the "FlipBackgroundStyle"
    #间距
    And I set the parameter "flipSpacing" with value "2"
    #样式尺寸
    And I click the "Style" button
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "760"
    And I set the parameter "Height" with value "370"
    And I set the parameter "ChartXaxis" with value "360"
    And I set the parameter "ChartYaxis" with value "350"
    #数据
    And I click the "Data" button
    And I set the parameter "SplInput" with value "tag:sample* | stats count() by apache.clientip,apache.method,apache.resp_len"
    And I click the "DataSearch" button
    And I wait for "SearchTip" will be invisible

    And I choose the "count()" from the "Type"
    And I wait for "Save" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"


  Scenario Outline: 数值翻牌器-样式搜索发布并截图
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
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
      |数值翻牌器-样式搜索 |

#############################无耻的分割线################################

  Scenario: 数值翻牌器-静态数据
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "数值翻牌器-静态数据"
    And I click the "Ensure" button
     #选择数值翻牌器
    And I click the "Index" button
    And I click the "FlipNumber" button
    And I hide the element "IndexDropdown"
    And I click the "Style" button
     #字体
    And I click the "Flip" button
    And I choose the "HENB" from the "FlipWord"
     #数据设置
    And I click the "Data" button
    And I set the parameter "SplInput" with value "tag:sample* | stats count() by apache.clientip,apache.method,apache.resp_len"
    And I click the "DataSearch" button
    And I wait for "SearchTip" will be invisible
    And I set the parameter "updateFrequency" with value "0.1"
      #选择静态数据
    And I click the "dataSourceType" button
    And I click the "statisticsData" button
    And I click the "Ensure" button
    And I wait for "6000" millsecond

    And I choose the "count()" from the "Type"
      #保存
    And I wait for "Save" will be visible
    And I click the "Save" button
      Then I will see the success message "保存成功"


  Scenario Outline: 数值翻牌器-静态数据发布并截图
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
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
      |数值翻牌器-静态数据  |

 ######################################无耻的分割线################################


  Scenario: 数值翻牌器-绑定搜索
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "数值翻牌器-绑定搜索"
    And I click the "Ensure" button
      #在【其他】中添加一个【搜索】控件
    And I click the "Other" button
    And I click the "otherSearch" button
    And I set the parameter "SplInput" with value "tag:sample* | stats count() by apache.clientip,apache.method,apache.resp_len"
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I set the parameter "updateFrequency" with value "0.1"
     #选择数值翻牌器
    And I click the "Index" button
    And I click the "FlipNumber" button
    And I hide the element "IndexDropdown"
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
     #对Top3的参数进行设置
    And I click the "pictureOne" button
    And I click the "Data" button
    And I wait for "2000" millsecond

    And I choose the "count()" from the "Type"
      #保存
    And I click the "Save" button
      Then I will see the success message "保存成功"

  Scenario Outline: 数值翻牌器-绑定搜索发布并截图
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
      |数值翻牌器-绑定搜索 |

