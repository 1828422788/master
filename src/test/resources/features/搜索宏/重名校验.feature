@all @searchMacro
Feature: 搜索宏重名校验

  Background:
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    And I click the "CreateButton" button
    Then I will see the "searchMacro.CreatePage" page

  Scenario Outline:
    When I set the parameter "Name" with value "<name>"
    And I choose the "<group>" from the "Group"
    And I set the parameter "Definition" with value "<definition>"
    And I click the "SaveButton" button
    Then I will see the success message "<message>"

    Examples: 新建成功
      | name     | group         | definition | message |
      | AutoTest | default_Macro | $arg1$     | 保存成功    |