@all @searchMacro @smoke @searchMacroSmoke
Feature: 搜索宏分组

  Background:
    Given open the "searchMacro.ListPage" page for uri "/macro/"

  Scenario: 修改搜索宏分组
    When the data name is "UIAutoTest(2)" then i click the "分组" button
    And I choose the "AutoTestRoleWithAllResource" from the "Group"
    And I click the "EnsureButton" button
    Then I will see the success message "保存成功"
