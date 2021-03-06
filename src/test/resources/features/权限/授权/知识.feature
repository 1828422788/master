#@authtest
Feature: 权限-知识

  Scenario Outline: 勾选所需权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "<name>" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "Resource" button
    And I wait for "1000" millsecond
    When I "checked" the checkbox which name is "可查看知识,可查看仪表盘"
    When I "unchecked" the checkbox which name is "新建知识"
    And I click the "SaveButton" button
    Then I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"
    Then I logout current user

    Examples:
      | name              |
     | __user_AutoTest__ |
      | __user_验证授权用户__   |

  Scenario: 验证无新建权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I wait for loading invisible
    Then I will see the "Create" doesn't exist
    Then I logout current user

  Scenario: 勾选新建权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "Resource" button
    And I wait for "1000" millsecond
    When I "checked" the checkbox which name is "新建知识"
    And I click the "SaveButton" button
    Then I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"
    Then I logout current user

  Scenario: 验证新建权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I wait for loading invisible
    And I click the "Create" button
    Then I will see the "knowledge.CreatePage" page
    And I click the "Next" button
    And I wait for "2000" millsecond
    And I click the "Next" button
    And I wait for "EventCode" will be visible
    And I set the parameter "EventCode" with value "AutoTestUserCreate"
    And I click the "Done" button
    Then I will see the element "SuccessAdd" name is "新建成功"
    Then I logout current user

  Scenario: 取消读取权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for "1000" millsecond
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for "1000" millsecond
    Then I click the "{'TabButton':'知识'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "AutoTestUserCreate" in auth table
    And I "unchecked" the checkbox which name is "AutoTestUserCreate" in auth table
    And I click the "SaveButton" button
    Then I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"
    Then I logout current user

  Scenario: 验证无读取权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I wait for loading invisible
    Then I will see the search result "{'column':'0','name':'AutoTestUserCreate','contains':'no'}"
    Then I logout current user

  Scenario Outline: 授权读取
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for "1000" millsecond
    Then I click the "{'TabButton':'知识'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" the checkbox which name is "<name>" in auth table
    When I "checked" function "读取" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"
    Then I logout current user

    Examples:
      | name               |
      | AutoTestUserCreate |

  Scenario Outline: 验证读取权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I wait for loading invisible
  #  Then I will see the search result "{'column':'0','name':'<name>'}"
    Then the data name is "{'column':'0','name':'<name>'}" then i will see "<function>" button
    And the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I wait for "2000" millsecond
    And the data name is "<name>" then i click the "查看" button
    Then I will see the "knowledge.CreatePage" page
    And I click the "Next" button
    And I wait for "1500" millsecond
    And I click the "Next" button
    And I wait for "1500" millsecond
    Then I will see the " Next" doesn't exist
  #  Then I will see the element "Done" attribute is "disabled"
    Then I logout current user

    Examples:
      | name               |function|
      | AutoTestUserCreate |查看\n授权|

  Scenario Outline: 授权读取+编辑
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for "1000" millsecond
    Then I click the "{'TabButton':'知识'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "删除,转授" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    Then I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"
    Then I logout current user

    Examples:
      | name               |
      | AutoTestUserCreate |

  Scenario Outline: 验证读取+编辑
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'<name>'}" then i will see "<function>" button
 #   Then the data name is "{'column':'0','name':'<name>'}" then i will see "编辑标签授权" button
    And the data name is "<name>" then i click the "更多" button
    And I click the "Label" button
    And I wait for "LabelInput" will be visible
    And I click the "LabelInput" button
    And I set the parameter "Tag" with value "testTag"
 #   And I choose the "testTag" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"
    And I wait for "2000" millsecond
    And the data name is "<name>" then i click the "更多" button
    And I click the "Auth" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
  #  And the data name is "<name>" then i click the "编辑" button
    And I wait for "2000" millsecond
    And the data name is "<name>" then i click the "编辑" button
    Then I will see the "knowledge.CreatePage" page
    And I click the "Next" button
    And I wait for "1500" millsecond
    And I click the "Next" button
    And I wait for "1500" millsecond
    And I set the parameter "EventCode" with value "AutoTestRename"
    And I wait for "1500" millsecond
    And I click the "Done" button
    And I wait for "1500" millsecond
    Then I will see the element "SuccessAdd" name is "编辑成功"
    Then I logout current user

    Examples:
      | name               |function|
      | AutoTestUserCreate |编辑\n更多  |

  Scenario Outline: 授权读取+编辑+删除
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for "1000" millsecond
    Then I click the "{'TabButton':'知识'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "转授" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    Then I logout current user

    Examples:
      | name               |
      | AutoTestUserCreate |

  Scenario Outline: 验证读取+编辑+删除
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'<name>'}" then i will see "<function>" button
    And the data name is "<name>" then i click the "更多" button
    And I click the "Label" button
    And I wait for "LabelInput" will be visible
    And I click the "LabelInput" button
    And I set the parameter "Tag" with value "testTag"
 #   And I choose the "testTag" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"
    And I wait for "2000" millsecond
    And the data name is "<name>" then i click the "更多" button
    And I click the "Auth" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
  #  And the data name is "<name>" then i click the "编辑" button
    And I wait for "2000" millsecond
    And the data name is "<name>" then i click the "编辑" button
    Then I will see the "knowledge.CreatePage" page
    And I click the "Next" button
    And I wait for "1500" millsecond
    And I click the "Next" button
    And I wait for "1500" millsecond
    And I set the parameter "EventCode" with value "AutoTestRename"
    And I wait for "1500" millsecond
    And I click the "Done" button
    And I wait for "1500" millsecond
    Then I will see the element "SuccessAdd" name is "编辑成功"
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I wait for "2000" millsecond
    And the data name is "<name>" then i click the "更多" button
    And I click the "Delete" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除知识成功"
    Then I logout current user

    Examples:
      | name               |function|
      | AutoTestUserCreate |编辑\n更多  |

  Scenario Outline: 添加知识
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I wait for loading invisible
    And I click the "Create" button
    Then I will see the "knowledge.CreatePage" page
    And I click the "Next" button
    And I wait for "1500" millsecond
    And I click the "Next" button
    And I wait for "EventCode" will be visible
    And I set the parameter "EventCode" with value "<name>"
    And I click the "Done" button
    Then I will see the element "SuccessAdd" name is "新建成功"
    Then I logout current user

    Examples:
      | name               |
      | AutoTestUserCreate |

  Scenario Outline: 授权读取+删除
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for "1500" millsecond
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for "1000" millsecond
    Then I click the "{'TabButton':'知识'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "编辑,转授" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    Then I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"
    Then I logout current user

    Examples:
      | name               |
      | AutoTestUserCreate |

  Scenario Outline: 验证读取+删除
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'<name>'}" then i will see "<function>" button
    And the data name is "<name>" then i click the "查看" button
    Then I will see the "knowledge.CreatePage" page
    And I click the "Next" button
    And I wait for "1500" millsecond
    And I click the "Next" button
    And I wait for "1500" millsecond
    Then I will see the element "DisableDone" attribute is "disabled"
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I wait for "2000" millsecond
    And the data name is "<name>" then i click the "更多" button
    And I click the "Auth" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I wait for "2000" millsecond
    And the data name is "<name>" then i click the "更多" button
    And I click the "Delete" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除知识成功"
    Then I logout current user

    Examples:
      | name               |function|
      | AutoTestUserCreate |查看\n更多  |

  Scenario Outline: 添加读取+转授所需知识
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I wait for loading invisible
    And I click the "Create" button
    Then I will see the "knowledge.CreatePage" page
    And I click the "Next" button
    And I wait for "1500" millsecond
    And I click the "Next" button
    And I set the parameter "EventCode" with value "<name>"
    And I click the "Done" button
    Then I will see the element "SuccessAdd" name is "新建成功"
    Then I logout current user

    Examples:
      | name         |
      | AutoTestAuth |

  Scenario Outline: 授权读取+授权
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for "1000" millsecond
    Then I click the "{'TabButton':'知识'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "编辑,删除" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    Then I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"
    Then I logout current user

    Examples:
      | name         |
      | AutoTestAuth |

  Scenario Outline: 验证读取+授权
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'<name>'}" then i will see "<function>" button
    And the data name is "<name>" then i click the "查看" button
    Then I will see the "knowledge.CreatePage" page
    And I click the "Next" button
    And I wait for "1500" millsecond
    And I click the "Next" button
    And I wait for "1500" millsecond
    Then I will see the element "DisableDone" attribute is "disabled"
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I wait for "2000" millsecond
    And the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'<name>'}" then i will see "<function>" button
    And the data name is "<name>" then i click the "查看" button
    Then I will see the "knowledge.CreatePage" page
    And I click the "Next" button
    And I wait for "1500" millsecond
    And I click the "Next" button
    And I wait for "1500" millsecond
    Then I will see the element "DisableDone" attribute is "disabled"
    Then I logout current user

    Examples:
      | name         |function|
      | AutoTestAuth |查看\n授权  |

  Scenario Outline: 授权读取+编辑+授权
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for "1000" millsecond
    Then I click the "{'TabButton':'知识'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "删除" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    Then I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"
    Then I logout current user

    Examples:
      | name         |
      | AutoTestAuth |

  Scenario Outline: 验证读取+编辑+授权
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'<name>'}" then i will see "<function>" button
    And I wait for "2000" millsecond
    And the data name is "<name>" then i click the "更多" button
    And I click the "Label" button
    And I wait for "LabelInput" will be visible
    And I click the "LabelInput" button
    And I set the parameter "Tag" with value "testTag"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"
    And I wait for loading invisible
    And the data name is "<name>" then i click the "编辑" button
    Then I will see the "knowledge.CreatePage" page
    And I click the "Next" button
    And I wait for "1500" millsecond
    And I click the "Next" button
    And I wait for "1500" millsecond
    And I set the parameter "EventCode" with value "AutoTestRename"
    And I wait for "1500" millsecond
    And I click the "Done" button
    Then I will see the element "SuccessAdd" name is "编辑成功"
    And I wait for "2000" millsecond
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I wait for "1500" millsecond
    And the data name is "<name>" then i click the "更多" button
    And I click the "Auth" button
    And I wait for loading invisible
    And I "uncheck" the checkbox which name is "验证授权用户" in tiny table
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'<name>'}" then i will see "<function>" button
    Then I logout current user

    Examples:
      | name         |function|
      | AutoTestAuth |编辑\n更多  |

  #Scenario: 有效期限
  #  Given open the "roles.ListPage" page for uri "/account/roles/"
  #  And the data name is "__user_AutoTest__" then i click the "授权" button
  #  And I will see the "roles.AuthorizationPage" page
  #  And I wait for loading invisible
  #  And I click the "ResourceAuth" button
  #  And I wait for "1000" millsecond
  #  Then I click the "{'TabButton':'知识'}" button
  #  And I wait for loading invisible
  #  And I "checked" the checkbox which name is "AutoTestAuth" in auth table
  #  When the data name is "AutoTestAuth" then I click the "无限期" button in auth table
  #  And I click the "Customize" button
  #  And I click the "DateEditor" button
  #  And I set the time input "TimeInput" to "1" minutes later
  #  And I click the "SaveButton" button
  #  Then I wait for "SuccessMessage" will be visible
  #  And I will see the success message "更新成功"
  #  Then I logout current user

  Scenario: 新建知识验证所有权限
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I wait for loading invisible
    And I click the "Create" button
    Then I will see the "knowledge.CreatePage" page
    And I click the "Next" button
    And I wait for "1000" millsecond
    And I click the "Next" button
    And I wait for "1000" millsecond
    And I set the parameter "EventCode" with value "AutoTest"
    And I click the "Done" button
    Then I will see the element "SuccessAdd" name is "新建成功"
    Then I logout current user

  Scenario Outline: 授权所有权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for "1000" millsecond
    Then I click the "{'TabButton':'知识'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I click the "SaveButton" button
    Then I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"
    Then I logout current user

    Examples:
      | name     |
      | AutoTest |

  Scenario Outline: 验证所有权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'<name>'}" then i will see "<function>" button
    And the data name is "<name>" then i click the "更多" button
    And I click the "Label" button
    And I wait for "LabelInput" will be visible
    And I click the "LabelInput" button
    And I set the parameter "Tag" with value "testTag"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"
    And I wait for loading invisible
    And the data name is "<name>" then i click the "编辑" button
    Then I will see the "knowledge.CreatePage" page
    And I click the "Next" button
    And I wait for "1500" millsecond
    And I click the "Next" button
    And I wait for "1500" millsecond
    And I set the parameter "EventCode" with value "AutoTestRename"
    And I click the "Done" button
    Then I will see the element "SuccessAdd" name is "编辑成功"
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I wait for "1500" millsecond
    And the data name is "<name>" then i click the "更多" button
    And I click the "Auth" button
    And I wait for loading invisible
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'<name>'}" then i will see "<function>" button
    And the data name is "<name>" then i click the "更多" button
    And I click the "Delete" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除知识成功"
    Then I logout current user

    Examples:
      | name     |function|
      | AutoTest |编辑\n更多  |

  Scenario: 新建知识以测试二次授权
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I wait for loading invisible
    And I click the "Create" button
    Then I will see the "knowledge.CreatePage" page
    And I wait for "1500" millsecond
    And I click the "Next" button
    And I wait for "1500" millsecond
    And I click the "Next" button
    And I wait for "1500" millsecond
    And I set the parameter "EventCode" with value "测试二次授权"
    And I click the "Done" button
    Then I will see the element "SuccessAdd" name is "新建成功"
    Then I logout current user

  Scenario: 给AutoTest用户授权
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I wait for loading invisible
    When the data name is "{'column':'0','name':'测试二次授权'}" then i click the "更多" button
    And I click the "Auth" button
    And I wait for loading invisible
    And I "check" the checkbox which name is "AutoTest" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Then I logout current user

  Scenario Outline: 二次授权读取
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I wait for loading invisible
    When the data name is "{'column':'0','name':'<name>'}" then i click the "更多" button
    And I click the "Auth" button
    And I wait for loading invisible
    And I choose the "<authRole>" from the "AuthDropdown"
    When I "check" the function "<function>" which name is "<authName>" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Then I logout current user

    Examples:
      | authRole | authName | function | name   |
      | 用户       | 验证授权用户   | 读取       | 测试二次授权 |

  Scenario Outline: 验证二次授权读取
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'<name>'}" then i will see "<function>" button
    And the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "AutoTest" is disabled
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I wait for "1500" millsecond
    And the data name is "<name>" then i click the "查看" button
    Then I will see the "knowledge.CreatePage" page
    And I click the "Next" button
    And I wait for "1500" millsecond
    And I click the "Next" button
    And I wait for "1500" millsecond
    Then I will see the element "DisableDone" attribute is "disabled"
    Then I logout current user

    Examples:
      | name   | function|
      | 测试二次授权 |  查看\n授权 |


  Scenario Outline: 二次授权读取+编辑
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I wait for loading invisible
    When the data name is "{'column':'0','name':'<name>'}" then i click the "更多" button
    And I click the "Auth" button
    And I wait for loading invisible
    And I choose the "<authRole>" from the "AuthDropdown"
    And I wait for "5000" millsecond
    When I "check" the function "<function>" which name is "<authName>" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I wait for loading invisible
