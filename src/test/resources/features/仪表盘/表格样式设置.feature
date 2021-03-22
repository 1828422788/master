Feature: 仪表盘表格样式设置

  @dashboard @dashboardSmoke
  Scenario Outline: 新建仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the "Create" button
    When I set the parameter "DashBoardName" with value "<name>"
    And I click the "Ensure" button
    Then I will see the success message "新建仪表盘成功"

    Examples:
      | name   |
      | 仪表盘表格样式设置 |

  @dashboard @dashboardSmoke
  Scenario Outline: 新建标签页
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "仪表盘<name>"
    Then I will see the "dashboard.DetailPage" page
    When I set the parameter "TagName" with value "<name>"
    And I click the "EnsureCreateTagButton" button
    And I wait for loading complete
    And I wait for "5000" millsecond
    And I back to before

    Examples:
      | name |
      | 表格样式设置  |

  @dashboard @dashboardSmoke
  Scenario Outline: 创建仪表盘所用趋势图
    And open the "trend.ListPage" page for uri "/trend/"
    And I click the "NewTrendButton" button
#    And I click the "Create" button
    Then I will see the "trend.CreatePageDash" page
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I wait for loading invisible
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    When I set the parameter "NameInput" with value "<name>"
    And I click the "Complete" button
    And I wait for "SuccessCreate" will be visible

    Examples:
      | spl                                                           | name   |
      | tag:sample04061424_chart \|stats count() by 'apache.geo.city' | 仪表盘表格样式 |

  @dashboard @dashboardSmoke
  Scenario Outline: 添加图表 RZY-4845
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "仪表盘表格样式设置"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "AddEventButton" will be visible
    When I click the "AddEventButton" button
    And I wait for "500" millsecond
    And I click the "AddChart" button
    And I wait for "SpinDot" will be invisible
    And I set the parameter "SearchChartInput" with value "<name>"
    And I wait for loading invisible
    And I click the "{'Checkbox':'<name>'}" button
    And I click the "Ensure" button

    Examples:
      | name         |
      | 仪表盘表格样式 |

  @dashboard @dashboardSmoke
  Scenario: 编辑图表样式-颜色-值-默认 RZY-4846
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘表格样式设置"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "ChartEditorNumber" will be visible
    When I click the "ChartEditorNumber" button
#    And I click the "ChartEditorNumber" button
    And I choose the "值" from the "ChartEditorColor"
    And I wait for "500" millsecond
    And I click the "ColorValueDefault" button
    And I wait for "500" millsecond
    And I click the "ChartEditorEnsure" button
    Then I will see the element "ValueOfNanjing" style contains "background-color: rgb(230, 247, 255);"

  @dashboard @dashboardSmoke
  Scenario: 编辑图表样式-颜色-值-随机 RZY-4847
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘表格样式设置"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "ChartEditorNumber" will be visible
    When I click the "ChartEditorNumber" button
#    And I click the "ChartEditorNumber" button
    And I choose the "值" from the "ChartEditorColor"
    And I wait for "500" millsecond
    And I click the "ColorValueRandom" button
    And I wait for "500" millsecond
    And I click the "ChartEditorEnsure" button
    Then I will see the "ValueOfNanjing" is not exist
    Then I will see the element "ValueOfNanjing" style contains "background-color: rgb(3, 169, 244);"

  @dashboard @dashboardSmoke
  Scenario: 编辑图表样式-颜色-值-自定义 RZY-4848
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘表格样式设置"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "ChartEditorNumber" will be visible
    When I click the "ChartEditorNumber" button
