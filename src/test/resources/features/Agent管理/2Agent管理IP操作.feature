@agent
Feature: Agent管理ip操作

  Background:
    Given open the "agent.ListPage" page for uri "/sources/input/agent/"
    And I wait for loading invisible


  Scenario Outline: 修改备注成功
    Then the column is "1" then i click the "修改备注" button in agent page
    And I set the parameter "Memo" with value "<memory>"
    And I click the "EnsureButton" button
    And  I wait for loading invisible
    Then I will see the search result contains "{'column':'3','name':'<memory>'}"
    And I close all tabs except main tab


#  @indexSettingSmoke
    Examples: 备注成功
      | memory  |
      | 中文测试    |
      | test    |
      | *A￥,%&^ |
      | 68      |

  Scenario Outline: 修改备注失败
    Then the column is "1" then i click the "修改备注" button in agent page
    And I set the parameter "Memo" with value "<memory>"
    And  I wait for loading invisible
    Then I will see the element "MemoError" name is "<errormessage>"
    And I close all tabs except main tab

    Examples: 备注失败
      | memory                                                                                                                                                                                                                       | errormessage      |
      | test中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试 | 请输入不大于 256 字节的内容！ |

  Scenario Outline: Agent分组添加和跳转
    Then the column is "1" then i click the "分组" button in agent page
    And  I wait for loading invisible
    And I click the "GroupButton" button
    Then I will see the element "GroupMemo" name is "<message>"
    And I click the "FinishButton" button
    Given open the "agent.GroupPage" page for uri "/sources/input/agent/group/"
    Then the data name is "<name>" then i will see "编辑 跳转 删除" button
    And the data name is "<name>" then i click the "跳转" button
    Then I will see the agent search result contains "1"
    And I close all tabs except main tab


#  @indexSettingSmokes
    Examples:
      | name      | message                    |
      | sunxctest | 成功加入分组 [ sunxctest ] |

  Scenario Outline: Agent移出分组
    Then the column is "1" then i click the "分组" button in agent page
    And  I wait for loading invisible
    And I click the "GroupButton" button
    Then I will see the element "GroupMemo" name is "<message>"
    And I click the "FinishButton" button
    Given open the "agent.GroupPage" page for uri "/sources/input/agent/group/"
    Then the data name is "<name>" then i will see "编辑 跳转 删除" button
    And the data name is "<name>" then i click the "跳转" button
    Then I will see the agent doesn't exist in "1" cloumn
    And I close all tabs except main tab

    Examples:
      | name      | message                    |
      | sunxctest | 成功移出分组 [ sunxctest ] |

  Scenario Outline: Agent批量操作空操作&加入分组
    And I click the "AgentMultiButton" button
#    Then I will see the element value in json "{'PreviewMessage':'请以字母、数字、中文或下划线为元素,tags 之间可用 "," 分隔。'}"
    And I will see the message "请务必选择至少一个 Agent 进行操作。"
    Then I click the "EnsureButton" button
    When the column is "1" then i "checked" the agent label in agent page
    And I click the "AgentMultiButton" button
    And I click the "MultiGruopButton" button
    And I click the "GroupButton" button
    Then I will see the element "GroupMemo" name is "<message>"
    And I click the "FinishButton" button
    Given open the "agent.GroupPage" page for uri "/sources/input/agent/group/"
    Then the data name is "<name>" then i will see "编辑 跳转 删除" button
    And the data name is "<name>" then i click the "跳转" button
    Then I will see the agent search result contains "1"
    And I close all tabs except main tab

    Examples:
      | name      | message                    |
      | sunxctest | 成功加入分组 [ sunxctest ] |

  Scenario Outline: Agent批量操作移出分组
    When the column is "1" then i "checked" the agent label in agent page
    And I click the "AgentMultiButton" button
    And I click the "MultiGruopButton" button
    And I click the "GroupButton" button
    Then I will see the element "GroupMemo" name is "<message>"
    And I click the "FinishButton" button
    Given open the "agent.GroupPage" page for uri "/sources/input/agent/group/"
    Then the data name is "<name>" then i will see "编辑 跳转 删除" button
    And the data name is "<name>" then i click the "跳转" button
    And I close all tabs except main tab

#    Then I will see the agent search result not contains "1"

    Examples:
      | name      | message                    |
      | sunxctest | 成功移出分组 [ sunxctest ] |