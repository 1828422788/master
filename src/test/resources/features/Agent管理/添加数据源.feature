Feature: 操作

  Background:
    Given open the "agent.ListPage" page for uri "/sources/input/agent/"
    And I wait for loading invisible

  Scenario Outline: Agent添加数据源校验
    When I click the detail which name is "<ip>"
    And switch to another window
    And I will see the "agent.CreatePage" page
    And I click the "Create" button
    And I click the "Next" button
    Then I will see the element "MemoMessage" name is "<message>"
    Then I click the "Ensure" button
    Then I will see the element "RootMessage" name is "<rootmessage>"
    Then I will see the element "WhiteListMessage" name is "<whitelistmessage>"
    And I set the parameter "WhiteListInput" with value "<whitelistmessage>"
    And I click the "Next" button
    Then I will see the element "MemoMessage" name is "<message>"
    Then I click the "Ensure" button
    Then I will see the element "RootMessage" name is "<rootmessage>"
#    And I set the parameter "RootListMessage" with value "[^割]*"


    Examples: 高级搜索过滤单个ip成功
      | ip          | message              | rootmessage | whitelistmessage |
      | 192.168.1.4 | 请检查输入项，确保完整正确再点击下一步。 | 请务必输入路径     | 请务必输入白名单         |

