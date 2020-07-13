@auth
Feature: 权限-agent

  Scenario: 勾选agent所需功能权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "全选"
    And I "checked" the checkbox which name is "可查看 Agent 管理,新建Agent分组"
    And I click the "SaveButton" button

  Scenario: 不勾选新建agent权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "unchecked" the checkbox which name is "新建Agent分组"
    And I click the "SaveButton" button
    Then I will see the success message "更新成功"

  @logout
  Scenario: 验证无新建分组权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "agent.GroupPage" page for uri "/agent/agentgroup/"
    Then I will see the "CreateAgentGroupButton" doesn't exist
    Then I logout current user

  Scenario: 勾选新建agent分组权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "新建Agent分组"
    And I click the "SaveButton" button
    Then I will see the success message "更新成功"

  @logout
  Scenario: 验证有新建分组权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "agent.GroupPage" page for uri "/agent/agentgroup/"
    And I wait for loading invisible
    And I click the "CreateAgentGroupButton" button
    And I set the parameter "Name" with value "TestAuth"
    When I set the parameter "Description" with value "权限自动化测试"
    And I choose the "__admin__" from the "Role"
    And I click the "Save" button
    And I will see the element "Addsuccessmsg" name is "添加 Agent 分组成功"
    Then I logout current user

  @logout
  Scenario Outline: 验证无读取权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'Agent 管理'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" the checkbox which name is "<name>" in auth table
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "agent.GroupPage" page for uri "/agent/agentgroup/"
    Then I will see the "<name>" doesn't exist
    Then I logout current user

    Examples:
      | name     |
      | TestAuth |

  Scenario Outline: 勾选读取权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'Agent 管理'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" the checkbox which name is "<name>" in auth table
    And I "checked" function "读取" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"

    Examples:
      | name     |
      | TestAuth |

  @logout
  Scenario Outline: 验证读取权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "agent.GroupPage" page for uri "/agent/agentgroup/"
    And I wait for "<name>" will be visible
    And I click the "<name>" button
    Then I will see the element "Name" attribute is "disabled"
    Then I will see the element "Description" attribute is "disabled"
    And I click the "More" button
    And I click the "Jump" button
    And switch to another window
    And I close all tabs except main tab
    And I wait for "Notice" will be visible
    Given open the "agent.GroupPage" page for uri "/agent/agentgroup/"
    And I wait for "<name>" will be visible
    And I click the "<name>" button
    And I click the "Addgroupinput" button
    And I wait for title change text to "Agent 分组配置"
    Then I will see the "AddDataSource" doesn't exist
    Then I logout current user

    Examples:
      | name     |
      | TestAuth |

  Scenario Outline: 授权读取+编辑
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'Agent 管理'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" the checkbox which name is "<name>" in auth table
    And I "checked" function "读取,编辑" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"

    Examples:
      | name     |
      | TestAuth |

  @logout
  Scenario Outline: 验证读取+编辑
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "agent.GroupPage" page for uri "/agent/agentgroup/"
    And I wait for loading invisible
    And I wait for "TestAuth" will be visible
    And I click the "TestAuth" button
    Then I set the parameter "Description" with value "TestDesc"
    And I click the "Update" button
    And I will see the element "Addsuccessmsg" name is "更新 Agent 分组成功"
    And I wait for loading invisible
    And I click the "More" button
    And I click the "Jump" button
    And switch to another window
    And I close all tabs except main tab
    And I wait for "Notice" will be visible
    Given open the "agent.GroupPage" page for uri "/agent/agentgroup/"
    And I wait for "<name>" will be visible
    And I click the "<name>" button
    And I click the "Addgroupinput" button
    And I wait for title change text to "Agent 分组配置"
    Then I will see the "AddDataSource" doesn't exist
    Then I logout current user

    Examples:
      | name     |
      | TestAuth |

  Scenario: 有效期限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'Agent 管理'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "TestAuth" in auth table
    When the data name is "TestAuth" then I click the "无限期" button in auth table
    And I click the "Customize" button
    And I click the "DateEditor" button
    And I set the time input "TimeInput" to "1" minutes later
    And I click the "EnsureTime" button
    And I click the "SaveButton" button
    And I will see the success message "更新成功"

  Scenario Outline: 新建agent分组
    Given open the "agent.GroupPage" page for uri "/agent/agentgroup/"
    And I wait for loading invisible
    And I click the "CreateAgentGroupButton" button
    And I set the parameter "Name" with value "<name>"
    When I set the parameter "Description" with value "<name>"
    And I click the "Save" button
    And I will see the element "Addsuccessmsg" name is "添加 Agent 分组成功"

    Examples:
      | name    |
      | 权限自动化测试 |
      | 验证组内权限  |

  @logout
  Scenario: 验证有效期限生效
    When I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "agent.GroupPage" page for uri "/agent/agentgroup/"
    And I wait for loading invisible
    Then I will see the "TestAuth" doesn't exist
    Then I logout current user

  Scenario Outline: 授权读取+删除
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'Agent 管理'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" the checkbox which name is "<name>" in auth table
    And I "checked" function "读取,删除" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"

    Examples:
      | name     |
      | TestAuth |

  @logout
  Scenario Outline: 验证读取+删除
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "agent.GroupPage" page for uri "/agent/agentgroup/"
    And I wait for "<name>" will be visible
    And I click the "<name>" button
    Then I will see the element "Name" attribute is "disabled"
    Then I will see the element "Description" attribute is "disabled"
    And I click the "More" button
    And I click the "Jump" button
    And switch to another window
    And I close all tabs except main tab
    Then I wait for "Notice" will be visible
    Given open the "agent.GroupPage" page for uri "/agent/agentgroup/"
    And I wait for "<name>" will be visible
    And I click the "<name>" button
    And I click the "Addgroupinput" button
    And I wait for title change text to "Agent 分组配置"
    Then I will see the "AddDataSource" doesn't exist
    Given open the "agent.GroupPage" page for uri "/agent/agentgroup/"
    And I wait for "<name>" will be visible
    And I click the "<name>" button
    And I click the "More" button
    And I click the "Delete" button
    And I click the "Ensure" button
    Then I will see the element "Addsuccessmsg" name is "删除 Agent 分组成功"
    Then I logout current user

    Examples:
      | name     |
      | TestAuth |

  Scenario Outline: 授权读取+编辑+删除
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'Agent 管理'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" the checkbox which name is "<name>" in auth table
    And I "checked" function "读取,编辑,删除" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"

    Examples:
      | name    |
      | 权限自动化测试 |

  @logout
  Scenario Outline: 验证读取+编辑+删除
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "agent.GroupPage" page for uri "/agent/agentgroup/"
    And I wait for loading invisible
    And I click the "{'AgentName':'<name>'}" button
    Then I set the parameter "Description" with value "TestDesc"
    And I click the "Update" button
    And I will see the element "Addsuccessmsg" name is "更新 Agent 分组成功"
    And I wait for loading invisible
    And I click the "More" button
    And I click the "Jump" button
    And switch to another window
    And I close all tabs except main tab
    Then I wait for "Notice" will be visible
    Given open the "agent.GroupPage" page for uri "/agent/agentgroup/"
    And I wait for loading invisible
    And I click the "{'AgentName':'<name>'}" button
    And I click the "Addgroupinput" button
    And I wait for title change text to "Agent 分组配置"
    Then I will see the "AddDataSource" doesn't exist
    Given open the "agent.GroupPage" page for uri "/agent/agentgroup/"
    And I wait for loading invisible
    And I click the "{'AgentName':'<name>'}" button
    And I click the "More" button
    And I click the "Delete" button
    And I click the "Ensure" button
    Then I will see the element "Addsuccessmsg" name is "删除 Agent 分组成功"
    And I logout current user

    Examples:
      | name    |
      | 权限自动化测试 |

  Scenario Outline: 授权组内读取权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'Agent 管理'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" the checkbox which name is "<name>" in auth table
    And I "checked" function "读取" from the auth table which name is "<name>"
    And I "checked" function "读取" from the auth table in group which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"

    Examples:
      | name   |
      | 验证组内权限 |

  Scenario: 修改agent分组
    Given open the "agent.ListPage" page for uri "/sources/input/agent/"
    And I wait for loading invisible
    Then the column is "1" then i click the "分组" button in agent page
    And  I wait for loading invisible
    And I click the "AuthButton" button
    Then I will see the element "GroupMemo" name is "成功加入分组 [ 验证组内权限 ]"
    And I click the "FinishButton" button

  @logout
  Scenario Outline: 验证组内读取权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "agent.GroupPage" page for uri "/agent/agentgroup/"
    And I wait for loading invisible
    And I click the "{'AgentName':'<name>'}" button
    Then I will see the element "Name" attribute is "disabled"
    Then I will see the element "Description" attribute is "disabled"
    And I click the "More" button
    And I click the "Jump" button
    And switch to another window
    And I close all tabs except main tab
    Then I will see the agent result in column "1"
    Then I logout current user

    Examples:
      | name   |
      | 验证组内权限 |

  Scenario Outline: 授权组内读取+编辑权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'Agent 管理'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" the checkbox which name is "<name>" in auth table
    And I "checked" function "读取" from the auth table which name is "<name>"
    And I "checked" function "读取,编辑" from the auth table in group which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"

    Examples:
      | name   |
      | 验证组内权限 |

  @logout
  Scenario: 验证组内读取+编辑权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "agent.ListPage" page for uri "/sources/input/agent/"
    And I wait for loading invisible
    Then the column is "1" then i click the "更多" button in agent page
    And I click the "MemoButton" button
    And I set the parameter "Memo" with value "AutoTest"
    And I click the "EnsureButton" button
    Then I will see the element "GroupMemo" name is "修改备注成功"
    Then I logout current user

  Scenario Outline: 授权组内读取编辑+编辑权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'Agent 管理'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" the checkbox which name is "<name>" in auth table
    And I "checked" function "读取,编辑" from the auth table which name is "<name>"
    And I "checked" function "读取,编辑" from the auth table in group which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"

    Examples:
      | name   |
      | 验证组内权限 |

  @logout
  Scenario: 移除分组
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "agent.ListPage" page for uri "/sources/input/agent/"
    And I wait for loading invisible
    Then the column is "1" then i click the "分组" button in agent page
    And  I wait for loading invisible
    And I click the "AuthButton" button
    Then I will see the element "GroupMemo" name is "成功移出分组 [ 验证组内权限 ]"
    And I click the "FinishButton" button
    Then I logout current user

  Scenario: 删除Agent分组
    Given open the "agent.GroupPage" page for uri "/agent/agentgroup/"
    And I wait for loading invisible
    And I click the "{'AgentName':'验证组内权限'}" button
    And I click the "More" button
    And I click the "Delete" button
    And I click the "Ensure" button
    Then I will see the element "Addsuccessmsg" name is "删除 Agent 分组成功"
