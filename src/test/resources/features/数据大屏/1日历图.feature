@1.4   @galaxee @galaxee0
Feature: 数据大屏-d日历图

#  Background:
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible

  Scenario: 日历图-搜索 RZY-4829
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And I click the "Create" button
    And I set the parameter "Name" with value "日历图-搜索"
    And I click the "Ensure" button
    #选择日历图
    And I click the "Chart" button
    And I wait for "2000" millsecond
    And I click the "Calendar" button
    #日历图
    And I wait for "Style" will be visible
    And I click the "Style" button under some element
    And I click the "ChartPosition" button
    And I wait for "Width" will be visible
    And I set the parameter "Width" with value "1024"
    And I set the parameter "Height" with value "350"
    And I set the parameter "ChartXaxis" with value "250"
    And I set the parameter "ChartYaxis" with value "250"

    #2 设置外观
    And I click the "StyleCalendar" button
    #上边距、月份字号、星期字号、表格大小
    And I set the parameter "CalendarTopMargin" with value "80"
    And I set the parameter "CalendarMonthSize" with value "18"
    And I set the parameter "CalendarWeekSize" with value "16"
    And I set the parameter "CalendarTableSize" with value "25"
    #月份颜色
    And I wait for "CalendarMonthColor" will be visible
    And I set the parameter "CalendarMonthColor" with value "#b68d16"
    And I click the "EnsureColor" button
#    And I wait for "EnsureColor" will be invisible
    #星期颜色
    And I wait for "CalendarWeekColor" will be visible
    And I set the parameter "CalendarWeekColor" with value "#ca75fb"
    And I click the "EnsureColor" button
#    And I wait for "EnsureColor" will be invisible
    #标注颜色
    And I wait for "CalendarTaggingColor" will be visible
    And I set the parameter "CalendarTaggingColor" with value "#fa3a76"
    And I click the "EnsureColor" button
#    And I wait for "EnsureColor" will be invisible
    #背景颜色
    And I wait for "CalendarBackgroundColor" will be visible
    And I set the parameter "CalendarBackgroundColor" with value "#cae5ff"
    And I click the "EnsureColor" button
      #数据
    And I click the "Data" button
    And I wait for "SplInput" will be visible
    And I set the parameter "SplInput" with value "tag:sample04061424_chart | stats count(apache.status) by timestamp"
    And I click the "DateEditor" button
    And I click the "RecentSevenDay" button
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I set the parameter "updateFrequency" with value "0.1"

    And I choose the "timestamp" from the "TimeField"
    And I wait for "1000" millsecond
    And I choose the "timestamp" from the "TimeField"
    And I wait for "1000" millsecond
    And I choose the "count(apache.status)" from the "ValueField"
    And I click the "Update" button

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
    #选择日历图
    And I click the "Chart" button
    And I wait for "2000" millsecond
    And I click the "Calendar" button
    #日历图
    And I wait for "Style" will be visible
    And I click the "Style" button under some element
    #2 设置外观
    And I click the "StyleCalendar" button
    #上边距、月份字号、星期字号、表格大小
    #月份颜色
    And I wait for "CalendarMonthColor" will be visible
    And I set the parameter "CalendarMonthColor" with value "#b68d16"
    And I click the "EnsureColor" button
#    And I wait for "EnsureColor" will be invisible
    #星期颜色
    And I wait for "CalendarWeekColor" will be visible
    And I set the parameter "CalendarWeekColor" with value "#ca75fb"
    And I click the "EnsureColor" button
#    And I wait for "EnsureColor" will be invisible
    #标注颜色
    And I wait for "CalendarTaggingColor" will be visible
    And I set the parameter "CalendarTaggingColor" with value "#fa3a76"
    And I click the "EnsureColor" button
#    And I wait for "EnsureColor" will be invisible
    #背景颜色
    And I wait for "CalendarBackgroundColor" will be visible
    And I set the parameter "CalendarBackgroundColor" with value "#cae5ff"
    And I click the "EnsureColor" button

    And I click the "Data" button
    And I click the "dataSourceType" button
    And I click the "statisticsData" button
    And I click the "Ensure" button
    And I wait for "tipsText" will be invisible
    And I click the "Update" button

       #保存
    And I wait for "Save" will be visible
    And I wait for "2000" millsecond
    And I click the "Save" button under some element
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存成功"
