@app @appSmoke
Feature: 应用趋势图

  Background:
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "TrendApp" then i click the "打开" button
    Then I will see the "trend.ListPage" page

  Scenario Outline: 新建趋势图并存为报表
    When I click the "Create" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "TrendApp"
    Then I will see the "trend.CreatePage" page
    When I set the parameter "NameInput" with value "<name>"
    And I click the "NextButton" button
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I click the "NextButton" button
    Then I will see the element "SuccessCreate" name is "新建成功！"
    And I click the "Report" button
    And switch to another window
    And I will see the "app.AppPage" page
    And I will see the element "OldTitle" name is "TrendApp"
    And I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "<reportName>"
    And I set the parameter "Subject" with value "test"
    And I set the parameter "Hour" with value "11"
    And I set the parameter "Minute" with value "11"
    And I click the "NextButton" button
    And I wait for "TrendTitle" will be visible
    And I will see the element "TrendTitle" name is "<name>"
    And I click the "Save" button
    Then I will see the success message "保存成功"

    Examples:
      | name    | spl                                                                          | reportName |
      | AutoApp | tag:*display \| stats count() by apache.clientip,apache.resp_len \| limit 10 | AutoApp    |

  Scenario Outline: 复制趋势图
    When the data name is "<name>" then i click the "复制" button
    And I refresh the website
    Then I will see the search result contains "<name>(副本)"

    Examples:
      | name    |
      | AutoApp |

  Scenario: 搜索趋势图
    When I set the parameter "SearchInput" with value "Auto"
    And I click the "Search" button
    And I wait for loading invisible
    Then I will see the search result "{'column':'0','name':'AutoApp'}"
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "TrendApp"

  Scenario: 编辑趋势图
    When the data name is "AutoApp" then i click the "编辑" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "TrendApp"
    Then I will see the "trend.CreatePage" page
    When I set the parameter "NameInput" with value "AutoAppTrend"
    And I click the "NextButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I wait for "Header" will be visible
    Then I click the "Save" button

  Scenario Outline: 趋势图删除
    When the data name is "<name>" then i click the "删除" button
    And I click the "EnsureButton" button
    And I will see the success message "删除成功"
    And I refresh the website
    Then I will see the search result "{'column':'0','name':'<name>','contains':'no'}"

    Examples:
      | name             |
      | AutoAppTrend(副本) |

  Scenario: 修改分组
    Given open the "trend.ListPage" page for uri "/trend/"
    When the data name is "AutoAppTrend" then i click the "分组" button
    And I choose the "AutoTestRoleWithAllResource" from the "Group"
    And I click the "Ensure" button