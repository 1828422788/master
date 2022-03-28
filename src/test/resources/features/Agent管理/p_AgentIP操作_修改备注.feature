@agent @agentConfig
Feature: Agent管理ip_修改备注信息

  Background:
    Given open the "agent.ListPage" page for uri "/sources/input/agent/"
    And I wait for loading invisible
    And I zoom the browse to full screen
    And I close all tabs except main tab

  Scenario Outline: 修改备注成功
    And I wait for loading invisible
    Then the column is "0" then i click the "更多" button in agent page
    And I wait for loading invisible
    And I click the "MemoButton" button
    And I set the parameter "Memo" with value "<memory>"
    And I click the "MemoEnsure" button

    Examples: 备注成功
      | memory  |
      | 中文中文    |
      | test    |
      | *A￥,%&^ |
      | 68      |

  Scenario Outline: 修改备注失败
    And I wait for loading invisible
    Then the column is "0" then i click the "更多" button in agent page
    And I wait for loading invisible
    And I click the "MemoButton" button
    And I set the parameter "Memo" with value "<memory>"
    And  I wait for loading invisible

    Examples: 备注失败
      | memory                                                                                                                                                                                                                       | errormessage      |
      | test中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试 | 请输入不大于 256 字节的内容！ |