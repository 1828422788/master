@cleanSearchMacro
Feature: 搜索宏删除

  Background:
    Given open the "macroSearch.ListPage" page for uri "/macro/"

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

  @delsmacro
  Scenario Outline: 删除全部搜索宏
    Given open the "macroSearch.ListPage" page for uri "/macro/"
#    When I set the parameter "MacroListSearchInput" with value "<name>"
    And I click the "MacroListDeleteButton" button
    And I wait for "ConfirmDelMacrotButton" will be visible
    And I click the "ConfirmDelMacroButton" button

    Examples:
      | name |
      |	_	|
      |	_	|
      |	_	|
      |	_	|
      |	_	|
      |	_	|
      |	_	|
      |	_	|
      |	_	|
      |	_	|
      |	_	|
      |	_	|
      |	_	|
      |	_	|
      |	_	|
      |	_	|
      |	_	|
      |	_	|
      |	_	|
      |	_	|
      |	_	|
      |	_	|
      |	_	|
      |	_	|
      |	_	|
      |	_	|
      |	_	|
      |	_	|
      |	_	|
      |	_	|
      |	_	|
      |	_	|
      |	_	|
