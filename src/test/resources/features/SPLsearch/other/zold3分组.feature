Feature: 已存搜索分组

  Background:
    Given open the "splSearch.SavedSearchPage" page for uri "/savedsearches/"

  Scenario Outline:
    And I set the parameter "SearchInput" with value "<name>"
    And I wait for loading invisible
    Then I will see the search result "{'column':'1','name':'<name>'}"
    When the data name is "{'column':'1','name':'<name>'}" then i click the "分组" button
    Then I <group>
    And I click the "Ensure" button
    Then I will see the success message "保存成功"

    Examples:
      | name     | group                                                      |
      | AutoTest | cancel selection "default_SavedSearch" from the "ChangeGroup" |
      | AutoTest | choose the "default_SavedSearch" from the "ChangeGroup" |