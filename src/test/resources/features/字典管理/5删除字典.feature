@cleanDictionary
Feature: 字典_删除

  Scenario Outline: RZY-4158删除字典
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    And I wait for loading invisible
    Then I set the parameter "SearchInput" with value "<dictionaryName>.csv"
    And I wait for loading invisible
    When the data name is "{'column':'0','name':'<dictionaryName>.csv'}" then i click the "删除" button in more menu
    Then I will see the success message "确认删除 [<dictionaryName>.csv] ?"
    When I click the "Ensure" button
    Then I wait for element "SuccessMessage" change text to "删除成功"

    Examples:
      | dictionaryName        |
      | test_上方插入行       |
      | test_下方插入行       |
      | test_左方插入列       |
      | test_右方插入列       |
      | test_移除该行         |
      | test_清空该列         |
      | test_剪切             |
      | test_重置             |