#    And I click the "ChartEditorNumber" button
    And I choose the "值" from the "ChartEditorColor"
    And I wait for "500" millsecond
    And I click the "ColorValueCustom" button
    And I wait for "500" millsecond
    And I click the "AddValueColor" button
    And I set the parameter "FirstValueColor" with value "43"
    And I wait for "500" millsecond
    And I click the "ChartEditorEnsure" button
    Then I will see the "ValueOfNanjing" is not exist
    Then I will see the element "ValueOfNanjing" style contains "background-color: rgb(3, 169, 244)"

  @dashboard @dashboardSmoke
  Scenario: 编辑图表样式-颜色-范围 RZY-4849
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘表格样式设置"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "ChartEditorNumber" will be visible
    When I click the "ChartEditorNumber" button
    And I choose the "范围" from the "ChartEditorColor"
    And I wait for "500" millsecond
    And I click the "AddRangeColor" button
    And I wait for "500" millsecond
    And I click the "AddRangeColor" button
    And I wait for "500" millsecond
    And I click the "AddRangeColor" button
    And I wait for "500" millsecond
    And I click the "ChartEditorEnsure" button
    Then I will see the "ValueOfNanjing" is not exist
    Then I will see the element "ValueOfNanjing" style contains "background-color: rgb(37, 155, 36)"
    Then I will see the element "ValueOfShenzhenTd" style contains "background-color: rgb(0, 188, 212)"

  @dashboard @dashboardSmoke
  Scenario: 编辑图表样式-颜色-梯度 RZY-4850
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘表格样式设置"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "ChartEditorNumber" will be visible
    When I click the "ChartEditorNumber" button
