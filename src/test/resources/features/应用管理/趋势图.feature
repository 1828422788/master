@app @appSmoke
Feature: 应用趋势图

  Scenario Outline: 新建趋势图并存为报表
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "TrendApp" then i click the "打开" button
    Then I will see the "trend.ListPage" page
    And I click the "CreateButton" button
    And I click the "Create" button
    Then I will see the "trend.CreatePage" page
    And I set the parameter "SearchInput" with value "tag:*display | stats count() by apache.clientip,apache.resp_len | limit 10 "
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    When I set the parameter "NameInput" with value "<name>"
    And I click the "NextButton" button
    And I wait for "SuccessCreate" will be visible
    And I click the "Report" button
    And switch to another window
    And I close all tabs except main tab
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "TrendApp"
    And I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "<name>"
    And I choose the "PDF" from the "ReportType"
    And I set the parameter "Subject" with value "test"
    And I set the parameter "Hour" with value "11"
    And I set the parameter "Minute" with value "11"
    And I click the "NextButton" button
    And I wait for "TrendTitle" will be visible
    And I will see the element "TrendTitle" name is "1<name>"
    And I click the "Save" button
    Then I will see the success message "保存成功"

    Examples:
      | name    |
      | AutoApp |

  Scenario Outline: 复制趋势图
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "TrendApp" then i click the "打开" button
    Then I will see the "trend.ListPage" page
    When the data name is "<name>" then i click the "复制" button
    Then I will see the message "复制成功"

    Examples:
      | name    |
      | AutoApp |

  Scenario: 搜索趋势图
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "TrendApp" then i click the "打开" button
    Then I will see the "trend.ListPage" page
    When I set the parameter "SearchInput" with value "AutoApp(副本)"
    And I click the "Search" button
    And I wait for loading invisible
    Then I will see the search result "AutoApp(副本)"
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "TrendApp"

  Scenario: 标签
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "TrendApp" then i click the "打开" button
    Then I will see the "trend.ListPage" page
    When the data name is "AutoApp(副本)" then i click the "标签" button
    And I set the parameter "Tag" with value "testTag"
    And I choose the "testTag" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "更新成功"

  Scenario: 按照标签搜索
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "TrendApp" then i click the "打开" button
    Then I will see the "trend.ListPage" page
    When I choose the "testTag" from the "ResourceDropdown"
    And I wait for loading invisible
    Then I will see the search result contains "AutoApp(副本)"
    Then I will see the search result "{'column':'0','name':'AutoApp','contains':'no'}"

  Scenario: 编辑趋势图
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "TrendApp" then i click the "打开" button
    Then I will see the "trend.ListPage" page
    When the data name is "AutoApp" then i click the "编辑" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "TrendApp"
    Then I will see the "trend.CreatePage" page
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    When I set the parameter "NameInput" with value "AutoApp"
    And I choose the "TrendApp" from the "AppDropdown"
    And I click the "NextButton" button
    Then I will see the element "SuccessUpdate" name is "更新成功"

  Scenario: 按照应用搜索
    Given open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading invisible
    And I choose the "TrendApp" from the "AppDropdown"
    And I wait for loading invisible
    Then I will see the search result contains "AutoApp(副本)"
    Then I will see the search result "{'column':'0','name':'AutoApp','contains':'no'}"

  Scenario: 修改app资源范围为全局
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "TrendApp" then i click the "编辑" button
    Then I will see the "app.CreatePage" page
    And I wait for loading invisible
    And I click the "OverallSituation" button
    And I click the "SaveButton" button
    Then I will see the success message "更新成功"

  Scenario Outline: 趋势图删除
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "TrendApp" then i click the "打开" button
    Then I will see the "trend.ListPage" page
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I will see the success message "删除成功"

    Examples:
      | name        |
      | AutoApp(副本) |
      | AutoApp     |

  Scenario: 删除报表
    Given open the "report.ListPage" page for uri "/reports/"
    When the data name is "{'column':'1','name':'AutoApp'}" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button

