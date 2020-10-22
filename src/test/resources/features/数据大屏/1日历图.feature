@1.4   @galaxee @galaxee0
Feature: 数据大屏-d日历图

#  Background:
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible

  Scenario: 日历图-搜索
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And I click the "Create" button
    And I set the parameter "Name" with value "日历图-搜索"
    And I click the "Ensure" button
    #日历图


    And I click the "ChartPosition" button
    And I wait for "Width" will be visible
    And I set the parameter "Width" with value "1637"
    And I set the parameter "Height" with value "739"
    And I set the parameter "ChartXaxis" with value "86"
    And I set the parameter "ChartYaxis" with value "142"

      #数据
    And I click the "Data" button
    And I wait for "SplInput" will be visible
    And I set the parameter "SplInput" with value "tag:sample04061424_chart | stats count(apache.status) by timestamp"
#    And I click the "DateEditor" button
#    And I click the "RecentSevenDay" button
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible

    And I choose the "count()" from the "Yaxis"
    And I wait for "1000" millsecond
    And I choose the "apache.clientip" from the "Xaxis"


       #保存
    And I wait for "Save" will be visible
    And I wait for "2000" millsecond
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存成功"


##################################无耻的分割线##############################

  Scenario: 日历图-静态数据
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "日历图-静态数据"
    And I click the "Ensure" button
     #日历图
    And I click the "Chart" button
    And I wait for "Scatter" will be visible
    And I click the "Scatter" button
    And I wait for "Style" will be visible
    And I click the "Style" button

    #尺寸
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I wait for "Width" will be visible
    And I set the parameter "Width" with value "1637"
    And I set the parameter "Height" with value "739"
    And I set the parameter "ChartXaxis" with value "86"
    And I set the parameter "ChartYaxis" with value "142"
    #数据
    And I click the "Data" button
      #选择静态数据
    And I click the "dataSourceType" button
    And I click the "statisticsData" button
    And I click the "Ensure" button

    And I wait for "tipsText" will be invisible

    And I choose the "count()" from the "Yaxis"
    And I wait for "1000" millsecond
    And I choose the "apache.clientip" from the "Xaxis"

       #保存
    And I wait for "Save" will be visible
    And I wait for "2000" millsecond
    And I click the "Save" button under some element
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存成功"
