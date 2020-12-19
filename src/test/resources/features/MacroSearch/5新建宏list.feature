@all @searchMacro @macrofail
Feature: 搜索宏新建

  @nmacro3
  Scenario Outline:两个参数
    Given open the "macroSearch.ListPage" page for uri "/macro/"
    When I click the "CreateMacroButton" button
    Then I will see the "macroSearch.CreatePage" page
    When I set the parameter "MacroName" with value "<name>"
#    And I choose the "1pre_package" from the "MacroResTag"
#    And I choose the "无数集app之api全部测试用例" from the "BelongToApps"
    And I set the parameter "Definition" with value "<definition>"
    And I set the parameter "MacroParam" with value "<param>"
    And I set the parameter "ValidateExpression" with value "<validateExpression>"
    And I set the parameter "ValidateFalseInfo" with value "<validateFalseInfo>"

    And I click the "SaveMacroButton" button
    Then I will see the "<ResultMessage>"

    Examples: 新建失败
      | name | definition | param | validateExpression | validateFalseInfo | ResultMessage          |
      |      |            |       |                    |                   | error message "名称不能为空" |