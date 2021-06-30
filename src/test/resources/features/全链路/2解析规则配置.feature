@fulllink @fulllinkParseRule
Feature: 全链路_2解析规则配置

  Background:
    Given open the "fulllink.ListPage" page for uri "/fulllink/"
    And I wait for "3000" millsecond
    When the data name is "AutoTest" then i click the "编辑" button
    And I will see the "fulllink.CreatePage" page
    And I wait for "3000" millsecond
    And I wait for "DisabledSave" will be visible
    And I click the "Switch" button
    And I wait for "Save" will be visible

  Scenario: 数据项配置_提示
    And I click the "DataConfig" button
    When I will see the "splSearch.SearchPage" page
    When I set the parameter "SearchInput" with value "index=schedule schedule_name:FullLink_Autotest | table start_timestamp, method, city, node, from, to, _totalCount | rename _totalCount as \"_调用量\""
    And I click the "DateEditor" button under some element
    And I click the "Today" button
    And I wait for "1000" millsecond
    And I click the "SearchButton" button under some element
    And I will see the "fulllink.CreatePage" page
    And I wait for "Table" will be visible
    And I wait for "SuccessMessage" will be invisible
    And I click the "Preview" button
    And I wait for "Message" will be visible
    And I will see the element "Message" contains "请检查链路图解析规则配置"

  Scenario Outline: 解析规则配置
    And I choose the "链路解析规则配置" from the "Settings"
    And I wait for "FieldName" will be visible
    And I set the parameter "FieldName" with value "<fieldName>"
    And I set the parameter "Timestamp" with value "<timestamp>"
    And I set the parameter "StartField" with value "<start>"
    And I set the parameter "EndField" with value "<end>"
    And I set the parameter "NameSeparator" with value "<separator>"
    And I set the parameter "LayerNumber" with value "<layernum>"
    And I click the Circle "FieldName" button
    And I click the "Ensure" button
    And I wait for "Message" will be visible
    And I will see the message contains "各项不能为空且名称分割层数必须大于1！"

    Examples:
    | fieldName   | timestamp    | start    | end    | separator   | layernum    |
    |             |              |          |        |             |             |
    | node        |              |          |        |             |             |
    | node        | timestamp    |          |        |             |             |
    | node        | timestamp    | from     |        |             |             |
    | node        | timestamp    | from     | to     |             |             |
    | node        | timestamp    | from     | to     | _           | .           |
    | node        | timestamp    | from     | to     | _           | 0           |

  Scenario Outline: 解析规则配置_取消
    And I choose the "链路解析规则配置" from the "Settings"
    And I wait for "FieldName" will be visible
    And I set the parameter "FieldName" with value "<fieldName>"
    And I set the parameter "Timestamp" with value "<timestamp>"
    And I set the parameter "StartField" with value "<start>"
    And I set the parameter "EndField" with value "<end>"
    And I set the parameter "NameSeparator" with value "<separator>"
    And I set the parameter "LayerNumber" with value "<layernum>"
    And I click the Circle "FieldName" button
    And I click the "Cancel" button
    And I choose the "链路解析规则配置" from the "Settings"
    And I wait for "FieldName" will be visible
    And I will see the input element "FieldName" value will be ""
    And I will see the input element "Timestamp" value will be ""
    And I will see the input element "StartField" value will be ""
    And I will see the input element "EndField" value will be ""
    And I will see the input element "NameSeparator" value will be ""
    And I will see the input element "LayerNumber" value will be "0"

    Examples:
      | fieldName   | timestamp    | start    | end    | separator   | layernum    |
      | node        | timestamp    | from     | to     | _           | 3           |

  @fulllink_test
  Scenario Outline: 解析规则配置_确定
    And I choose the "链路解析规则配置" from the "Settings"
    And I wait for "FieldName" will be visible
    And I set the parameter "FieldName" with value "<fieldName>"
    And I set the parameter "Timestamp" with value "<timestamp>"
    And I set the parameter "StartField" with value "<start>"
    And I set the parameter "EndField" with value "<end>"
    And I set the parameter "NameSeparator" with value "<separator>"
    And I set the parameter "LayerNumber" with value "<layernum>" using step buttons
    And I click the Circle "FieldName" button
    And I click the "Ensure" button
    And I choose the "链路解析规则配置" from the "Settings"
    And I wait for "FieldName" will be visible
    And I will see the input element "FieldName" value will be "<fieldName>"
    And I will see the input element "Timestamp" value will be "<timestamp>"
    And I will see the input element "StartField" value will be "<start>"
    And I will see the input element "EndField" value will be "<end>"
    And I will see the input element "NameSeparator" value will be "<separator>"
    And I will see the input element "LayerNumber" value will be "<layernum>"
    And I click the "Cancel" button
    And I wait for "5000" millsecond
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    And I will see the element "SuccessMessage" contains "保存成功"

    Examples:
      | fieldName   | timestamp       | start    | end    | separator   | layernum    |
      | node        | start_timestamp | from     | to     | _           | 2           |

