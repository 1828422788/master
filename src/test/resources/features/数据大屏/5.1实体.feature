@galaxeeNet @galaxee  @galaxee2  @5.1
  Feature: 数据大屏-j实体
#    Background:
#      Given I will see the "PublicNavBarPage" page
#      And I wait for "Dashboard" will be visible

    Scenario: 实体数据之搜索值异常
#      Given I will see the "PublicNavBarPage" page
#      And I wait for "Dashboard" will be visible
      And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
      When I click the "Create" button
      Then I will see the "galaxee.CreatePage" page
      When I click the "Create" button
      And I set the parameter "Name" with value "实体数据之搜索值异常"
      And I click the "Ensure" button
      #选择上方的网络
      And I click the "net" button
      #选择实体
      And I click the "entity" button
      And I hide the element "netDropdown"
      And I click the "Style" button
      #实体样式的选择
      And I click the "entityStyle" button
      And I choose the "file" from the "entityStyleSelect"
      #数据设置
      And I click the "Data" button
      And I set the parameter "SplInput" with value "tag:sample04061424_chart | stats avg(apache.status) as err_avg"
#      And I click the "DateEditor" button
#      And I click the "RecentSevenDay" button
      And I click the "Search" button
      And I wait for "SearchTip" will be invisible
      And I set the parameter "updateFrequency" with value "0.1"
      And I choose the "err_avg" from the "entitySearchCategory"

      #保存
      And I wait for "Save" will be visible
      And I click the "Save" button
      And I wait for "SuccessMessage" will be visible
      Then I will see the success message "保存成功"



    Scenario Outline: 实体数据之搜索值异常发布并截图
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
        |name           |
        |实体数据之搜索值异常   |

######################################无耻的分割线################################


    Scenario: 实体数据之静态数据值严重
#      Given I will see the "PublicNavBarPage" page
#      And I wait for "Dashboard" will be visible
      And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
      When I click the "Create" button
      Then I will see the "galaxee.CreatePage" page
      When I click the "Create" button
      And I set the parameter "Name" with value "实体数据之静态数据值严重"
      And I click the "Ensure" button
      #选择上方的网络
      And I click the "net" button
      #选择实体
      And I click the "entity" button
      And I hide the element "netDropdown"
      And I click the "Style" button
      #实体样式的选择
      And I click the "entityStyle" button
      And I choose the "database" from the "entityStyleSelect"
      #数据设置
      And I click the "Data" button
      And I set the parameter "SplInput" with value "tag:sample04061424_chart | stats avg(apache.status) as err_avg"
#      And I click the "DateEditor" button
#      And I click the "RecentSevenDay" button
      And I click the "Search" button
      And I wait for "SearchTip" will be invisible
      And I set the parameter "updateFrequency" with value "0.1"
      And I choose the "err_avg" from the "entitySearchCategory"
      #选择静态数据
      And I drag the scroll bar to the element "dataType"
      And I click the "dataSourceType" button
      And I click the "statisticsData" button
      And I click the "Ensure" button
      And I wait for "tipsText" will be invisible

      And I choose the "err_avg" from the "entitySearchCategory"
      #设置值范围
      And I set the parameter "normalStart" with value "0"
      And I set the parameter "normalEnd" with value "100"

      And I set the parameter "abnormalStart" with value "100"
      And I set the parameter "abnormalEnd" with value "200"

      And I set the parameter "seriousStart" with value "200"
      And I set the parameter "seriousEnd" with value "300"
#保存
      And I wait for "Save" will be visible
      And I click the "Save" button
      And I wait for "SuccessMessage" will be visible
      Then I will see the success message "保存成功"


    Scenario Outline: 实体数据之静态数据值严重发布并截图
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
        |name           |
        |实体数据之静态数据值严重   |

######################################无耻的分割线################################


    Scenario: 实体数据之绑定搜索值正常
#      Given I will see the "PublicNavBarPage" page
#      And I wait for "Dashboard" will be visible
      And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
      When I click the "Create" button
      Then I will see the "galaxee.CreatePage" page
      When I click the "Create" button
      And I set the parameter "Name" with value "实体数据之绑定搜索"
      And I click the "Ensure" button
      #在【其他】中添加一个【搜索】控件
      And I click the "Other" button
      And I click the "otherSearch" button
      And I hide the element "otherDropdown"
      And I wait for "SplInput" will be visible
      And I set the parameter "SplInput" with value "tag:sample04061424_chart | stats avg(apache.status) as err_avg"
#      And I click the "DateEditor" button
#      And I click the "RecentSevenDay" button
      And I click the "Search" button
      And I wait for "SearchTip" will be invisible
      And I set the parameter "updateFrequency" with value "0.1"
      #添加一个实体控件
      #选择上方的网络
      And I click the "net" button
      #选择实体
      And I click the "entity" button
      And I hide the element "netDropdown"
      And I click the "Style" button
       #实体样式的选择
      And I click the "entityStyle" button
      And I choose the "cloud" from the "entityStyleSelect"
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
     #对实体的参数进行设置
      And I click the "pictureOne" button
      And I click the "Data" button

      And I choose the "err_avg" from the "entitySearchCategory"
      #设置值范围
      And I set the parameter "normalStart" with value "200"
      And I set the parameter "normalEnd" with value "300"

      And I set the parameter "abnormalStart" with value "300"
      And I set the parameter "abnormalEnd" with value "400"
      #保存
      And I wait for "Save" will be visible
      And I click the "Save" button
      And I wait for "SuccessMessage" will be visible
      Then I will see the success message "保存成功"


    Scenario Outline: 实体数据之绑定搜索发布并截图
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
        |实体数据之绑定搜索 |


