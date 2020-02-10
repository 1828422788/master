@galaxee
  Feature: Top3

    Scenario: Top3默认设置
      Given I will see the "PublicNavBarPage" page
      And I wait for "Dashboard" will be visible
      And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
      When I click the "Create" button
      Then I will see the "galaxee.CreatePage" page
      When I click the "Create" button
      And I set the parameter "Name" with value "Top3默认设置"
      And I click the "Ensure" button
      #选择上方的指标
      And I click the "Index" button
      #选择top3
      And I click the "Top3" button
      #保存
      And I wait for "Save" will be visible
      And I click the "Save" button
      Then I will see the success message "保存成功"

    Scenario Outline: Top3默认设置发布并截图
      Given I will see the "PublicNavBarPage" page
      And I wait for "Dashboard" will be visible
      And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
      When the galaxee name is "<name>" then I click the "iconfont icon-fabu" button
      And switch to window "<name>"
      And I wait for loading invisible
      Then take a screenshot with name "galaxee/<name>"

      Examples:
        |name              |
        |Top3默认设置       |


######################################无耻的分割线################################

  Scenario: Top3样式设置
      Given I will see the "PublicNavBarPage" page
      And I wait for "Dashboard" will be visible
      And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
      When I click the "Create" button
      Then I will see the "galaxee.CreatePage" page
      When I click the "Create" button
      And I set the parameter "Name" with value "Top3样式设置"
      And I click the "Ensure" button
      #选择上方的指标
      And I click the "Index" button
      #选择top3
     And I click the "Top3" button
#设置样式
      #1 设置图表尺寸位置
      And I click the "ChartPosition" button
      And I set the parameter "Width" with value "700"
      And I set the parameter "Height" with value "500"
      And I set the parameter "ChartXaxis" with value "600"
      And I set the parameter "ChartYaxis" with value "300"
      #2设置奖牌、名称、数值
     And I click the "styleTop3" button
     And I set the parameter "medalSize" with value "80"
     And I set the parameter "nameTypefaceSize" with value "20"
     And I set the parameter "numberTypefaceSize" with value "40"

     And I click the "Top3numberTypefaceColor" button
     And I set the parameter "ColorInput" with value "#9FF50B"
     And I click the "EnsureColor" button
     And I wait for "EnsureColor" will be invisible
     #数值字体粗细的设置
     And I choose the "bold" from the "Top3WordBold"
      #不显示单位
     And I click the "danWei" button
      #3 全局样式修改名成
      And I click the "globalStyle" button
      And I set the parameter "globalStyleName" with value "Top3样式修改"
      #保存
      And I click the "Save" button
      Then I will see the success message "保存成功"


    Scenario Outline: Top3样式设置发布并截图
      Given I will see the "PublicNavBarPage" page
      And I wait for "Dashboard" will be visible
      And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
      When the galaxee name is "<name>" then I click the "iconfont icon-fabu" button
      And switch to window "<name>"
      And I wait for loading invisible
      Then take a screenshot with name "galaxee/<name>"

      Examples:
        |name           |
        |Top3样式设置    |

######################################无耻的分割线################################

    Scenario: Top3样式字体bolder单位无
      Given I will see the "PublicNavBarPage" page
      And I wait for "Dashboard" will be visible
      And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
      When I click the "Create" button
      Then I will see the "galaxee.CreatePage" page
      When I click the "Create" button
      And I set the parameter "Name" with value "Top3样式字体bolder单位无"
      And I click the "Ensure" button
      #选择上方的指标
      And I click the "Index" button
      #选择top3
      And I click the "Top3" button
      #数值字体粗细的设置
      And I click the "styleTop3" button
      And I wait for "4000" millsecond
      And I choose the "bolder" from the "Top3WordBold"
      #不显示单位
      And I click the "danWei" button
      #保存
      And I click the "Save" button
      Then I will see the success message "保存成功"

    Scenario Outline: Top3样式字体bolder单位无发布并截图
      Given I will see the "PublicNavBarPage" page
      And I wait for "Dashboard" will be visible
      And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
      When the galaxee name is "<name>" then I click the "iconfont icon-fabu" button
      And switch to window "<name>"
      And I wait for loading invisible
      Then take a screenshot with name "galaxee/<name>"

      Examples:
        |name                      |
        |Top3样式字体bolder单位无    |

  ######################################无耻的分割线################################

    Scenario: Top3样式字体normal单位无
      Given I will see the "PublicNavBarPage" page
      And I wait for "Dashboard" will be visible
      And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
      When I click the "Create" button
      Then I will see the "galaxee.CreatePage" page
      When I click the "Create" button
      And I set the parameter "Name" with value "Top3样式字体normal单位无"
      And I click the "Ensure" button
      #选择上方的指标
      And I click the "Index" button
      #选择top3
      And I click the "Top3" button
      #数值字体粗细的设置
      And I click the "styleTop3" button
      And I wait for "4000" millsecond
      And I choose the "normal" from the "Top3WordBold"
      #不显示单位
      And I click the "danWei" button
      #保存
      And I click the "Save" button
      Then I will see the success message "保存成功"

    Scenario Outline: Top3样式字体normal单位无发布并截图
      Given I will see the "PublicNavBarPage" page
      And I wait for "Dashboard" will be visible
      And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
      When the galaxee name is "<name>" then I click the "iconfont icon-fabu" button
      And switch to window "<name>"
      And I wait for loading invisible
      Then take a screenshot with name "galaxee/<name>"

      Examples:
        |name                      |
        |Top3样式字体normal单位无   |

