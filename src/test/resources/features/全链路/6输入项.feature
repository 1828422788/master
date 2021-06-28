@fulllink @fulllinkInputItem
Feature: 全链路_输入项

  Background:
    Given open the "fulllink.ListPage" page for uri "/fulllink/"
    And I wait for "3000" millsecond

  Scenario Outline: 输入项_空
    When the data name is "FullLink_Test" then i click the "编辑" button
    And I will see the "fulllink.CreatePage" page
    And I wait for "3000" millsecond
    And I wait for "DisabledSave" will be visible
    And I click the "Switch" button
    And I wait for "Save" will be visible
    And I click the "AddInputItem" button
    And I wait for "Token" will be visible
    And I set the parameter "Title" with value "<title>"
    And I set the parameter "Token" with value "<token>"
    And I click the "Ensure" button
    And I wait for "Message" will be visible
    And I will see the message contains "请填写必填项"

  Examples:
    | title    | token     |
    | title    |           |
    |          | token     |

  Scenario Outline: 输入项_可选值为空
    When the data name is "FullLink_Test" then i click the "编辑" button
    And I will see the "fulllink.CreatePage" page
    And I wait for "3000" millsecond
    And I wait for "DisabledSave" will be visible
    And I click the "Switch" button
    And I wait for "Save" will be visible
    And I click the "AddInputItem" button
    And I wait for "Token" will be visible
    And I set the parameter "Title" with value "productNoname"
    And I set the parameter "Token" with value "productNoname"
    And I wait for "2000" millsecond
    And I choose the "下拉菜单" from the "ParameterType" in config
    And I wait for "Value" will be visible
    And I set the parameter "Value" with value "<value>"
    And I set the parameter "Label" with value "<label>"
    And I click the "Add" button
    And I wait for "Message" will be visible
    And I will see the message contains "值不能为空"

   Examples:
    | value   | label   |
    |         |         |
    |         | label   |

  Scenario Outline: 输入项_动态字段为空
    When the data name is "FullLink_Test" then i click the "编辑" button
    And I will see the "fulllink.CreatePage" page
    And I wait for "3000" millsecond
    And I wait for "DisabledSave" will be visible
    And I click the "Switch" button
    And I wait for "Save" will be visible
    And I click the "AddInputItem" button
    And I wait for "Token" will be visible
    And I set the parameter "Title" with value "productNoname"
    And I set the parameter "Token" with value "productNoname"
    And I wait for "2000" millsecond
    And I choose the "动态菜单" from the "ParameterType" in config
    And I wait for "SPL" will be visible
    And I set the value "<spl>" to the textarea "SPL"
    And I set the parameter "DynamicField" with value "<dyn_field>"
    And I click the "Ensure" button
    And I wait for "Message" will be visible
    And I will see the message contains "请填写必填项"

  Examples:
    | spl | dyn_field |
    |     |           |
    | *   |           |
