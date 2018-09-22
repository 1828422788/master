@all @searchMacro
Feature: 新建搜索宏

  Background:
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    When I click the "CreateButton" button
    Then I will see the "searchMacro.CreatePage" page

  Scenario Outline:
    When I set the parameter "Name" with value "<name>"
    And I choose the "<group>" from the "Group"
    And I set the parameter "Definition" with value "<definition>"
    And I set the parameter "Param" with value "<param>"
    And I set the parameter "ValidateExpression" with value "<validateExpression>"
    And I set the parameter "ValidateFalseInfo" with value "<validateFalseInfo>"
    And I click the "SaveButton" button
    Then I will see the <message>

    Examples: 新建失败
      | name | group         | definition | param | validateExpression | validateFalseInfo | message                 |
      |      |               |            |       |                    |                   | error message "名称不能为空"  |
      | test |               |            |       |                    |                   | error message "请选择资源分组" |
      | test | default_Macro |            |       |                    |                   | error message "定义不能为空"  |

    Examples: 新建成功
      | name     | group         | definition | param | validateExpression | validateFalseInfo | message |
      | AutoTest | default_Macro | $arg1$     |       |                    |                   | 保存成功    |
