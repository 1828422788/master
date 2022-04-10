@all @searchMacro @smoke @searchMacroSmoke
Feature: 编辑搜索宏

  Background:
    Given open the "macroSearch.ListPage" page for uri "/macro/"
    And I wait for loading invisible

  Scenario: 编辑搜索宏并成功保存
    When the data name is "me_substr_1(1)" then i click the "编辑" button
    Then I will see the "macroSearch.CreatePage" page
    And I set the parameter "macroName" with value "changedName(1)"
    And I click the "saveMacroButton" button
    Then I will see the success message "保存成功"
    And I wait for "1000" millsecond
    And I click the Element with text "确定"
    Then I will see the text "changedName(1)" exist in page



