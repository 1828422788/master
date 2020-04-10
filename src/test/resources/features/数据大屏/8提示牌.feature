@galaxee
Feature: 数据大屏-揭示牌


    Scenario: 揭示牌样式搜索
#      Given I will see the "PublicNavBarPage" page
#      And I wait for "Dashboard" will be visible
      And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
      When I click the "Create" button
      Then I will see the "galaxee.CreatePage" page
      When I click the "Create" button
      And I set the parameter "Name" with value "揭示牌样式搜索"
      And I click the "Ensure" button
     #选择上方的指标
      And I click the "Index" button
      #选择提示牌
      And I click the "tipsCard" button
      And I hide the element "IndexDropdown"
#设置样式
      #1 设置图表尺寸位置
      And I click the "ChartPosition" button
      And I set the parameter "Width" with value "1000"
      And I set the parameter "Height" with value "1000"
      And I set the parameter "ChartXaxis" with value "600"
      And I set the parameter "ChartYaxis" with value "100"
      #2设置标题和缩放
      And I click the "styleTipsCard" button
      And I set the parameter "styleTipsCardTiTle" with value "交易金额超过量"
      And I set the parameter "styleTipsCardZoom" with value "2"

       #3 全局样式修改名成
      And I click the "globalStyle" button
      And I set the parameter "globalStyleName" with value "提示牌样式修改"

     #数据设置（数据源类型默认：搜索）
      And I click the "Data" button
      And I set the parameter "SplInput" with value "* | stats count() as num | eval p = num/28000"
      And I click the "DateEditor" button
      And I click the "RecentSevenDay" button
      And I click the "Search" button
      And I wait for "SearchTip" will be invisible
      And I set the parameter "updateFrequency" with value "0.1"
      And I choose the "num" from the "tipsCardNumber"
      #设置阈值以及显示值
      And I set the parameter "thresholdOne" with value "6"
      And I set the parameter "displayOne" with value "6亿"
      And I set the parameter "tipsOne" with value "同比上涨250%"

      And I set the parameter "thresholdTwo" with value "100000"
      And I set the parameter "displayTwo" with value "250亿"
      And I set the parameter "tipsTwo" with value "同比上涨350%"

    #保存
      And I wait for "Save" will be visible
      And I click the "Save" button
      Then I will see the success message "保存成功"


    Scenario Outline: 揭示牌数据之搜索发布并截图
#      Given I will see the "PublicNavBarPage" page
#      And I wait for "Dashboard" will be visible
      And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
      When the galaxee name is "<name>" then I click the "iconfont icon-fabu" release button
      And switch to window "<name>"
      And I close all tabs except main tab
      And I wait for loading invisible
      Then take a screenshot with name "galaxee/<name>"

      Examples:
        |name            |
        |揭示牌样式搜索   |



######################################无耻的分割线################################

    Scenario: 揭示牌数据之静态数据
#      Given I will see the "PublicNavBarPage" page
#      And I wait for "Dashboard" will be visible
      And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
      When I click the "Create" button
      Then I will see the "galaxee.CreatePage" page
      When I click the "Create" button
      And I set the parameter "Name" with value "揭示牌数据之静态数据"
      And I click the "Ensure" button
     #选择上方的指标
      And I click the "Index" button
      #选择提示牌
      And I click the "tipsCard" button
      And I hide the element "IndexDropdown"
     #数据设置（数据源类型默认：搜索）
      And I click the "Data" button
      And I set the parameter "SplInput" with value "* | stats count() as num | eval p = num/28000"
      And I click the "DateEditor" button
      And I click the "RecentSevenDay" button
      And I click the "Search" button
      And I wait for "SearchTip" will be invisible
      And I set the parameter "updateFrequency" with value "0.1"
      #选择静态数据
      And I click the "dataSourceType" button
      And I click the "statisticsData" button
      And I click the "Ensure" button
      And I wait for "1000" millsecond
      And I choose the "num" from the "tipsCardNumber"
      #设置阈值以及显示值
      And I set the parameter "thresholdOne" with value "6"
      And I set the parameter "displayOne" with value "6亿"
      And I set the parameter "tipsOne" with value "同比上涨250%"

      And I set the parameter "thresholdTwo" with value "100000"
      And I set the parameter "displayTwo" with value "250亿"
      And I set the parameter "tipsTwo" with value "同比上涨350%"

    #保存
      And I wait for "Save" will be visible
      And I click the "Save" button
      Then I will see the success message "保存成功"


    Scenario Outline: 揭示牌数据之静态数据发布并截图
#      Given I will see the "PublicNavBarPage" page
#      And I wait for "Dashboard" will be visible
      And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
      When the galaxee name is "<name>" then I click the "iconfont icon-fabu" release button
      And switch to window "<name>"
      And I close all tabs except main tab
      And I wait for loading invisible
      Then take a screenshot with name "galaxee/<name>"

      Examples:
        |name            |
        |揭示牌数据之静态数据   |

######################################无耻的分割线################################

    Scenario: 揭示牌数据之绑定搜索
#      Given I will see the "PublicNavBarPage" page
#      And I wait for "Dashboard" will be visible
      And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
      When I click the "Create" button
      Then I will see the "galaxee.CreatePage" page
      When I click the "Create" button
      And I set the parameter "Name" with value "揭示牌数据之绑定搜索"
      And I click the "Ensure" button
      #在【其他】中添加一个【搜索】控件
      And I click the "Other" button
      And I click the "otherSearch" button
      And I set the parameter "SplInput" with value "* | stats count() as num | eval p = num/28000"
      And I click the "DateEditor" button
      And I click the "RecentSevenDay" button
      And I click the "Search" button
      And I wait for "SearchTip" will be invisible
      And I set the parameter "updateFrequency" with value "0.1"
      #添加一个揭示牌控件
      #选择上方的指标
      And I click the "Index" button
      #选择提示牌
      And I click the "tipsCard" button
      And I hide the element "IndexDropdown"
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
     #设置阈值以及显示值
      And I click the "pictureOne" button
      And I click the "pictureTwo" button
      And I click the "Data" button
      And I wait for "3000" millsecond
      And I choose the "num" from the "tipsCardNumber"
      And I set the parameter "thresholdOne" with value "6"
      And I set the parameter "displayOne" with value "6亿"
      And I set the parameter "tipsOne" with value "同比上涨250%"

      And I set the parameter "thresholdTwo" with value "100000"
      And I set the parameter "displayTwo" with value "250亿"
      And I set the parameter "tipsTwo" with value "同比上涨350%"

      Then take a screenshot with name "galaxee/揭示牌数据之绑定搜索编辑页"
      #保存
      And I wait for "Save" will be visible
      And I click the "Save" button
      Then I will see the success message "保存成功"

    Scenario Outline: 揭示牌数据之绑定搜索发布并截图
#      Given I will see the "PublicNavBarPage" page
#      And I wait for "Dashboard" will be visible
      And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
      When the galaxee name is "<name>" then I click the "iconfont icon-fabu" release button
      And switch to window "<name>"
      And I close all tabs except main tab
      And I wait for loading invisible
      Then take a screenshot with name "galaxee/<name>"

      Examples:
        |name              |
        |揭示牌数据之绑定搜索 |


  Scenario Outline: 删除关于揭示牌的大屏
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-shanchuxuanting_icon" delete button
    Then I click the "Ensure" button

    Examples:
      |name|
      |揭示牌样式搜索   |
  |揭示牌数据之静态数据   |
  |揭示牌数据之绑定搜索 |












