@all @searchMacro @smoke @searchMacroSmoke
Feature: 搜索宏删除

  Background:
    Given open the "searchMacro.ListPage" page for uri "/macro/"

  Scenario Outline:
    When the data name is "<name>" then i click the "删除" button
    And I click the "EnsureDelete" button
    And I refresh the website
    Then I will see the search result "{'column':'0','name':'<name>','contains':'no'}"

    Examples:
      | name              |
      | UIAutoTestEdit(1) |
      | UIAutoTest(2)     |
      | UIAutoTest(3)     |
      | UIAutoTest1(3)    |
      | UIAutoTest1(1)    |