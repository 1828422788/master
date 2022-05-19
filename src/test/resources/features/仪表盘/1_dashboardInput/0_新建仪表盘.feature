@dashboardInput
Feature:仪表盘输入项_0新建仪表盘

  @dashboardInputSmoke
  Scenario Outline: 创建仪表盘所用趋势图
    And open the "trend.ListPage" page for uri "/trend/"
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePageDash" page
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    When I click the "NextButton" button
    And I wait for "Header" will be visible
    And I wait for "2000" millsecond
    When I click the "NextButton" button
    When I set the parameter "NameInput" with value "<name>"
    And I click the "Complete" button
    And I will see the element "ResultMessage" contains "新建成功"

    Examples:
      | name         | spl                                                                                           |
      | 仪表盘所用趋势图     | tag: sample04061424_chart \|stats count() by 'apache.geo.city'                                |
      | 仪表盘1669所用趋势图 | (appname:\"vendors\") \|bucket timestamp span=6h as ts \|stats count(\'tag\') as \'tag\' by ts |

  Scenario Outline: 新建仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the "Create" button
    When I set the parameter "DashBoardName" with value "<name>"
    And I click the "Ensure" button
    Then I will see the success message "新建仪表盘成功"

    Examples:
      | name                     |
      | 测试输入项1              |
      | 测试输入项_时间范围      |
      | 测试输入项_文本输入      |
      | 测试输入项_标识前后缀    |
      | 测试输入项_下拉菜单      |

    @dashboardInputSmoke
    Examples:
      | name                     |
      | 测试输入项_下拉菜单_多选 |

    Examples:
      | name                     |
      | 测试输入项_动态菜单_单选 |
      | 测试输入项_动态菜单_多选 |

    @dashboardInputSmoke
    Examples:
      | name                     |
      | 仪表盘输入项联动         |


  Scenario Outline: 新建标签页
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "<name>"
    And I wait for loading invisible
    And I click the detail which name is "<name>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    When I set the parameter "TagName" with value "<tagname>"
    And I click the "Ensure" button
    Then I wait for "SettingIcon" will be visible

    Examples:
      | name                     | tagname   |
      | 测试输入项1              | 过滤项    |
      | 测试输入项_时间范围      | 过滤项    |
      | 测试输入项_文本输入      | 过滤项    |
      | 测试输入项_标识前后缀    | 过滤项    |
      | 测试输入项_下拉菜单      | 过滤项    |
      | 测试输入项_动态菜单_单选 | 过滤项    |
      | 测试输入项_动态菜单_多选 | 过滤项    |

    @dashboardInputSmoke
    Examples:
      | name                     | tagname   |
      | 测试输入项_下拉菜单_多选 | 过滤项    |
      | 仪表盘输入项联动         | 输入项联动|


  Scenario Outline: 添加图表
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "<name>"
    And I wait for loading invisible
    And I click the detail which name is "<name>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    And I choose the "添加图表" from the "AddItemMenu"
    And I set the parameter "SearchChartInput" with value "<trend>"
    And I wait for loading invisible
    And  I "checked" the checkbox which name is "<trend>"
    And I click the "Ensure" button
    Then I wait for element "SuccessMessage" change text to "添加成功"

    Examples:
      | name                     | trend                |
      | 测试输入项1              | 仪表盘所用趋势图     |
      | 测试输入项_时间范围      | 仪表盘所用趋势图     |
      | 测试输入项_文本输入      | 仪表盘1669所用趋势图 |
      | 测试输入项_标识前后缀    | 仪表盘1669所用趋势图 |
      | 测试输入项_下拉菜单      | 仪表盘1669所用趋势图 |
      | 测试输入项_动态菜单_单选 | 仪表盘1669所用趋势图 |
      | 测试输入项_动态菜单_多选 | 仪表盘1669所用趋势图 |

    @dashboardInputSmoke
    Examples:
      | name                     | trend                |
      | 测试输入项_下拉菜单_多选 | 仪表盘1669所用趋势图 |