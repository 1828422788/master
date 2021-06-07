Feature:批量导入趋势图

  Scenario: 展示条件-时间范围输入项 RZY-4790
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "仪表盘行布局20"
    And I wait for "2000" millsecond
    When I click the detail which name is "仪表盘行布局20"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    When the chart title is "行布局趋势图3" then I click the button which classname is "yotta-icon yotta-icon-DotEmblemOutlined" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I wait for "1000" millsecond
