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
      | ip  | memory  |
      | 136 | 中文测试    |
      | 136 | test    |
      | 136 | *A￥,%&^ |
      | 136 | 68      |

  Scenario Outline: 修改备注失败
    Then the data name is "{'column':'1','name':'192.168.1.136'}" then i click the "修改备注" button
    And I set the parameter "Memo" with value "<memory>"
    And  I wait for loading invisible
    Then I will see the element "MemoError" name is "<errormessage>"
    Examples: 备注失败
      | memory                                                                                                                                                                                                                       | errormessage      |
      | test中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试 | 请输入不大于 256 字节的内容！ |

  Scenario Outline: Agent分组添加和跳转
    Then the data name is "{'column':'1','name':'<ip>'}" then i click the "分组" button
    And  I wait for loading invisible
    And I click the "GroupButton" button
    Then I will see the element "GroupMemo" name is "<message>"
    And I click the "FinishButton" button
    Given open the "agent.GroupPage" page for uri "/sources/input/agent/group/"
    Then the data name is "<name>" then i will see "编辑 跳转 删除" button
    And the data name is "<name>" then i click the "跳转" button
    Then I will see the search result "{'column':'1','name':'192.168.1.136'}"

#  @indexSettingSmokes
    Examples:
      | ip            | name      | message                    |
      | 192.168.1.136 | sunxctest | 成功加入分组 [ sunxctest ] |

  Scenario Outline: Agent移出分组
    Then the data name is "{'column':'1','name':'<ip>'}" then i click the "分组" button
    And  I wait for loading invisible
    And I click the "GroupButton" button
    Then I will see the element "GroupMemo" name is "<message>"
    And I click the "FinishButton" button
    Given open the "agent.GroupPage" page for uri "/sources/input/agent/group/"
    Then the data name is "<name>" then i will see "编辑 跳转 删除" button
    And the data name is "<name>" then i click the "跳转" button
    Then I will see the "{'column':'1','name':'<ip>'}" doesn't exist
    Examples:
      | ip            | name      | message                    |
      | 192.168.1.136 | sunxctest | 成功加入分组 [ sunxctest ] |

  Scenario Outline: Agent批量操作空操作&加入分组
    And I click the "AgentMultiButton" button
    And I will see the message "请务必选择至少一个 Agent 进行操作，并且确认它有更新权限。"
    Then I click the "EnsureButton" button
    And I "checked" the agent label before "<ip>"
    And I click the "AgentMultiButton" button
    And I click the "MultiGruopButton" button
    And I click the "GroupButton" button
    Then I will see the element "GroupMemo" name is "<message>"
    And I click the "FinishButton" button
    Given open the "agent.GroupPage" page for uri "/sources/input/agent/group/"
    Then the data name is "<name>" then i will see "编辑 跳转 删除" button
    And the data name is "<name>" then i click the "跳转" button
    Then I will see the search result "{'column':'1','name':'<ip>'}"
    Examples:
      | ip            | name      | message                    |
      | 192.168.1.136 | sunxctest | 成功加入分组 [ sunxctest ] |

  Scenario Outline: Agent批量操作移出分组
    And I "checked" the agent label before "<ip>"
    And I click the "AgentMultiButton" button
    And I click the "MultiGruopButton" button
    And I click the "GroupButton" button
    Then I will see the element "GroupMemo" name is "<message>"
    And I click the "FinishButton" button
    Given open the "agent.GroupPage" page for uri "/sources/input/agent/group/"
    Then the data name is "<name>" then i will see "编辑 跳转 删除" button
    And the data name is "<name>" then i click the "跳转" button
    Then I will see the search result "{'column':'1','name':'<ip>'}"

    Examples:
      | ip            | name      | message                    |
      | 192.168.1.136 | sunxctest | 成功移出分组 [ sunxctest ] |