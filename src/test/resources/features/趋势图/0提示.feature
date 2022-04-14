@trend @trendPrompt
Feature: 趋势图_提示

  Scenario Outline: trend_message_error
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    When I set the parameter "SearchInput" with value "* | stats count()"
    And I click the "DateEditor" button
    And I click the "<timePeriod>" button
    And I click the "SearchButton" button
    And I wait for "SaveAsOther" will be visible
    Then I click the "SaveAsOther" button
    Then I click the "Trend" button
    And I wait for "TrendName" will be visible
    When I set the parameter "TrendName" with value "<name>"
    And I click the "EnsureButton" button
    And I wait for "TipText" will be visible
    And I will see the element "TipText" contains "<message>"

    Examples:
      | timePeriod    | name | message           |
      | Today         |      | 名称格式有误，仅支持中文、数字、字母、中划线、下划线以及括号的组合。 |
      | Today         |a/b   | 名称格式有误，仅支持中文、数字、字母、中划线、下划线以及括号的组合。 |

  Scenario: cancel_test
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I drag the element "SearchPageSvg" to the "right" side
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart | stats count()"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "SaveAsOther" will be visible
    Then I click the "SaveAsOther" button
    Then I click the "Trend" button
    And I wait for "TrendName" will be visible
    When I set the parameter "TrendName" with value "test"
    And I choose the "test_app" from the "AppComboBox"
    And I set the parameter "TagInput" with value "auto_package"
    And I click the "SelectAddedTag" button
    And I set the parameter "Describe" with value "testing"
    And I click the "Cancel" button

    And I click the "SaveAsOther" button
    And I click the "Trend" button
    And I will see the input element "TrendName" value will be ""
    And I will see the input element "Describe" value will be ""
    And I will see the "SelectedApp" doesn't exist
    And I will see the "SelectedTag" doesn't exist

  Scenario Outline:  prompt
    Given open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading complete
    And I wait for "2000" millsecond
    When I click the "NewTrendFromDataset" button
    When I click the "<type>Dataset" button
    And I click the "Ensure" button
    Then I will see the "trend.DragAndDropPage" page
    And I wait for "2000" millsecond
    And I wait for "NextButton" will be visible
    And I will see the "SaveAsDataset" doesn't exist
    And I will see the "DatasetSPL" doesn't exist
    And I will see the "Overview" doesn't exist
    And I click the "NextButton" button
    And I will see the element "Prompt" contains "<message>"

    Examples:
      |  type    | message         |
      | Single   | 请拖入数据集    |
      | Multi    | 请选择数据集    |
      | Union    | 请选择数据集    |

  Scenario:  union_prompt
    Given open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading complete
    And I wait for "2000" millsecond
    When I click the "NewTrendFromDataset" button
    When I click the "UnionDataset" button
    And I click the "Ensure" button
    Then I will see the "trend.DragAndDropPage" page
    And I wait for "2000" millsecond
    When I drag the element "Dataset_1" to the "DropDataset"
    And I drag the element "Dataset_2" to the "DropDataset"
    And I drag the element "ClientipInTable" to the "EmptySpace"
    And I click the "NextButton" button
    And I will see the element "Prompt" contains "请先修改字段名"
    And I click the "EnsureButton" button
    And I set the parameter "LastColumn" with value ""
    And I click the "NextButton" button
    And I wait for "EnsureButton" will be visible
    And I will see the element "Prompt" contains "请先修改字段名"
    And I click the "EnsureButton" button
    And I set the parameter "LastColumn" with value "apache.method"
    And I click the "NextButton" button
    And I wait for "EnsureButton" will be visible
    And I will see the element "Prompt" contains "请先修改字段名"

  Scenario: new_trend_1
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page
    And I wait for "Loading" will be invisible
    And I wait for "1000" millsecond
    And I will see the element "SearchInput" contains "*"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Loading" will be invisible
    Then I wait for "CheckBox" will be visible
    And I click the "NextButton" button
    And I wait for "EnsureButton" will be visible
    And I will see the element "Prompt" contains "请选择字段"

  Scenario: new_trend_2
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page
    And I wait for element "SearchStatus" change text to "搜索完成!"
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart | stats count()"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I wait for "2000" millsecond
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I wait for "NameInput" will be visible
    And I click the "Complete" button
    And I wait for "TipText" will be visible
    And I will see the element "TipText" contains "名称格式有误，仅支持中文、数字、字母、中划线、下划线以及括号的组合。"

  Scenario: new_trend_step2_change
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page
    And I wait for element "SearchStatus" change text to "搜索完成!"
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I wait for "CheckBox" will be visible
    When I "checked" the checkbox which name is "timestamp" in trend page
    And I wait for "CheckBox" will be visible
    And I "checked" the checkbox which name is "apache.clientip" in trend page
    And I wait for "CheckBox" will be visible
    And I click the "NextButton" button
    And I will see the "trend.DragAndDropPage" page
    And I wait for "Dimensions" will be visible
    
    And I will see the "trend.CreatePage" page
    And I click the "BackButton" button
    And I wait for "SearchInput" will be visible
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the input element "SearchInput" value will be "tag:sample04061424_chart"
    And I will see the element "DateEditor" contains "今天"
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart | stats count() by apache.clientip"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I wait for "2000" millsecond
    And I wait for "Header" will be visible
    And I will see the "Type" is display
    And I will see the "Dimensions" doesn't exist