@fulllink @fulllinkDataConfig
Feature: 全链路_5数据项配置

  Background:
    Given open the "fulllink.ListPage" page for uri "/fulllink/"
    And I wait for "3000" millsecond
    When the data name is "AutoTest" then i click the "编辑" button
    And I will see the "fulllink.CreatePage" page
    And I wait for "3000" millsecond
    And I wait for "DisabledSave" will be visible
    And I click the "Switch" button
    And I wait for "Save" will be visible

  Scenario Outline: 数据项配置_提示
    And I click the "DataConfig" button
    When I will see the "splSearch.SearchPage" page
    When I set the parameter "SearchInput" with value "<spl>"
    And I wait for "1000" millsecond
    And I click the "SearchButton" button under some element
    And I wait for "<sec>" millsecond
    And I will see the "fulllink.CreatePage" page
    And I wait for "Message" will be visible
    And I will see the message contains "<message>"

  Examples:
    | message        | sec  | spl  |
    | spl错误！      | 1000 | tag:sample04061424_chart \| stats/ count() by apache.clientip |
    | 正在搜索数据...| 0    | starttime = \"-1000d\" endtime = \"now/d+24h\" tag:sample04061424_chart \| stats count() by apache.clientip   |

  Scenario: 数据项配置_取消
    And I click the "DataConfig" button
    When I will see the "splSearch.SearchPage" page
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart | stats count() by apache.clientip"
    And I wait for "1000" millsecond
    And I click the "DateEditor" button
    And I click the "Today" button
    And I wait for "1000" millsecond
    And I click the "SearchButton" button under some element
    And I will see the "fulllink.CreatePage" page
    And I wait for "Table" will be visible
    And I click the "Cancel" button
    And I click the "DataConfig" button
    And I will see the "Table" doesn't exist
    When I will see the "splSearch.SearchPage" page
    And I will see the input element "SearchInput" value will be ""
    And I will see the element "DateEditor" contains "-1m, now"

  @fulllink_test
  Scenario: 数据项配置
    And I click the "DataConfig" button
    When I will see the "splSearch.SearchPage" page
    When I set the parameter "SearchInput" with value "index=schedule schedule_name:FullLink_Autotest method:${method} | table start_timestamp, method, city, node, from, to, _totalCount | rename _totalCount as \"_数量\""
    And I click the "DateEditor" button under some element
    And I click the "Today" button
    And I wait for "1000" millsecond
    And I click the "SearchButton" button under some element
    And I will see the "fulllink.CreatePage" page
    And I wait for "Table" will be visible
    And I wait for "SuccessMessage" will be invisible
    And I click the "Preview" button
    And I wait for "5000" millsecond
    And I wait for "Preview" will be invisible
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    And I will see the element "SuccessMessage" contains "保存成功"

  Scenario Outline: 选择输入项
    When I click the "Filter" button
    And I wait for "FirstInput" will be visible
    And I choose the "<input>" from the "FirstInputList"
    And I wait for "SuccessMessage" will be visible
    And I will see the element "SuccessMessage" contains "更新变量 "method" 成功"
    And I click the "Update" button
    And I wait for "SuccessMessage" will be invisible
    And I will see the element "NumLabel_1" contains "<num1>"
    And I will see the element "NumLabel_2" contains "<num2>"
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    And I will see the element "SuccessMessage" contains "保存成功"

  Examples:
    | input    | num1 | num2 |
    | POST     | 1    | 7    |
    | GET      | 1    | 9    |
    | *        | 2    | 16   |

  Scenario: 改变名称分割层数
    And I choose the "链路解析规则配置" from the "Settings"
    And I wait for "FieldName" will be visible
    And I set the parameter "LayerNumber" with value "3"
    And I click the Circle "FieldName" button
    And I click the "Ensure" button
    And I wait for "5000" millsecond
    And I will see the element "NumLabel_3" contains "16"
    And I choose the "链路解析规则配置" from the "Settings"
    And I wait for "FieldName" will be visible
    And I set the parameter "LayerNumber" with value "2"
    And I click the Circle "FieldName" button
    And I click the "Ensure" button
    And I wait for "5000" millsecond
    And I will see the "NumLabel_3" doesn't exist
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    And I will see the element "SuccessMessage" contains "保存成功"