#    Then the data name is "{'column':'0','name':'<name>'}" then i will see "<usefunction>" button
    And the data name is "<name>" then i click the "更多" button
    And I wait for "1000" millsecond
    And I click the "Label" button
    And I wait for "LabelInput" will be visible
    And I wait for "2000" millsecond
    And I click the "LabelInput" button
    And I set the parameter "Tag" with value "testTag"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"
    And I wait for "2000" millsecond
    And the data name is "<name>" then i click the "更多" button
    And I click the "Auth" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "AutoTest" is disabled
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I wait for loading invisible
    And the data name is "<name>" then i click the "编辑" button
    Then I will see the "knowledge.CreatePage" page
    And I click the "Next" button
    And I wait for "1500" millsecond
    And I click the "Next" button
    And I wait for "1500" millsecond
    And I set the parameter "EventCode" with value "AutoTestRename"
    And I click the "Done" button
    Then I will see the element "SuccessAdd" name is "编辑成功"
    Then I logout current user

    Examples:
      | authRole | authName        | function | name   |
      | 角色       | __user_验证授权用户__ | 编辑       | 测试二次授权 |

  Scenario Outline: 二次授权读取+编辑+删除
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I wait for loading invisible
    When the data name is "{'column':'0','name':'<name>'}" then i click the "更多" button
    And I click the "Auth" button
    And I wait for loading invisible
    And I choose the "<authRole>" from the "AuthDropdown"
    And I wait for loading invisible
    When I "check" the function "<function>" which name is "<authName>" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I wait for loading invisible
  #  Then the data name is "{'column':'0','name':'<name>'}" then i will see "currentfunction" button
    And the data name is "<name>" then i click the "更多" button
    And I click the "Label" button
    And I wait for "LabelInput" will be visible
    And I wait for "2000" millsecond
    And I click the "LabelInput" button
    And I set the parameter "Tag" with value "testTag"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"
    And the data name is "<name>" then i click the "更多" button
    And I click the "Auth" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "AutoTest" is disabled
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I wait for loading invisible
    And the data name is "<name>" then i click the "编辑" button
    Then I will see the "knowledge.CreatePage" page
    And I click the "Next" button
    And I wait for "1500" millsecond
    And I click the "Next" button
    And I wait for "1500" millsecond
    And I set the parameter "EventCode" with value "AutoTestRename"
    And I click the "Done" button
    Then I will see the element "SuccessAdd" name is "编辑成功"
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I wait for "1500" millsecond
    And the data name is "<name>" then i click the "更多" button
    And I click the "Delete" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除知识成功"
    Then I logout current user

    Examples:
      | authRole | authName | function | name   | currentfunction|
      | 用户分组     | gc_test_group | 读取,编辑,删除 | 测试二次授权 | 查看/n授权     |
 #     | 用户分组     | 验证授权用户分组 | 读取,编辑,删除 | 测试二次授权 |

 # Scenario: 验证有效期限
 #   Given I login user "AutoTest" with password "All#123456"
 #   And I wait for "2000" millsecond
 #   Given open the "knowledge.ListPage" page for uri "/knowledge/"
 #   And I wait for loading invisible
 #   Then I will see the search result "{'column':'0','name':'AutoTestAuth','contains':'no'}"
 #   Then I logout current user

  Scenario Outline: 授权读取+删除+授权
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for "1000" millsecond
    Then I click the "{'TabButton':'知识'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "编辑" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    Then I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"
    Then I logout current user

    Examples:
      | name         |
      | AutoTestAuth |

  Scenario Outline: 授权读取+删除+授权
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for "1000" millsecond
    And the data name is "__user_验证授权用户__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for "1000" millsecond
    Then I click the "{'TabButton':'知识'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" the checkbox which name is "<name>" in auth table
    And I click the "SaveButton" button
    Then I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"
    Then I logout current user

    Examples:
      | name         |
      | AutoTestAuth |

  Scenario Outline: 验证读取+删除+授权
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I wait for loading invisible
    When the data name is "{'column':'0','name':'<name>'}" then i click the "查看" button
    And I wait for loading invisible
    Then I will see the "knowledge.CreatePage" page
    And I click the "Next" button
    And I wait for "1500" millsecond
    And I click the "Next" button
    And I wait for "1500" millsecond
    Then I will see the element "DisableDone" attribute is "disabled"
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I wait for "1500" millsecond
    And the data name is "<name>" then i click the "更多" button
    And I click the "Auth" button
    And I wait for loading invisible
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'<name>'}" then i click the "更多" button
    And I click the "Delete" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除知识成功"
    Then I logout current user

    Examples:
      | name         |function|
      | AutoTestAuth |编辑\n更多  |


