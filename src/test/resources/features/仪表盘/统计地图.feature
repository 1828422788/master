Feature: 仪表盘统计地图

  @dashboard @dashboardSmoke
  Scenario: 上传日志
    Given open the "localUpload.ListPage" page for uri "/sources/input/os/"
    When I set the parameter "AppName" with value "geostats"
    And I set the parameter "Tag" with value "geostats"
    And I upload a file with name "/src/test/resources/testdata/log/geostats.txt"
    And I click the "UploadButton" button
    And I wait for "VerifyText" will be visible
    Then I wait for element "VerifyText" change text to "上传完成"

  @dashboard @dashboardSmoke
  Scenario Outline: 新建仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the "Create" button
    When I set the parameter "DashBoardName" with value "<name>"
    And I click the "Ensure" button
    Then I will see the success message "新建仪表盘成功"

    Examples:
      | name    |
      | 仪表盘统计地图 |

  @dashboard @dashboardSmoke
  Scenario Outline: 创建仪表盘所用趋势图
    And open the "trend.ListPage" page for uri "/trend/"
    And I click the "CreateButton" button
    And I click the "Create" button
    Then I will see the "trend.CreatePage" page
    And I set the parameter "SearchInput" with value "<spl>"
    And I wait for "500" millsecond
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "FenPianQuYang" button
    And I alter the input element "FenPianQuYang" value to "0"
    And I wait for "1000" millsecond
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    When I set the parameter "NameInput" with value "<name>"
    And I click the "NextButton" button
    And I wait for "SuccessCreate" will be visible

    Examples:
      | spl                                                                                                                                                                                                                                                                                  | name    |
      | appname:geostats \| parse \"^(?<raw>.*)$\" \| eval array=split(raw, \",\") \| eval lon=todouble(mvindex(array, 3)) \| eval lat=todouble(mvindex(array, 4)) \| eval cnt=tolong(mvindex(array, 2)) \| eval group=mvindex(array, 7) \| geostats latfield=lat longfield=lon count() by group | 仪表盘统计地图 |

  @dashboard @dashboardSmoke
  Scenario Outline: 新建标签页
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘<name>"
    Then I will see the "dashboard.DetailPage" page
    When I set the parameter "TagName" with value "<name>"
    And I click the "EnsureCreateTagButton" button
    And I wait for loading complete
    And I back to before

    Examples:
      | name |
      | 统计地图 |

  @dashboard @dashboardSmoke
  Scenario Outline: 添加图表
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "<name>"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "AddEventButton" will be visible
    When I click the "AddEventButton" button
    And I click the "AddChart" button
    And I wait for "SpinDot" will be invisible
    And I set the parameter "SearchChartInput" with value "<name>"
    And I wait for loading invisible
    And I click the "{'Checkbox':'<name>'}" button
    And I click the "Ensure" button

    Examples:
      | name    |
      | 仪表盘统计地图 |

  @dashboard @dashboardSmoke
  Scenario Outline: 修改为统计地图
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "<name>"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I click the "ChartType" button
    Then I will see the "trend.CreatePage" page
    And I wait for "Map" will be visible
    And I click the "Map" button
    And I click the "Geostatsmap" button
    And I wait for "Progress" will be invisible
    Then I will see the "dashboard.DetailPage" page
    And I wait for "1000" millsecond
    And I click the "TrendTitle" button under some element
    And take part of "FullScreen" with name "dashboard/<name>"
#    Then I compare source image "dashboard/<name>" with target image "dashboard/Geostatsmap"

    Examples:
      | name    |
      | 仪表盘统计地图 |

  @cleanDashboard
  Scenario Outline: 删除仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除仪表盘成功"

    Examples:
      | name    |
      | 仪表盘统计地图 |

  @cleanDashboard
  Scenario Outline: 删除仪表盘所建趋势图
    Given open the "trend.ListPage" page for uri "/trend/"
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I will see the success message "删除成功"

    Examples:
      | name    |
      | 仪表盘统计地图 |