#    And I click the "ChartEditorNumber" button
    And I choose the "梯度" from the "ChartEditorColor"
    And I wait for "500" millsecond
    And I will see the element "LowerLimitValue" value is "0"
    And I set the parameter "MedianValue" with value "50"
    And I set the parameter "UpperLimitValue" with value "100"
    And I wait for "500" millsecond
    And I click the "ChartEditorEnsure" button
    Then I will see the "ValueOfNanjing" is not exist
    Then I will see the element "ValueOfNanjing" style contains "background-color: rgb(142, 217, 251)"
    Then I will see the element "ValueOfShenzhenTd" style contains "background-color: rgb(189, 232, 252)"

  @dashboard @dashboardSmoke
  Scenario: 编辑图表样式-字体颜色-#fa3a76 RZY-4852
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘表格样式设置"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "ChartEditorNumber" will be visible
    When I click the "ChartEditorNumber" button
    And I click the "chartFontColor" button
    And I wait for "ChartFontColorValue" will be visible
    And I set the parameter "ChartFontColorValue" with value "#fa3a76"
    And I click the "ChartEditorEnsure" button under some element
    Then I will see the element "ValueOfNanjingTdText" style contains "color: rgb(250, 58, 118)"

  @dashboard @dashboardSmoke
  Scenario: 编辑图表样式-字体样式-粗体 RZY-4851
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "仪表盘表格样式设置"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "ChartEditorNumber" will be visible
    When I click the "ChartEditorNumber" button
    And I wait for "1000" millsecond
    And I choose the "粗体" from the "ChartFontStyle"
    And I wait for "500" millsecond
    And I click the "ChartEditorEnsure" button
    Then I will see the element "ValueOfNanjing" style contains "font-weight: bold"

  @dashboard @dashboardSmoke
  Scenario: 编辑图表样式-字体样式-斜体 RZY-4851
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "仪表盘表格样式设置"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "ChartEditorNumber" will be visible
    When I click the "ChartEditorNumber" button
    And I wait for "1000" millsecond
    And I choose the "斜体" from the "ChartFontStyle"
    And I wait for "500" millsecond
    And I click the "ChartEditorEnsure" button
    Then I will see the element "ValueOfNanjing" style contains "font-style: italic"

  @dashboard @dashboardSmoke
  Scenario: 编辑图表样式-字体样式-下划线 RZY-4851
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "仪表盘表格样式设置"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "ChartEditorNumber" will be visible
    When I click the "ChartEditorNumber" button
    And I wait for "1000" millsecond
    And I choose the "下划线" from the "ChartFontStyle"
    And I wait for "500" millsecond
    And I click the "ChartEditorEnsure" button
    Then I will see the element "ValueOfNanjing" style contains "text-decoration: underline"

  @dashboard @dashboardSmoke
  Scenario Outline: 编辑图表样式-列宽度 RZY-4853
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "仪表盘表格样式设置"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "ChartEditorNumber" will be visible
    When I click the "ChartEditorNumber" button
    And I wait for "1000" millsecond
    And I set the parameter "ChartColumnWidth" with value "<Width>"
    And I wait for "500" millsecond
    And I click the "ChartEditorEnsure" button
    And I wait for "2000" millsecond
    Then take part of "ChartStyleTable" with name "actual/<image>"
    And I compare source image "actual/<image>" with target image "expect/<image>"

    Examples:
      | Width   |   image        |
      | 20      | 表格样式_列宽度   |

  @dashboard @dashboardSmoke
  Scenario: 编辑图表样式-对齐方式-居中 RZY-4854
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "仪表盘表格样式设置"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "ChartEditorNumber" will be visible
    When I click the "ChartEditorNumber" button
    And I wait for "1000" millsecond
    And I choose the "居中" from the "ChartAlignment"
    And I wait for "500" millsecond
    And I click the "ChartEditorEnsure" button
    Then I will see the element "ValueOfNanjing" style contains "text-align: center"

  @dashboard @dashboardSmoke
  Scenario: 编辑图表样式-对齐方式-居右 RZY-4854
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "仪表盘表格样式设置"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "ChartEditorNumber" will be visible
    When I click the "ChartEditorNumber" button
    And I wait for "1000" millsecond
    And I choose the "居右" from the "ChartAlignment"
    And I wait for "500" millsecond
    And I click the "ChartEditorEnsure" button
    Then I will see the element "ValueOfNanjing" style contains "text-align: right"

  @dashboard @dashboardSmoke
  Scenario: 编辑图表样式-对齐方式-居左 RZY-4854
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "仪表盘表格样式设置"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "ChartEditorNumber" will be visible
    When I click the "ChartEditorNumber" button
    And I wait for "1000" millsecond
    And I choose the "居左" from the "ChartAlignment"
    And I wait for "500" millsecond
    And I click the "ChartEditorEnsure" button
    Then I will see the element "ValueOfNanjing" style contains "text-align: left"

  @dashboard @dashboardSmoke
  Scenario: 文件名称校验 RZY-4878
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "仪表盘表格样式设置"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "500" millsecond
    And I move the mouse pointer to the "DownloadTableIcon"
    And I click the "DownloadTableIcon" button
    And I wait for "1000" millsecond
    And I set the parameter "DownloadFileName" with value " "
    And I click the "EnsureCreateTagButton" button
    Then I will see the error message "请填写有效文件名"
    And I wait for "3000" millsecond
    And I set the parameter "DownloadFileName" with value "汉字Abc！@#¥123"
    And I wait for "3000" millsecond
    And I click the "EnsureCreateTagButton" button
    Then I will see the success message "成功提交下载任务"

  @dashboard @dashboardSmoke
  Scenario: 再次添加同名下载任务 RZY-4879
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "仪表盘表格样式设置"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "500" millsecond
    And I move the mouse pointer to the "DownloadTableIcon"
    And I click the "DownloadTableIcon" button
    And I wait for "1000" millsecond
    And I set the parameter "DownloadFileName" with value "汉字Abc！@#¥123"
    And I click the "EnsureCreateTagButton" button
    Then I wait for "DuplicateName" will be visible

  @cleanDashboard
  Scenario Outline: 删除仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除仪表盘成功"

    Examples:
      | name   |
      | 仪表盘表格样式设置 |

  @dashboard @cleanDashboard
  Scenario: 删除创建的下载任务
    Given open the "ListPageFactory" page for uri "/download/"
    And the data name contains "汉字Abc" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除成功"

  @cleanDashboard
  Scenario Outline: 删除仪表盘所建趋势图
    Given open the "trend.ListPage" page for uri "/trend/"
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I will see the success message "删除成功"

    Examples:
      | name   |
      | 仪表盘表格样式 |