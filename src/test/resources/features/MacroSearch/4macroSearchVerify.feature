@searchMacro
Feature: 验证搜索宏

  Background:
    Given open the "macroSearch.ListPage" page for uri "/macro/"

  Scenario Outline: 验证（eval）
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I set the parameter "SearchInput" with value "<splQuery>"
    And I click the "DateEditor" button
    And I click the "LastMonth" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "RightIcon" button
    Then I will see the "XValue" result will be "<value>"

    Examples: 新建成功
      | splQuery                                          | value                |
      | tag:sample04061424 \| eval x=`UIAutoTest1(1,2,3)` | if(isstr(3),1-2,1+2) |

  Scenario Outline:用例：期望基于eval定义的结果出错
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I set the parameter "SearchInput" with value "<macroSearch>"
    And I click the "DateEditor" button
    And I click the "LastMonth" button
    And I click the "SearchButton" button
    And take a screenshot with name "macro_<name>.png"
    Then I will see the element "searchErrorStatus" contains "执行错误"

    Examples:
      | name         | macroSearch                                                 |
      | m1_eval_2(2) | tag:sample04061424 \| eval x=`m1_eval_2(1,2)` \| table x    |
      | me_if_excp_2 | tag:sample04061424 \| eval x=`me_if_excp_2(1,2)` \| table x |