@newallsaved
Feature: 新建全部已存搜索用例

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"

  @newallsaved
  Scenario Outline: 批量新建搜索
    When I set the parameter "SearchInput" with value "<splQuery>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I choose1 the "新建" from the "SavedSearch"
    And I wait for loading invisible
    And I set the parameter "SavedSearchName" with value "<name>"
    And I choose the "auto_ui" from the "GroupComboBox"
    And I click the "EnsureCreateSavedSearch" button
    Then I will see the success message "创建成功"

    @newallsaved
    Examples: 保存成功
      | name     | splQuery                                  |
      | eval_noempty_logic_and | tag:sample04061424 \| eval bool_is_empty=empty(apache.request_path) \| eval bool_not_empty=! empty(apache.request_path) \| eval bool_is_false= false && empty(apache.request_path) \| table bool_is_empty, bool_not_empty,bool_is_false, apache.x_forward \| sort by  apache.x_forward |
