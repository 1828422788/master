Feature:批量导入趋势图

  @dbsample1
  Scenario Outline: create_dashboards
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for "2000" millsecond
    When I click the "Create" button
    And I set the parameter "DashBoardName" with value "仪表盘_<name>"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "新建仪表盘成功"

    Examples:
      | name |
      | db样例 |

  @dbsample2
  Scenario Outline: 新建第一个tag
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    When I click the detail which name is "仪表盘_<name>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    When I set the parameter "TagName" with value "<tag>"
    And I click the "EnsureCreateTagButton" button
    And I wait for "2000" millsecond
    And I back to before

    Examples:
      | name |    tag       |
      | db样例 | LineChart    |

  @dbsample3
  Scenario Outline:  add_tabs
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "仪表盘_<folder>"
    And I wait for "2000" millsecond
    When I click the detail which name is "仪表盘_<folder>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "LastTag" will be visible
    And I open the context menu of the "LastTag" element
    And I wait for "500" millsecond
    And I wait for "CreatNewTag" will be visible
    And I click the "CreatNewTag" button
    When I set the parameter "TagName" with value "<tag>"
    And I click the "EnsureCreateTagButton" button
    And I wait for "3000" millsecond

    Examples:
      | folder   |  tag         |
      | db样例     | AreaChart    |

  @dbtrendreport
  Scenario Outline: 新建仪表盘及tag，导入趋势图
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the "Create" button
    When I set the parameter "DashBoardName" with value "仪表盘<name>"
    And I click the "Ensure" button
    Then I will see the success message "新建仪表盘成功"
    And I wait for loading invisible

    When I set the parameter "SearchNameInput" with value "仪表盘<name>"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘<name>"
    Then I will see the "dashboard.DetailPage" page
    When I set the parameter "TagName" with value "dbtag<name>"
    And I click the "EnsureCreateTagButton" button
    And I wait for loading complete

    When I click the "AddEventButton" button
    And I wait for "500" millsecond
    And I click the "AddChart" button
    And I wait for "SpinDot" will be invisible
    And I set the parameter "SearchChartInput" with value "<name>"
    And I wait for loading invisible
    When I "checked" the checkbox which name equal "<name>"
    And I click the "Ensure" button

    @dbTimechart
    Examples:
      | name                   |
      | Matrixheatmap_2661     |

  @dbsample4
  Scenario Outline:
    And I set the parameter "SearchInput" with value "趋势图_<folder>"
    And I wait for "2000" millsecond
    When I click the detail which name is "趋势图_<folder>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "LastTag" will be visible
    And I wait for "500" millsecond
    And I set the parameter "SearchTagInput" with value "<tag>"
    And I wait for "500" millsecond
    And I click the Element with text "<tag>"
    And I wait for "2000" millsecond
    Then I click the "AddEventButton" button
    And I click the "AddChart" button
    And I wait for "SpinDot" will be invisible
    And I set the parameter "SearchChartInput" with value "<chart>"
    And I wait for loading invisible
    And I click the "{'Checkbox':'<chart>'}" button
    And I click the "Ensure" button
    And I wait for "3000" millsecond

    Examples:
      | folder   |  tag         | chart                           |
      | 序列     | LineChart    | LineChart_2477                  |
