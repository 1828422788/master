@auth
Feature: 权限-拓扑图

  Scenario Outline: 勾选所需功能权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "<name>" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    When I "unchecked" the checkbox which name is "全选"
    When I "checked" the checkbox which name is "可查看拓扑图,新建拓扑图"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"

    Examples:
      | name              |
      | __user_AutoTest__ |
      | __user_验证授权用户__   |

  Scenario: 验证无新建权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    And I "unchecked" the checkbox which name is "新建拓扑图"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    And open the "topology.ListPage" page for uri "/topology/"
    Then I will see the "Create" doesn't exist

  Scenario Outline: 新建拓扑图
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "新建拓扑图"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    And open the "topology.ListPage" page for uri "/topology/"
    And I wait for loading invisible
    And I click the "Create" button
    And I set the parameter "NameInput" with value "<name>"
    And I click the "Ensure" button
    Then I will see the success message "创建成功"

    Examples:
      | name     |
      | AutoTest |

  Scenario Outline: 取消读取权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'拓扑图'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" the checkbox which name is "<name>" in auth table
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    And open the "topology.ListPage" page for uri "/topology/"
    Then I will see the search result "{'column':'0','name':'<name>','contains':'no'}"

    Examples:
      | name     |
      | AutoTest |

  Scenario Outline: 授权读取
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'拓扑图'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" the checkbox which name is "<name>" in auth table
    When I "checked" function "读取" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    And open the "topology.ListPage" page for uri "/topology/"
    Then the data name is "<name>" then i will see "授权" button
    When the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    And open the "topology.ListPage" page for uri "/topology/"
    And I click the detail which name is "<name>"
    Then I will see the "topology.DetailPage" page
    And I wait for "2000" millsecond
    And I click the "Save" button
    And I wait for "Message" will be visible
    Then I will see the message "保存失败"

    Examples:
      | name     |
      | AutoTest |

  Scenario Outline: 授权读取+编辑
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'拓扑图'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "删除,转授" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    And open the "topology.ListPage" page for uri "/topology/"
    Then the data name is "<name>" then i will see "标签重命名授权" button
    When the data name is "<name>" then i click the "标签" button
    And I wait for "Tag" will be visible
    And I set the parameter "Tag" with value "AutoTest"
    And I choose the "AutoTest" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    And open the "topology.ListPage" page for uri "/topology/"
    And I click the detail which name is "<name>"
    Then I will see the "topology.DetailPage" page
    And I wait for "2000" millsecond
    And I set the parameter "NodeName" with value "node1"
    And I set the parameter "NodeGroup" with value "测试组"
    And I click the "AddNodeButton" button
    Then I click the "Save" button
    And I refresh the website
    And I accept alert window
    And open the "topology.ListPage" page for uri "/topology/"

    Examples:
      | name     |
      | AutoTest |

  Scenario Outline: 授权读取+编辑+删除
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'拓扑图'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "转授" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    And open the "topology.ListPage" page for uri "/topology/"
    Then the data name is "<name>" then i will see "标签重命名删除授权" button
    When the data name is "<name>" then i click the "标签" button
    And I set the parameter "Tag" with value "AutoTest"
    And I choose the "AutoTest" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    And open the "topology.ListPage" page for uri "/topology/"
    And I click the detail which name is "<name>"
    Then I will see the "topology.DetailPage" page
    And I wait for "2000" millsecond
    And I wait for "AddNode" will be visible
    And I click the "AddNode" button
    And I wait for "NodeName" will be visible
    And I set the parameter "NodeName" with value "node2"
    And I set the parameter "NodeGroup" with value "测试组2"
    And I click the "AddNodeButton" button
    And I click the "Update" button
    And I refresh the website
    And I accept alert window
    And open the "topology.ListPage" page for uri "/topology/"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除成功"

    Examples:
      | name     |
      | AutoTest |

  Scenario Outline: 授权读取+删除
    Given open the "topology.ListPage" page for uri "/topology/"
    And I wait for loading invisible
    And I click the "Create" button
    And I set the parameter "NameInput" with value "<name>"
    And I click the "Ensure" button
    Then I will see the success message "创建成功"
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'拓扑图'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "编辑,转授" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    And open the "topology.ListPage" page for uri "/topology/"
    Then the data name is "<name>" then i will see "删除授权" button
    When the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    And open the "topology.ListPage" page for uri "/topology/"
    And I click the detail which name is "<name>"
    Then I will see the "topology.DetailPage" page
    And I wait for "2000" millsecond
    And I click the "Save" button
    And I wait for "Message" will be visible
    Then I will see the message "保存失败"
    And open the "topology.ListPage" page for uri "/topology/"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除成功"

    Examples:
      | name     |
      | AutoTest |

  @logout
  Scenario Outline: 授权读取+转授
    Given open the "topology.ListPage" page for uri "/topology/"
    And I wait for loading invisible
    And I click the "Create" button
    And I set the parameter "NameInput" with value "<name>"
    And I click the "Ensure" button
    Then I will see the success message "创建成功"
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'拓扑图'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "编辑,删除" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    And open the "topology.ListPage" page for uri "/topology/"
    Then the data name is "<name>" then i will see "授权" button
    When the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    And open the "topology.ListPage" page for uri "/topology/"
    And I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    And open the "topology.ListPage" page for uri "/topology/"
    Then the data name is "<name>" then i will see "授权" button
    And I click the detail which name is "<name>"
    Then I will see the "topology.DetailPage" page
    And I wait for "2000" millsecond
    And I click the "Save" button
    And I wait for "Message" will be visible
    Then I will see the message "保存失败"
    And I logout current user

    Examples:
      | name     |
      | AutoTest |

  Scenario Outline: 授权读取+编辑+转授
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'拓扑图'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "删除" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    And open the "topology.ListPage" page for uri "/topology/"
    Then the data name is "<name>" then i will see "标签重命名授权" button
    When the data name is "<name>" then i click the "标签" button
    And I set the parameter "Tag" with value "AutoTest"
    And I choose the "AutoTest" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    And open the "topology.ListPage" page for uri "/topology/"
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    And open the "topology.ListPage" page for uri "/topology/"
    Then the data name is "<name>" then i will see "标签重命名授权" button
    When the data name is "<name>" then i click the "重命名" button
    And I set the parameter "NameInput" with value "AutoRename"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"
    And I wait for loading invisible
    And I click the detail which name is "AutoRename"
    Then I will see the "topology.DetailPage" page
    And I wait for "2000" millsecond
    And I set the parameter "NodeName" with value "node1"
    And I set the parameter "NodeGroup" with value "测试组"
    And I click the "AddNodeButton" button
    And I click the "Save" button
    Then I will see the element "Alert" value is "保存成功"
    And I refresh the website
    And I accept alert window

    Examples:
      | name     |
      | AutoTest |

  Scenario: 有效期限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'拓扑图'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "AutoRename" in auth table
    When the data name is "AutoRename" then I click the "无限期" button in auth table
    And I click the "Customize" button
    And I click the "DateEditor" button
    And I set the time input "TimeInput" to "1" minutes later
    And I click the "EnsureTime" button
    And I click the "SaveButton" button
    And I will see the success message "更新成功"

  Scenario: 新建
    Given open the "topology.ListPage" page for uri "/topology/"
    And I wait for loading invisible
    And I click the "Create" button
    And I set the parameter "NameInput" with value "AutoTest"
    And I click the "Ensure" button
    Then I will see the success message "创建成功"

  @logout
  Scenario Outline: 授权所有权限
    Given open the "topology.ListPage" page for uri "/topology/"
    And I wait for loading invisible
    And I click the "Create" button
    And I set the parameter "NameInput" with value "<name>"
    And I click the "Ensure" button
    Then I will see the success message "创建成功"
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'拓扑图'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    And open the "topology.ListPage" page for uri "/topology/"
    Then the data name is "<name>" then i will see "标签重命名删除授权" button
    When the data name is "<name>" then i click the "标签" button
    And I set the parameter "Tag" with value "AutoTest"
    And I choose the "AutoTest" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    And open the "topology.ListPage" page for uri "/topology/"
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    And open the "topology.ListPage" page for uri "/topology/"
    Then the data name is "<name>" then i will see "标签重命名删除授权" button
    When the data name is "<name>" then i click the "重命名" button
    And I set the parameter "NameInput" with value "AutoRename"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"
    And I wait for loading invisible
    And I click the detail which name is "AutoRename"
    Then I will see the "topology.DetailPage" page
    And I wait for "2000" millsecond
    And I set the parameter "NodeName" with value "node1"
    And I set the parameter "NodeGroup" with value "测试组"
    And I click the "AddNodeButton" button
    And I click the "Update" button
    And I click the "Save" button
    And I refresh the website
    And I accept alert window
    And open the "topology.ListPage" page for uri "/topology/"
    And I wait for "2000" millsecond
    When the data name is "AutoRename" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除成功"
    And I logout current user

    Examples:
      | name     |
      | AutoTest |

  Scenario: 验证有效期限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    And open the "topology.ListPage" page for uri "/topology/"
    Then I will see the search result "{'column':'0','name':'AutoRename','contains':'no'}"

  @logout
  Scenario Outline: 授权读取+删除+转授
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'拓扑图'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "编辑" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    And I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    And open the "topology.ListPage" page for uri "/topology/"
    Then the data name is "<name>" then i will see "删除授权" button
    When the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    And I "uncheck" the checkbox which name is "验证授权用户" in tiny table
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    And open the "topology.ListPage" page for uri "/topology/"
    And I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    And open the "topology.ListPage" page for uri "/topology/"
    Then the data name is "<name>" then i will see "删除授权" button
    And I click the detail which name is "<name>"
    Then I will see the "topology.DetailPage" page
    And I wait for "2000" millsecond
    And I click the "Save" button
    And I wait for "Message" will be visible
    Then I will see the message "保存失败"
    And open the "topology.ListPage" page for uri "/topology/"
    And I wait for "2000" millsecond
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除成功"
    And I logout current user

    Examples:
      | name       |
      | AutoRename |

  Scenario: 新建二次授权所用拓扑图
    Given open the "topology.ListPage" page for uri "/topology/"
    And I wait for loading invisible
    And I click the "Create" button
    And I set the parameter "NameInput" with value "验证二次授权"
    And I click the "Ensure" button
    Then I will see the success message "创建成功"

  Scenario: 给AutoTest所用权限
    Given open the "topology.ListPage" page for uri "/topology/"
    And I wait for loading invisible
    When the data name is "验证二次授权" then i click the "授权" button
    And I "check" the checkbox which name is "AutoTest" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"

  Scenario Outline: 二次授权读取
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "topology.ListPage" page for uri "/topology/"
    And I wait for loading invisible
    When the data name is "验证二次授权" then i click the "授权" button
    And I choose the "<authRole>" from the "AuthDropdown"
    When I "check" the function "<function>" which name is "<authName>" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    And open the "topology.ListPage" page for uri "/topology/"
    Then the data name is "<name>" then i will see "授权" button
    When the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "AutoTest" is disabled
    And open the "topology.ListPage" page for uri "/topology/"
    And I click the detail which name is "<name>"
    Then I will see the "topology.DetailPage" page
    And I wait for "2000" millsecond
    And I click the "Save" button
    And I wait for "Message" will be visible
    Then I will see the message "保存失败"

    Examples:
      | authRole | authName | function | name   |
      | 用户       | 验证授权用户   | 读取       | 验证二次授权 |

  Scenario Outline: 二次授权读取+编辑
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "topology.ListPage" page for uri "/topology/"
    And I wait for loading invisible
    When the data name is "验证二次授权" then i click the "授权" button
    And I choose the "<authRole>" from the "AuthDropdown"
    And I wait for loading invisible
    When I "check" the function "<function>" which name is "<authName>" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    And open the "topology.ListPage" page for uri "/topology/"
    Then the data name is "<name>" then i will see "标签重命名授权" button
    When the data name is "<name>" then i click the "标签" button
    And I set the parameter "Tag" with value "AutoTest"
    And I choose the "AutoTest" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "AutoTest" is disabled
    And open the "topology.ListPage" page for uri "/topology/"
    And I click the detail which name is "<name>"
    Then I will see the "topology.DetailPage" page
    And I wait for "2000" millsecond
    And I set the parameter "NodeName" with value "node1"
    And I set the parameter "NodeGroup" with value "测试组"
    And I click the "AddNodeButton" button
    And I click the "Update" button
    Then I click the "Save" button
    And I refresh the website
    And I accept alert window

    Examples:
      | authRole | authName        | function | name   |
      | 角色       | __user_验证授权用户__ | 编辑       | 验证二次授权 |

  Scenario Outline: 二次授权读取+编辑+删除
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "topology.ListPage" page for uri "/topology/"
    And I wait for loading invisible
    When the data name is "验证二次授权" then i click the "授权" button
    And I choose the "<authRole>" from the "AuthDropdown"
    And I wait for loading invisible
    When I "check" the function "<function>" which name is "<authName>" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    And open the "topology.ListPage" page for uri "/topology/"
    Then the data name is "<name>" then i will see "标签重命名删除授权" button
    When the data name is "<name>" then i click the "标签" button
    And I set the parameter "Tag" with value "AutoTest"
    And I choose the "AutoTest" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "AutoTest" is disabled
    And open the "topology.ListPage" page for uri "/topology/"
    And I click the detail which name is "<name>"
    Then I will see the "topology.DetailPage" page
    And I wait for "2000" millsecond
    And I click the "AddNode" button
    And I set the parameter "NodeName" with value "node2"
    And I set the parameter "NodeGroup" with value "测试组2"
    And I click the "AddNodeButton" button
    And I click the "Update" button
    And I click the "Save" button
    And I refresh the website
    And I accept alert window
    And open the "topology.ListPage" page for uri "/topology/"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除成功"

    Examples:
      | authRole | authName | function | name   |
      | 用户分组     | 验证授权用户分组 | 读取,编辑,删除 | 验证二次授权 |

  Scenario: 新建拓扑图验证详情
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "topology.ListPage" page for uri "/topology/"
    And I wait for loading invisible
    And I click the "Create" button
    And I set the parameter "NameInput" with value "测试权限详情"
    And I click the "Ensure" button
    Then I will see the success message "创建成功"

  Scenario: 验证详情
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "topology.ListPage" page for uri "/topology/"
    And I wait for loading invisible
    When I click the detail which name is "测试权限详情"
    Then I will see the "topology.DetailPage" page
    And I wait for "1000" millsecond
    And I click the "AddInputButton" button
    And I set the parameter "Title" with value "标识前后缀"
    And I set the parameter "Token" with value "first"
    And I choose the "下拉菜单" from the "InputType"
    And I set the parameter "Optional" with value "stats"
    And I click the "Add" button
    And I choose the "stats" from the "DefaultValueDropdown"
    And I set the parameter "Prefix" with value "* | "
    And I set the parameter "Postfix" with value " avg(apache.resp_len)"
    And I click the "EnsureInputButton" button
    And I set the parameter "NodeName" with value "n1"
    And I set the parameter "NodeGroup" with value "g1"
    And I click the "AddNodeButton" button
    And I click the "AddValue" button
    And I click the "ValueHeader" button
    And I set the parameter "TextArea" with value "${first}"
    And I click the "FirstDateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "1000" millsecond
    And I choose the "avg(apache.resp_len)" from the "FiledInput"
    And I click the "Apply" button
    And I click the "Save" button
    And I refresh the website
    And I accept alert window

  @cleanAuth
  Scenario Outline: 清理
    Given open the "topology.ListPage" page for uri "/topology/"
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除成功"

    Examples:
      | name     |
      | 测试权限详情   |
      | AutoTest |
