@searchMacro @searchMacroSmoke
Feature: 编辑搜索宏

  Background:
    Given open the "macroSearch.ListPage" page for uri "/macro/"
    And I wait for loading invisible

  Scenario: 编辑搜索宏并成功保存
    Given I set the parameter "MacroListSearchInput" with value "UIAutoTest(1)"
    When the data name is "UIAutoTest(1)" then i click the "编辑" button
    Then I will see the "macroSearch.CreatePage" page
    And I set the parameter "macroName" with value "changedName(1)"
    And I click the "saveMacroButton" button
    Then I will see the success message "保存成功"
    And I wait for loading invisible
    And I click the Element with text "确定"
    And I wait for loading invisible
    Then I will see the "macroSearch.ListPage" page
    And I set the parameter "MacroListSearchInput" with value "changed"
    Then I will see the text "changedName(1)" exist in page



