@galaxee
  Feature: 数据大屏-实体

    Scenario: 实体默认设置
#      Given I will see the "PublicNavBarPage" page
#      And I wait for "Dashboard" will be visible
      And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
      When I click the "Create" button
      Then I will see the "galaxee.CreatePage" page
      When I click the "Create" button
      And I set the parameter "Name" with value "实体默认设置"
      And I click the "Ensure" button
      #选择上方的网络
      And I click the "net" button
      #选择实体
      And I click the "entity" button
      And I hide the element "netDropdown"
       #保存
      And I wait for "Save" will be visible
      And I click the "Save" button
      Then I will see the success message "保存成功"


    Scenario Outline: 实体默认设置发布并截图
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
        |实体默认设置      |

######################################无耻的分割线################################

    Scenario: 实体样式
#      Given I will see the "PublicNavBarPage" page
#      And I wait for "Dashboard" will be visible
      And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
      When I click the "Create" button
      Then I will see the "galaxee.CreatePage" page
      When I click the "Create" button
      And I set the parameter "Name" with value "实体样式"
      And I click the "Ensure" button
      #选择上方的网络
      And I click the "net" button
      #选择实体
      And I click the "entity" button
      And I hide the element "netDropdown"
#设置样式
      And I click the "Style" button
      #1 设置图表尺寸位置
      And I click the "ChartPosition" button
      And I set the parameter "Width" with value "400"
      And I set the parameter "Height" with value "300"
      And I set the parameter "ChartXaxis" with value "700"
      And I set the parameter "ChartYaxis" with value "400"
      #2实体样式的选择
      And I click the "entityStyle" button
     And I choose the "user" from the "entityStyleSelect"
       #3 全局样式修改名成
      And I click the "globalStyle" button
      And I set the parameter "globalStyleName" with value "实体样式"
      #开启背景动画
      And I click the "backgroundAuto" button
       #保存
      And I click the "Save" button
      Then I will see the success message "保存成功"


    Scenario Outline: 实体样式发布并截图
#      Given I will see the "PublicNavBarPage" page
#      And I wait for "Dashboard" will be visible
      And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
      When the galaxee name is "<name>" then I click the "iconfont icon-fabu" release button
      And switch to window "<name>"
      And I close all tabs except main tab
      And I wait for loading invisible
      Then take a screenshot with name "galaxee/<name>"

      Examples:
        |name        |
        |实体样式     |

######################################无耻的分割线################################


    Scenario: 实体样式firewall
#      Given I will see the "PublicNavBarPage" page
#      And I wait for "Dashboard" will be visible
      And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
      When I click the "Create" button
      Then I will see the "galaxee.CreatePage" page
      When I click the "Create" button
      And I set the parameter "Name" with value "实体样式firewall"
      And I click the "Ensure" button
      #选择上方的网络
      And I click the "net" button
      #选择实体
      And I click the "entity" button
      And I hide the element "netDropdown"
      And I click the "Style" button
      #实体样式的选择
      And I click the "entityStyle" button
      And I choose the "firewall" from the "entityStyleSelect"
       #保存
      And I wait for "Save" will be visible
      And I wait for "2000" millsecond
      And I click the "Save" button
      Then I will see the success message "保存成功"


    Scenario Outline: 实体样式firewall发布并截图
#      Given I will see the "PublicNavBarPage" page
#      And I wait for "Dashboard" will be visible
      And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
      When the galaxee name is "<name>" then I click the "iconfont icon-fabu" release button
      And switch to window "<name>"
      And I close all tabs except main tab
      And I wait for loading invisible
      Then take a screenshot with name "galaxee/<name>"

      Examples:
        |name           |
        |实体样式firewall     |

######################################无耻的分割线################################

    Scenario: 实体样式router1
#      Given I will see the "PublicNavBarPage" page
#      And I wait for "Dashboard" will be visible
      And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
      When I click the "Create" button
      Then I will see the "galaxee.CreatePage" page
      When I click the "Create" button
      And I set the parameter "Name" with value "实体样式router1"
      And I click the "Ensure" button
      #选择上方的网络
      And I click the "net" button
      #选择实体
      And I click the "entity" button
      And I hide the element "netDropdown"
      And I click the "Style" button
      #实体样式的选择
      And I click the "entityStyle" button
      And I choose the "router1" from the "entityStyleSelect"
       #保存
      And I wait for "Save" will be visible
      And I wait for "2000" millsecond
      And I click the "Save" button
      Then I will see the success message "保存成功"


    Scenario Outline: 实体样式router1发布并截图
#      Given I will see the "PublicNavBarPage" page
#      And I wait for "Dashboard" will be visible
      And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
      When the galaxee name is "<name>" then I click the "iconfont icon-fabu" release button
      And switch to window "<name>"
      And I close all tabs except main tab
      And I wait for loading invisible
      Then take a screenshot with name "galaxee/<name>"

      Examples:
        |name           |
        |实体样式router1     |

######################################无耻的分割线################################

    Scenario: 实体样式router2
#      Given I will see the "PublicNavBarPage" page
#      And I wait for "Dashboard" will be visible
      And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
      When I click the "Create" button
      Then I will see the "galaxee.CreatePage" page
      When I click the "Create" button
      And I set the parameter "Name" with value "实体样式router2"
      And I click the "Ensure" button
      #选择上方的网络
      And I click the "net" button
      #选择实体
      And I click the "entity" button
      And I hide the element "netDropdown"
      And I click the "Style" button
      #实体样式的选择
      And I click the "entityStyle" button
      And I choose the "router2" from the "entityStyleSelect"
       #保存
      And I wait for "Save" will be visible
      And I wait for "2000" millsecond
      And I click the "Save" button
      Then I will see the success message "保存成功"


    Scenario Outline: 实体样式router2发布并截图