######################################无耻的分割线################################
  #数据
  Scenario: Top3数据之搜索
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "Top3数据之搜索"
    And I click the "Ensure" button
   #选择上方的指标
    And I click the "Index" button
      #选择top3
    And I click the "Top3" button
    #数据设置（数据源类型默认：搜索）
    And I click the "Data" button
    And I set the parameter "SplInput" with value "* | stats count() by hostname"
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I set the parameter "updateFrequency" with value "0.1"
    And I choose the "hostname" from the "dataSearchName"
    And I choose the "count()" from the "dataSearchNumber"
    #保存
    And I click the "Save" button
    Then I will see the success message "保存成功"

    Scenario Outline: Top3数据之搜索发布并截图
      Given I will see the "PublicNavBarPage" page
      And I wait for "Dashboard" will be visible
      And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
      When the galaxee name is "<name>" then I click the "iconfont icon-fabu" button
      And switch to window "<name>"
      And I wait for loading invisible
      Then take a screenshot with name "galaxee/<name>"

      Examples:
        |name            |
        |Top3数据之搜索   |


 ######################################无耻的分割线################################


    Scenario: Top3数据之静态数据
      Given I will see the "PublicNavBarPage" page
      And I wait for "Dashboard" will be visible
      And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
      When I click the "Create" button
      Then I will see the "galaxee.CreatePage" page
      When I click the "Create" button
      And I set the parameter "Name" with value "Top3数据之静态数据"
      And I click the "Ensure" button
     #选择上方的指标
      And I click the "Index" button
      #选择top3
      And I click the "Top3" button
      #数据设置
      And I click the "Data" button
      And I click the "dataSourceType" button
      #选择静态数据
      And I click the "statisticsData" button
      And I click the "Ensure" button
      And I wait for "3000" millsecond
      And I choose the "name" from the "dataSearchName"
      And I choose the "value" from the "dataSearchNumber"
      And I wait for "1000" millsecond
      #保存
      And I click the "Save" button
      Then I will see the success message "保存成功"


    Scenario Outline: Top3数据之静态数据发布并截图
      Given I will see the "PublicNavBarPage" page
      And I wait for "Dashboard" will be visible
      And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
      When the galaxee name is "<name>" then I click the "iconfont icon-fabu" button
      And switch to window "<name>"
      And I wait for loading invisible
      Then take a screenshot with name "galaxee/<name>"

      Examples:
        |name              |
        |Top3数据之静态数据  |

 ######################################无耻的分割线################################


    Scenario: Top3数据之绑定搜索
      Given I will see the "PublicNavBarPage" page
      And I wait for "Dashboard" will be visible
      And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
      When I click the "Create" button
      Then I will see the "galaxee.CreatePage" page
      When I click the "Create" button
      And I set the parameter "Name" with value "Top3数据之绑定搜索"
      And I click the "Ensure" button
      #在【其他】中添加一个【搜索】控件
      And I click the "Other" button
      And I click the "otherSearch" button
      And I set the parameter "SplInput" with value "* | stats count() by hostname"
      And I click the "Search" button
      And I wait for "SearchTip" will be invisible
      And I set the parameter "updateFrequency" with value "0.1"
      #添加一个Top3控件
      #选择上方的指标
      And I click the "Index" button
      #选择top3
      And I click the "Top3" button
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
     #对Top3的参数进行设置
      And I click the "pictureOne" button
      And I click the "pictureTwo" button
      And I click the "Data" button
      And I wait for "2000" millsecond
      And I choose the "hostname" from the "dataSearchName"
      And I choose the "count()" from the "dataSearchNumber"
      Then take a screenshot with name "galaxee/Top3数据之绑定搜索编辑页"
      #保存
      And I click the "Save" button
      Then I will see the success message "保存成功"

    Scenario Outline: Top3数据之绑定搜索发布并截图
      Given I will see the "PublicNavBarPage" page
      And I wait for "Dashboard" will be visible
      And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
      When the galaxee name is "<name>" then I click the "iconfont icon-fabu" button
      And switch to window "<name>"
      And I wait for loading invisible
      Then take a screenshot with name "galaxee/<name>"

      Examples:
        |name             |
        |Top3数据之绑定搜索 |



























