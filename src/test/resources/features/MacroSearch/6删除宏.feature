@searchMacro @searchMacroSmoke
Feature: 删除搜索宏

  Background:
    Given open the "macroSearch.ListPage" page for uri "/macro/"
    And I wait for loading invisible

  Scenario Outline: 删除搜索宏成功
    When the data name is "<String>" then i click the "删除" button in more menu
    Then I will see the message "确认删除 [<String>] ?"
    And I click the Element with text "确定"
    And I wait for element "Message" change text to "删除成功"
    And I click the Element with text "确定"
    Then I will see the text "<String>" is not existed in page

    Examples:删除成功
      | String         |
      | changedName(1) |