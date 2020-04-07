@dataset
Feature: 数据集在仪表盘中的应用
  #V3.2仪表盘的数据集改成了下拉菜单


  @dataset
  Scenario: 数据集父子行为无
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
        #新建仪表盘
    And I click the "Create" button
    And I set the parameter "DashBoardName" with value "dataSet"
    And I click the "Ensure" button
    Then I will see the success message "新建仪表盘成功"
        #进入详情页
    And I click the detail which name is "dataSet"
    Then I will see the "dashboard.DetailPage" page
    When I set the parameter "TagName" with value "父子行为无"
    And I click the "EnsureCreateTagButton" button
        #添加图表
    When I click the "AddEventButton" button
    And I choose the "添加图表" from the "EventList"
    When I "checked" the checkbox which name is "父子无"
    And I click the "EnsureAddTrend" button
    And I wait for "3000" millsecond
        #查看通用配置中的数据集
    And I click the "moreSetting" button
    And I click the "generalConfig" button
    And I wait for "dataSetPosition" will be visible
    Then I will see the "dataSetPosition" result will be "tag:heka"


  @dataset
  Scenario: 数据集父子行为汇聚
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
        #新建仪表盘
    And I click the "Create" button
    And I set the parameter "DashBoardName" with value "dataSetTwo"
    And I click the "Ensure" button
    Then I will see the success message "新建成功"
    And I wait for loading invisible
        #进入详情页
    And I click the detail which name is "dataSetTwo"
    Then I will see the "dashboard.DetailPage" page
    When I set the parameter "TagName" with value "父子行为汇聚"
    And I click the "EnsureCreateTagButton" button
        #添加图表
    When I click the "AddEventButton" button
    And I choose the "添加图表" from the "EventList"
    And I check "父子汇聚" from the "CheckBox"
    And I click the "EnsureAddTrend" button
    And I wait for loading invisible
    #    And I wait for "ChartSetting" will be visible
        #查看通用配置中的数据集
    When I click the "ChartSetting" button
    And I click the "generalConfig" button
    Then I will see the "dataSetPosition" result will be "* AND tag:heka AND (tag:top_info OR appname:apache)"




  @dataset
  Scenario: 数据集父子行为继承
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
        #新建仪表盘
    And I click the "Create" button
    And I set the parameter "DashBoardName" with value "dataSetThree"
    And I click the "Ensure" button
    Then I will see the success message "新建成功"
    And I wait for loading invisible
        #进入详情页
    And I click the detail which name is "dataSetThree"
    Then I will see the "dashboard.DetailPage" page
    When I set the parameter "TagName" with value "父子行为继承"
    And I click the "EnsureCreateTagButton" button
        #添加图表
    When I click the "AddEventButton" button
    And I choose the "添加图表" from the "EventList"
    And I check "父子继承" from the "CheckBox"
    And I click the "EnsureAddTrend" button
    And I wait for loading invisible
    #    And I wait for "ChartSetting" will be visible
        #查看通用配置中的数据集
    When I click the "ChartSetting" button
    And I click the "generalConfig" button
    Then I will see the "dataSetPosition" result will be "* AND tag:heka"


