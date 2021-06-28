@fulllink @fulllinkDataConfig
Feature: 全链路_数据项配置

  Background:
    Given open the "fulllink.ListPage" page for uri "/fulllink/"
    And I wait for "3000" millsecond

  Scenario Outline: 数据项配置
    When the data name is "AutoTest" then i click the "编辑" button
    And I will see the "fulllink.CreatePage" page
    And I wait for "3000" millsecond
    And I wait for "DisabledSave" will be visible
    And I click the "Switch" button
    And I wait for "Save" will be visible
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