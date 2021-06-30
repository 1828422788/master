@fulllink @fulllinkDataConfig
Feature: 全链路_数据项配置

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

  Scenario: 数据项配置
    When the data name is "FullLink_Test" then i click the "编辑" button
    And I will see the "fulllink.CreatePage" page
    And I wait for "3000" millsecond
    And I wait for "DisabledSave" will be visible
    And I click the "Switch" button
    And I wait for "Save" will be visible
    And I click the "DataConfig" button
    When I will see the "splSearch.SearchPage" page
    When I set the parameter "SearchInput" with value "index=schedule schedule_name:FullLink_Autotest method:${method} | table start_timestamp, method, city, node, from, to, _totalCount | rename _totalCount as \"_调用量\""
    And I click the "DateEditor" button under some element
    And I click the "Today" button
    And I wait for "1000" millsecond
    And I click the "SearchButton" button under some element
    And I will see the "fulllink.CreatePage" page
    And I wait for "Table" will be visible
    And I wait for "SuccessMessage" will be invisible
    And I click the "Preview" button
    And I wait for "SuccessMessage" will be visible
    And I will see the element "SuccessMessage" contains "创建链路图成功"
    And I wait for "5000" millsecond
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    And I will see the element "SuccessMessage" contains "保存成功"