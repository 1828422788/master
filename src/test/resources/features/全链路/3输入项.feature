@fulllink @fulllinkInputItem
Feature: 全链路_3输入项

  Background:
    Given open the "fulllink.ListPage" page for uri "/fulllink/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "AutoTest"
    And I wait for loading invisible
    When the data name is "AutoTest" then i click the "编辑" button
    And I will see the "fulllink.CreatePage" page
    And I wait for "3000" millsecond
    And I wait for "DisabledSave" will be visible
    And I click the "Switch" button
    And I wait for "Save" will be visible

  Scenario: 没有输入项
    When I click the "Filter" button
    And I wait for "2000" millsecond
    And I will see the text "当前没有可操作的输入项" exist in page

  Scenario Outline: 输入项_空
    And I click the "AddInputItem" button
    And I wait for "Token" will be visible
    And I set the parameter "Title" with value "<title>"
    And I set the parameter "Token" with value "<token>"
    And I click the "Ensure" button
    And I wait for "Message" will be visible
    And I will see the message contains "请检查必填项"

  Examples:
    | title    | token     |
    | title    |           |
    |          | token     |

  Scenario Outline: 输入项_可选值为空
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

  Scenario: 输入项_添加已经存在的
    And I click the "AddInputItem" button
    And I wait for "Token" will be visible
    And I set the parameter "Title" with value "productNoname"
    And I set the parameter "Token" with value "productNoname"
    And I wait for "2000" millsecond
    And I choose the "下拉菜单" from the "ParameterType" in config
    And I wait for "Value" will be visible
    And I set the parameter "Value" with value "value"
    And I click the "Add" button
    And I set the parameter "Value" with value "value"
    And I click the "Add" button
    And I wait for "Message" will be visible
    And I will see the message contains "当前值已经存在"

  Scenario Outline: 添加输入项
    And I click the "AddInputItem" button
    And I wait for "Token" will be visible
    And I set the parameter "Title" with value "name"
    And I set the parameter "Token" with value "name"
    And I wait for "2000" millsecond
    And I choose the "下拉菜单" from the "ParameterType" in config
    And I wait for "Value" will be visible
    And I set the parameter "Value" with value "<value>"
    And I set the parameter "Label" with value "<label>"
    And I click the "Add" button
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    And I will see the element "SuccessMessage" contains "创建变量 "name" 成功"
    And I wait for "SuccessMessage" will be invisible
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    And I will see the element "SuccessMessage" contains "保存成功"

    Examples:
      | value   | label   |
      | value   | label   |
  
  Scenario: 删除输入项
    When I click the "Filter" button
    And I wait for "FirstInput" will be visible
    When I move the mouse pointer to the "FirstInput"
    And I wait for "FirstInputDelete" will be visible
    And I click the "FirstInputDelete" button
    And I wait for "SuccessMessage" will be visible
    And I will see the element "SuccessMessage" contains "删除变量 "name" 成功"
    And I wait for "SuccessMessage" will be invisible
    And I will see the text "当前没有可操作的输入项" exist in page
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    And I will see the element "SuccessMessage" contains "保存成功"

  Scenario Outline: 输入项_动态字段_提示
    And I click the "AddInputItem" button
    And I wait for "Token" will be visible
    And I set the parameter "Title" with value "productNoname"
    And I set the parameter "Token" with value "productNoname"
    And I wait for "2000" millsecond
    And I choose the "动态菜单" from the "ParameterType" in config
    And I wait for "SPL" will be visible
    And I set the value "<spl>" to the textarea "SPL"
    And I set the parameter "DynamicField" with value "<dyn_field>"
    And I click the "<button>" button
    And I wait for "<element>" will be visible
    And I will see the element "<element>" contains "<message>"

  Examples:
    | spl | dyn_field   | button  | element             | message          |
    |     |             | Ensure  | Message             | 请检查必填项     |
    | *   |             | Ensure  | Message             | 请检查必填项     |
    |     |             | Search  | Message             | 搜索语句不能为空 |
    | *   |             | Search  | Message             | 请输入动态字段   |
    | *\\ |apache.method| Search  | SearchResultMessage | 搜索失败         |
    | *   |apache.method| Search  | SearchResultMessage | 搜索成功         |

  @fulllinkSmoke
  Scenario: 输入项
    And I click the "AddInputItem" button
    And I wait for "Token" will be visible
    And I set the parameter "Title" with value "method"
    And I set the parameter "Token" with value "method"
    And I wait for "2000" millsecond
    And I choose the "下拉菜单" from the "ParameterType" in config
    And I wait for "Value" will be visible
    And I set the parameter "Value" with value "POST"
    And I click the "Add" button
    And I set the parameter "Value" with value "GET"
    And I click the "Add" button
    And I choose the "POST" from the "DefaultValue" in config
    And I wait for "2000" millsecond
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    And I will see the element "SuccessMessage" contains "创建变量 "method" 成功"
    And I wait for "5000" millsecond
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    And I will see the element "SuccessMessage" contains "保存成功"

  @fulllinkSmoke
  Scenario: 输入项
    When I click the "Filter" button
    And I wait for "FirstInput" will be visible
    When I move the mouse pointer to the "FirstInput"
    And I click the "FirstInputEdit" button
    And I wait for "Token" will be visible
    And I set the parameter "Value" with value "*"
    And I click the "Add" button
    And I choose the "*" from the "DefaultValue" in config
    And I wait for "2000" millsecond
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    And I will see the element "SuccessMessage" contains "更新变量 "method" 成功"
    And I wait for "5000" millsecond
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    And I will see the element "SuccessMessage" contains "保存成功"