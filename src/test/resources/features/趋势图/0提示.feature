@all @trend
Feature: 趋势图_提示

  Scenario Outline: trend_message_error
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    When I set the parameter "SearchInput" with value "* | stats count()"
    And I click the "DateEditor" button under some element
    And I click the "<timePeriod>" button
    And I click the "SearchButton" button under some element
    And I wait for "SaveAsOther" will be visible
    Then I click the "SaveAsOther" button
    Then I click the "Trend" button
    And I wait for "TaskName" will be visible
    When I set the parameter "TaskName" with value "<name>"
    And I click the "EnsureButton" button
    And I wait for "TimeTaskEnsure" will be visible
    Then I will see the success message "<message>"

    Examples:
      | timePeriod    | name | message           |
      | Today         |      | 请填写名称！            |
      | Today         |a/b   | 名称格式有误，仅支持中文，数字，字母，中划线以及下划线的组合。 |
      | ThirtySeconds | test | 实时窗口搜索模式无法进行该操作!|


  Scenario Outline:  prompt
    Given open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading complete
    And I wait for "2000" millsecond
    When I click the "NewTrendFromDataset" button
    When I click the "<type>Dataset" button
    And I click the "EnsureButton" button
    Then I will see the "trend.DragAndDropPage" page
    And I wait for "2000" millsecond
    And I click the "<button>" button
    And I wait for "EnsureButton" will be visible
    And I will see the element "Prompt" contains "<message1>"

    Examples:
      |  type    | button        | message1       |
      | Single   | NextButton    | 请选择字段     |
      | Multi    | NextButton    | 请选择数据集   |
      | Union    | NextButton    | 请选择字段     |
      | Multi    | CheckSPL      | 请选择数据集   |
      | Multi    | SaveAsDataset | 请选择数据集   |
      | Union    | Overview      | 当前无搜索语句 |

  Scenario:  union_prompt
    Given open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading complete
    And I wait for "2000" millsecond
    When I click the "NewTrendFromDataset" button
    When I click the "UnionDataset" button
    And I click the "EnsureButton" button
    Then I will see the "trend.DragAndDropPage" page
    And I wait for "2000" millsecond
    When I drag the element "Dataset_1" to the "DropDataset"
    And I drag the element "Dataset_2" to the "DropDataset"
    And I drag the element "ClientipInTable" to the "EmptySpace"
    And I click the "NextButton" button
    And I will see the element "Prompt" contains "请先修改重名的字段"
    And I click the "EnsureButton" button
    And I set the parameter "LastColumn" with value "apache.method"
    And I click the "NextButton" button
    And I wait for "EnsureButton" will be visible
    And I will see the element "Prompt" contains "请先修改重名的字段"

  Scenario: new_trend_1
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page
    And I wait for "Loading" will be invisible
    And I wait for "1000" millsecond
    And I will see the element "SearchInput" contains "*"
    And I wait for "Loading" will be invisible
    And I click the "NextButton" button under some element
    And I wait for "EnsureButton" will be visible
    And I will see the element "Prompt" contains "请选择字段"

  Scenario: new_trend_2
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page
    And I wait for "Loading" will be invisible
    And I wait for "1000" millsecond
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart | stats count()"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button under some element
    And I wait for "Loading" will be invisible
    And I wait for "Header" will be visible
    And I click the "NextButton" button under some element
    And I wait for "2000" millsecond
    And I wait for "Header" will be visible
    And I click the "NextButton" button under some element
    And I wait for "NameInput" will be visible
    And I click the "NextButton" button under some element
    And I wait for "EnsureButton" will be visible
    And I will see the element "Prompt" contains "名称 不能为空"
