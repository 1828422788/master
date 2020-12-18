@cleanSearchMacro
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

  @delmacros
  Scenario Outline:删除所有宏
    When I set the parameter "macroListSearchInput" with value "<name>"
    And I click the "MacroListDeleteButton" button
    And I wait for "ConfirmDelMacroButton" will be visible
    And I click the "ConfirmDelMacroButton" button

    Examples:
      | name |
      | _ |
      | _ |
      | _ |
      | _ |
      | _ |
      | _ |
      | _ |
      | _ |
      | _ |
      | _ |
      | _ |
      | _ |
      | _ |
      | _ |
      | _ |
      | _ |
      | _ |
      | _ |
      | _ |
      | _ |
      | _ |

  @delmacros1
  Scenario Outline:删除所有宏
    When I set the parameter "macroListSearchInput" with value "<name>"
    And I click the "MacroListDeleteButton" button
    And I wait for "ConfirmDelMacroButton" will be visible
    And I click the "ConfirmDelMacroButton" button

    Examples:
      | name |
      |	mvcount	|
      |	noparam	|
      |	mvappend	|
      |	makesession	|