#      Given I will see the "PublicNavBarPage" page
#      And I wait for "Dashboard" will be visible
      And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
      When the galaxee name is "<name>" then I click the "iconfont icon-fabu" release button
      And switch to window "<name>"
      And I close all tabs except main tab
      And I wait for loading invisible
      Then take a screenshot with name "galaxee/<name>"

      Examples:
        |name           |
        |实体样式router2     |

######################################无耻的分割线################################
    Scenario: 实体样式switch
#      Given I will see the "PublicNavBarPage" page
#      And I wait for "Dashboard" will be visible
      And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
      When I click the "Create" button
      Then I will see the "galaxee.CreatePage" page
      When I click the "Create" button
      And I set the parameter "Name" with value "实体样式switch"
      And I click the "Ensure" button
      #选择上方的网络
      And I click the "net" button
      #选择实体
      And I click the "entity" button
      And I hide the element "netDropdown"
      And I click the "Style" button
      #实体样式的选择
      And I click the "entityStyle" button
      And I choose the "switch" from the "entityStyleSelect"
       #保存
      And I wait for "Save" will be visible
      And I wait for "2000" millsecond
      And I click the "Save" button
      Then I will see the success message "保存成功"


    Scenario Outline: 实体样式switch发布并截图
#      Given I will see the "PublicNavBarPage" page
#      And I wait for "Dashboard" will be visible
      And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
      When the galaxee name is "<name>" then I click the "iconfont icon-fabu" release button
      And switch to window "<name>"
      And I close all tabs except main tab
      And I wait for loading invisible
      Then take a screenshot with name "galaxee/<name>"

      Examples:
        |name           |
        |实体样式switch     |

 ######################################无耻的分割线################################
    Scenario: 实体样式balance
#      Given I will see the "PublicNavBarPage" page
#      And I wait for "Dashboard" will be visible
      And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
      When I click the "Create" button
      Then I will see the "galaxee.CreatePage" page
      When I click the "Create" button
      And I set the parameter "Name" with value "实体样式balance"
      And I click the "Ensure" button
      #选择上方的网络
      And I click the "net" button
      #选择实体
      And I click the "entity" button
      And I hide the element "netDropdown"
      And I click the "Style" button
      #实体样式的选择
      And I click the "entityStyle" button
      And I choose the "balance" from the "entityStyleSelect"
       #保存
      And I wait for "Save" will be visible
      And I wait for "2000" millsecond
      And I click the "Save" button
      Then I will see the success message "保存成功"


    Scenario Outline: 实体样式balance发布并截图
#      Given I will see the "PublicNavBarPage" page
#      And I wait for "Dashboard" will be visible
      And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
      When the galaxee name is "<name>" then I click the "iconfont icon-fabu" release button
      And switch to window "<name>"
      And I close all tabs except main tab
      And I wait for loading invisible
      Then take a screenshot with name "galaxee/<name>"

      Examples:
        |name           |
        |实体样式balance     |


######################################无耻的分割线################################

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
      And I click the "DateEditor" button
      And I click the "RecentSevenDay" button
      And I click the "Search" button
      And I wait for "SearchTip" will be invisible
      And I set the parameter "updateFrequency" with value "0.1"
      And I choose the "err_avg" from the "entitySearchCategory"

       #保存
      And I wait for "Save" will be visible
      And I click the "Save" button
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
      And I click the "DateEditor" button
      And I click the "RecentSevenDay" button
      And I click the "Search" button
      And I wait for "SearchTip" will be invisible
      And I set the parameter "updateFrequency" with value "0.1"
      And I choose the "err_avg" from the "entitySearchCategory"
      #选择静态数据
      And I drag the scroll bar to the element "dataType"
      And I click the "dataSourceType" button
      And I click the "statisticsData" button
      And I click the "Ensure" button
      And I wait for "2000" millsecond
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
      And I set the parameter "SplInput" with value "* | stats avg(apache.status) as err_avg"
      And I click the "DateEditor" button
      And I click the "RecentSevenDay" button
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
#      And I click the "pictureOne" button
      And I click the "Search" button
     #对实体的参数进行设置
      And I click the "pictureOne" button
#      And I click the "pictureTwo" button
      And I click the "Data" button
      And I wait for "3000" millsecond

      And I choose the "err_avg" from the "entitySearchCategory"
      #设置值范围
      And I set the parameter "normalStart" with value "200"
      And I set the parameter "normalEnd" with value "300"

      And I set the parameter "abnormalStart" with value "300"
      And I set the parameter "abnormalEnd" with value "400"
      #保存
      And I click the "Save" button
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

      Examples:
        |name              |
        |实体数据之绑定搜索 |



    Scenario Outline: 删除关于实体的大屏
      Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
      When the galaxee name is "<name>" then I click the "iconfont icon-shanchuxuanting_icon" delete button
      Then I click the "Ensure" button

      Examples:
        |name|
        |实体默认设置      |
        |实体样式     |
        |实体样式firewall |
        |实体样式router1     |
        |实体样式router2     |
        |实体样式switch     |
        |实体样式balance     |
        |实体数据之绑定搜索 |
        |实体数据之静态数据值严重   |
        |实体数据之搜索值异常   |