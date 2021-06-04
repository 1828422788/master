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
    And I choose the "filter" from the "ShowFilterConfig"
    And I wait for "500" millsecond
    And I choose the "包含" from the "ShowCondition"
    And I wait for "ShowValue" will be visible
    And I set the parameter "ShowValue" with value "-1h"
    And I click the "Ensure" button
    And I wait for "500" millsecond
    And I will see the success message "配置成功"
    And I click the "MoreXuanTing2" button
#    And I click the "MoreConfig" button
    And I click the "Configs" button
    And I wait for loading invisible
    And I wait for "1000" millsecond
    And I choose the "filter" from the "ShowFilterConfig"
    And I wait for "500" millsecond
    And I choose the "匹配正则" from the "ShowCondition"
    And I wait for "500" millsecond
    And I set the parameter "ShowValue" with value "now/d,?now"
    And I click the "Ensure" button
    And I wait for "1000" millsecond
    And I click the "SettingIcon" button
    And I wait for "3000" millsecond
    And I switch the dashboard "OpenShowCondition" button to "enable"
    And I wait for "500" millsecond
#    And I will see the success message "展示条件已启用"
    Then I will see the "trendThree" doesn't exist
    Then I wait for "trendTwo" will be visible