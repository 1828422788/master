@all @searchMacro @smoke @searchMacroSmoke
Feature: 搜索宏编辑

  Background:
    Given open the "searchMacro.ListPage" page for uri "/macro/"

  Scenario: 编辑搜索宏并成功保存
    When the data name is "UIAutoTest(1)" then i click the "编辑" button
    Then I will see the "searchMacro.CreatePage" page
    And I set the parameter "Name" with value "UIAutoTestEdit(1)"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"

  Scenario: 验证搜索宏是否修改成功
    Then I will see the search result contains "{'column':'0','name':'UIAutoTestEdit(1)'}"

