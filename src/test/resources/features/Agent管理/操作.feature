Feature: 操作

  Background:
    Given open the "agent.ListPage" page for uri "/sources/input/agent/"
    And I wait for loading invisible


  Scenario Outline: 修改备注成功
    When I set the parameter "IP" with value "<ip>"
    And  I wait for loading invisible
    Then I will see the search result "{'column':'1','name':'192.168.1.136'}"
    And I click the "ChangeMemoButton" button
    And I set the parameter "Memo" with value "<memory>"
    And I click the "EnsureButton" button
    And  I wait for loading invisible
    Then I will see the search result "{'column':'3','name':'<memory>'}"


#  @indexSettingSmoke
    Examples: 备注成功
      | ip          | memory   |
      | 	136     | 中文测试     |
      |     136     |  test       |
      |     136     |  *A￥,%&^       |
      |     136     |  sunxc测试 |

  Scenario Outline: 修改备注失败
    Then the data name is "{'column':'1','name':'192.168.1.136'}" then i click the "修改备注" button
    And I set the parameter "Memo" with value "<memory>"
    And  I wait for loading invisible
    Then I will see the element "MemoError" name is "<errormessage>"
    Examples: 备注失败
     | memory   |     errormessage|
     |  test中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试       | 请输入不大于 256 字节的内容！|
