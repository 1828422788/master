@authtest
Feature: 权限-字典

  Scenario Outline: 授权功能权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "<name>" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "Resource" button
    When I "checked" the checkbox which name is "全选"
    When I "unchecked" the checkbox which name is "全选"
    When I "checked" the checkbox which name is "可查看字典管理"
    And I "checked" the checkbox which name is "可查看仪表盘"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Then I logout current user

    Examples:
      | name              |
      | __user_AutoTest__ |
      | __user_验证授权用户__   |

  Scenario: 验证无新建权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    Then I will see the "UploadButton" doesn't exist
    Then I logout current user

  Scenario: 勾选可新建字典权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "Resource" button
    And I "checked" the checkbox which name is "新建字典"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Then I logout current user

  Scenario: 验证可新建字典权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    When I click the "UploadButton" button
    And I upload a file with name "/src/test/resources/testdata/dictionary/AutoTestUserCreate.csv"
  #  And I wait for "FileName" will be visible
    Then I set the parameter "Name" with value "权限测试"
    And I click the "UploadConfirm" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "创建字典成功"
    Then I logout current user

  Scenario: 授权无读取权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for loading invisible
    Then I click the "{'TabButton':'字典'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "权限测试.csv" in auth table
    And I "unchecked" the checkbox which name is "权限测试.csv" in auth table
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Then I logout current user

  Scenario: 验证无读取权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    And I wait for "2000" millsecond
    Then I will see the search result "{'column':'0','name':'权限测试.csv','contains':'no'}"
    Then I logout current user

  Scenario: 授权有读取权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for loading invisible
    Then I click the "{'TabButton':'字典'}" button
    And I wait for loading invisible
    When I "checked" function "读取" from the auth table which name is "权限测试.csv"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Then I logout current user

  Scenario: 验证有读取权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    And I wait for loading invisible
    When the data name is "权限测试.csv" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    Then I logout current user

  Scenario Outline: 授权读取+编辑权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for loading invisible
    Then I click the "{'TabButton':'字典'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "权限测试.csv" in auth table
    When I "unchecked" function "删除,转授" from the auth table which name is "权限测试.csv"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Given delete file "/target/download-files/<name>.zip"
    Then I logout current user

    Examples:
      | name     |
      | 权限测试.csv |

  Scenario Outline: 验证读取+编辑
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'<name>'}" then i will see "<function>" button
    Given delete file "/target/download-files/<name>.zip"
    And the data name is "<name>" then i click the "更多" button
    Then I click the "Download" button
    When the data name is "<name>" then i click the "编辑" button
    Then I will see the "dictionary.CreatePage" page
    And I wait for loading invisible
    And I click the "Next" button
    And I click the "GroupInputButton" button
    #And I set the parameter "GroupInput" with value "字典分组AutoTest"
    #And I choose the "字典分组AutoTest" from the "Group"
    And I click the "Done" button
    And I will see the element "ResultMessage" contains "添加成功"
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    And I wait for loading invisible
    And the data name is "<name>" then i click the "更多" button
    Then I click the "Label" button
    Then I click the "TagButton" button
   # And I set the parameter "Tag" with value "test"
   # And I choose the "test" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    And I wait for loading invisible
    And the data name is "<name>" then i click the "更多" button
    Then I click the "Auth" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    Then I logout current user

    Examples:
      | name     |function|
      | 权限测试.csv |编辑\n更多  |

  #Scenario: 有效期限
  #  Given open the "roles.ListPage" page for uri "/account/roles/"
  #  And the data name is "__user_AutoTest__" then i click the "授权" button
  #  And I will see the "roles.AuthorizationPage" page
  #  And I wait for loading invisible
  #  And I click the "ResourceAuth" button
  #  And I wait for loading invisible
  #  Then I click the "{'TabButton':'字典'}" button
  #  And I wait for loading invisible
  #  And I "checked" the checkbox which name is "权限测试.csv" in auth table
  #  When the data name is "权限测试.csv" then I click the "无限期" button in auth table
  #  And I click the "Customize" button
  #  And I click the "DateEditor" button
  #  And I set the time input "TimeInput" to "1" minutes later
  #  And I click the "EnsureTime" button
  #  And I click the "SaveButton" button
  #  And I will see the success message "更新成功"

  Scenario Outline: 新建字典
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    When I click the "UploadButton" button
    And I upload a file with name "/src/test/resources/testdata/dictionary/<name>"
  #  And I wait for "FileName" will be visible
    Then I set the parameter "Name" with value "AutoTest"
    And I click the "UploadConfirm" button
    And I wait for "1000" millsecond
    Then I will see the success message "创建字典成功"

    Examples:
      | name         |
      | AutoTest.csv |

  Scenario Outline: 授权读取+编辑+删除
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for loading invisible
    Then I click the "{'TabButton':'字典'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "转授" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    Then I logout current user

    Examples:
      | name         |
      | AutoTest.csv |

  Scenario Outline: 验证读取+编辑+删除
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'<name>'}" then i will see "<function>" button
    Given delete file "/target/download-files/<name>.zip"
    When the data name is "<name>" then i click the "更多" button
    And I click the "Download" button
    When the data name is "<name>" then i click the "编辑" button
    Then I will see the "dictionary.CreatePage" page
    And I wait for loading invisible
    And I click the "Next" button
    And I click the "GroupInputButton" button
    And I set the parameter "GroupInput" with value "字典分组AutoTest"
    And I choose the "字典分组AutoTest" from the "Group"
    And I click the "Done" button
    And I will see the element "ResultMessage" contains "添加成功"
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "更多" button
    And I click the "Label" button
    Then I click the "TagButton" button
   # And I set the parameter "Tag" with value "test"
   # And I choose the "test" from the "TagDropdown"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "修改成功"
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "更多" button
    Then I click the "Auth" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "更多" button
    Then I click the "Delete" button
    And I wait for "EnsureButton" will be visible
    And I click the "EnsureButton" button
    Then I wait for element "SuccessMessage" change text to "删除成功"
    Then I logout current user

    Examples:
      | name         |function|
      | AutoTest.csv |编辑\n更多  |

  Scenario Outline: 授权读取+转授
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    When I click the "UploadButton" button
    And I upload a file with name "/src/test/resources/testdata/dictionary/<name>"
  #  And I wait for "FileName" will be visible
    Then I set the parameter "Name" with value "AutoTestUserCreate"
    And I click the "UploadConfirm" button
    And I wait for "1000" millsecond
    Then I will see the success message "创建字典成功"
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for loading invisible
    Then I click the "{'TabButton':'字典'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "编辑,删除" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "__user_验证授权用户__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for loading invisible
    Then I click the "{'TabButton':'字典'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" the checkbox which name is "<name>" in auth table
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Then I logout current user

    Examples:
      | name                   |
      | AutoTestUserCreate.csv |

  #Scenario: 验证有效期限
  #  Given I login user "AutoTest" with password "All#123456"
  #  And I wait for "2000" millsecond
  #  Given open the "dictionary.ListPage" page for uri "/dictionary/"
  #  Then I will see the search result "{'column':'0','name':'权限测试.csv','contains':'no'}"
  #  Then I logout current user

  Scenario Outline: 授权读取+删除
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for loading invisible
    Then I click the "{'TabButton':'字典'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" the checkbox which name is "<name>" in auth table
    When I "checked" function "读取,删除" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'<name>'}" then i will see "<function>" button
    When the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "删除" button
    And I wait for "EnsureButton" will be visible
    And I click the "EnsureButton" button
    Then I wait for element "SuccessMessage" change text to "删除成功"
    Then I logout current user

    Examples:
      | name     |function|
      | 权限测试.csv |授权\n删除    |


  Scenario: 验证读取+转授
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    And I wait for loading invisible
    When the data name is "AutoTestUserCreate.csv" then i click the "授权" button
    And I wait for loading invisible
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    Then I will see the success message "保存成功"
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    And I wait for loading invisible
    Then the data name is "AutoTestUserCreate.csv" then i will see "授权" button
    Then I logout current user

  Scenario Outline: 授权读取+编辑+转授
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for loading invisible
    Then I click the "{'TabButton':'字典'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "删除" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "__user_验证授权用户__" then i click the "授权" button
    And I wait for loading invisible
    And I will see the "roles.AuthorizationPage" page
    And I click the "ResourceAuth" button
    And I wait for loading invisible
    Then I click the "{'TabButton':'字典'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" the checkbox which name is "<name>" in auth table
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Then I logout current user

    Examples:
      | name                   |
      | AutoTestUserCreate.csv |

  Scenario Outline: 验证读取+编辑+转授
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    And I wait for loading invisible
    Then the data name is "AutoTestUserCreate.csv" then i will see "<function>" button
    Given delete file "/target/download-files/<name>.zip"
    When the data name is "<name>" then i click the "更多" button
    Then I click the "Download" button
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    And I wait for loading invisible
    And the data name is "<name>" then i click the "更多" button
    Then I click the "Label" button
    Then I click the "TagButton" button
   # And I set the parameter "Tag" with value "test"
   # And I choose the "test" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    And I wait for loading invisible
    When the data name is "AutoTestUserCreate.csv" then i click the "更多" button
    Then I click the "Auth" button
    And I wait for loading invisible
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    Then I will see the success message "保存成功"
    And I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    And I wait for loading invisible
    Then the data name is "AutoTestUserCreate.csv" then i will see "<function>" button
    When the data name is "<name>" then i click the "编辑" button
    Then I will see the "dictionary.CreatePage" page
    And I wait for loading invisible
    And I click the "Next" button
    And I click the "GroupInputButton" button
    And I set the parameter "GroupInput" with value "字典分组AutoTest"
    And I choose the "字典分组AutoTest" from the "Group"
    And I click the "Done" button
    And I will see the element "ResultMessage" contains "添加成功"
    Then I logout current user

    Examples:
      | name                   |function|
      | AutoTestUserCreate.csv |编辑\n更多    |

  Scenario Outline: 授权读取+删除+转授
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for loading invisible
    Then I click the "{'TabButton':'字典'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "编辑" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "__user_验证授权用户__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "ResourceAuth" button
    And I wait for loading invisible
    Then I click the "{'TabButton':'字典'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" the checkbox which name is "<name>" in auth table
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Then I logout current user

    Examples:
      | name                   |
      | AutoTestUserCreate.csv |

  Scenario Outline: 验证读取+删除+转授
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    And I wait for loading invisible
    Then the data name is "<name>" then i will see "<function>" button
    When the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    Then I will see the success message "保存成功"
    And I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    And I wait for loading invisible
    Then the data name is "AutoTestUserCreate.csv" then i will see "<function>" button
    When the data name is "AutoTestUserCreate.csv" then i click the "删除" button
    And I wait for "EnsureButton" will be visible
    And I click the "EnsureButton" button
    Then I wait for element "SuccessMessage" change text to "删除成功"
    Then I logout current user

    Examples:
      | name                   |function|
      | AutoTestUserCreate.csv |授权\n删除    |

  Scenario: 再次创建字典
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    When I click the "UploadButton" button
    And I upload a file with name "/src/test/resources/testdata/dictionary/AutoTestUserCreate.csv"
  #  And I wait for "FileName" will be visible
    Then I set the parameter "Name" with value "AutoTestUserCreate"
    And I click the "UploadConfirm" button
    Then I will see the success message "创建字典成功"

  Scenario Outline: 授权所有权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for loading invisible
    Then I click the "{'TabButton':'字典'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "__user_验证授权用户__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for loading invisible
    Then I click the "{'TabButton':'字典'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" the checkbox which name is "<name>" in auth table
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Then I logout current user

    Examples:
      | name                   |
      | AutoTestUserCreate.csv |

  Scenario Outline: 验证所有权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    And I wait for loading invisible
    Then the data name is "AutoTestUserCreate.csv" then i will see "<function>" button
    Given delete file "/target/download-files/<name>.zip"
    When the data name is "<name>" then i click the "更多" button
    Then I click the "Download" button
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "更多" button
    Then I click the "Label" button
    Then I click the "TagButton" button
    And I set the parameter "Tag" with value "test"
    And I choose the "test" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    And I wait for loading invisible
    When the data name is "AutoTestUserCreate.csv" then i click the "更多" button
    Then I click the "Auth" button
    And I wait for loading invisible
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
   Then I will see the success message "保存成功"
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    And I wait for loading invisible
    Then the data name is "AutoTestUserCreate.csv" then i will see "<function>" button
    And I wait for "2000" millsecond
    When the data name is "<name>" then i click the "编辑" button
    Then I will see the "dictionary.CreatePage" page
    And I wait for loading invisible
    And I click the "Next" button
    And I click the "GroupInputButton" button
   # And I set the parameter "GroupInput" with value "字典分组AutoTest"
   # And I choose the "字典分组AutoTest" from the "Group"
    And I click the "Done" button
    And I will see the element "ResultMessage" contains "添加成功"
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    And I wait for loading invisible
    When the data name is "AutoTestUserCreate.csv" then i click the "更多" button
    Then I click the "Delete" button
    And I wait for "EnsureButton" will be visible
    And I click the "EnsureButton" button
    Then I wait for element "SuccessMessage" change text to "删除成功"
    Then I logout current user

    Examples:
      | name                   |function|
      | AutoTestUserCreate.csv |编辑\n更多    |

  Scenario: 新建
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    And I wait for loading invisible
    When I click the "UploadButton" button
    And I upload a file with name "/src/test/resources/testdata/dictionary/AuthTest.csv"
  #  And I wait for "FileName" will be visible
    Then I set the parameter "Name" with value "AuthTest"
    And I click the "UploadConfirm" button
    And I wait for "1500" millsecond
    Then I will see the success message "创建字典成功"

  Scenario: 授权用户读取权限
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    And I wait for loading invisible
    When the data name is "AuthTest.csv" then i click the "更多" button
    When I click the "Auth" button
    And I wait for loading invisible
    When I "check" the function "读取" which name is "AutoTest" in tiny table
    And I click the "Ensure" button
    Then I will see the success message "保存成功"
    Then I logout current user

  Scenario: 验证用户读取权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    And I wait for loading invisible
    When the data name is "AuthTest.csv" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    Then I logout current user

  Scenario: 授权对应角色的读取权限
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    And I wait for loading invisible
    When the data name is "AuthTest.csv" then i click the "更多" button
    When I click the "Auth" button
    And I wait for loading invisible
    And I "check" the checkbox which name is "AutoTest" in tiny table
    And I "uncheck" the checkbox which name is "AutoTest" in tiny table
    And I click the "Ensure" button
    Then I will see the success message "保存成功"
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    And I wait for loading invisible
    When the data name is "AuthTest.csv" then i click the "更多" button
    When I click the "Auth" button
    And I choose the "角色" from the "AuthDropdown"
    And I wait for loading invisible
    When I "check" the function "读取" which name is "__user_AutoTest__" in tiny table
    And I click the "Ensure" button
    Then I will see the success message "保存成功"
    Then I logout current user

  Scenario: 验证角色读取权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    And I wait for loading invisible
    Then the data name is "AuthTest.csv" then i will see "授权" button
    When the data name is "AuthTest.csv" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    Then I logout current user

  Scenario: 授权对应用户分组的读取权限
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    And I wait for loading invisible
    When the data name is "AuthTest.csv" then i click the "更多" button
    When I click the "Auth" button
    And I wait for loading invisible
    And I choose the "角色" from the "AuthDropdown"
    And I wait for loading invisible
    And I "check" the checkbox which name is "__user_AutoTest__" in tiny table
    And I "uncheck" the checkbox which name is "__user_AutoTest__" in tiny table
    And I click the "Ensure" button
    Then I will see the success message "保存成功"
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    And I wait for loading invisible
    When the data name is "AuthTest.csv" then i click the "更多" button
    When I click the "Auth" button
    And I wait for loading invisible
    And I choose the "用户分组" from the "AuthDropdown"
    And I wait for loading invisible
    When I "check" the function "读取" which name is "AutoTestGroup" in tiny table
    And I click the "Ensure" button
    Then I will see the success message "保存成功"
    Then I logout current user

  Scenario: 验证用户分组读取权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    And I wait for loading invisible
    Then the data name is "AuthTest.csv" then i will see "授权" button
    When the data name is "AuthTest.csv" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    Then I logout current user

  Scenario: 给用户授权所有权限
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    And I wait for loading invisible
    When the data name is "AuthTest.csv" then i click the "更多" button
    When I click the "Auth" button
    And I wait for loading invisible
    And I "check" the checkbox which name is "AutoTest" in tiny table
    And I click the "Ensure" button
    Then I will see the success message "保存成功"
    Then I logout current user

  Scenario Outline: 二次授权读取
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    And I wait for loading invisible
    When the data name is "AuthTest.csv" then i click the "更多" button
    When I click the "Auth" button
    And I wait for loading invisible
    And I choose the "<authRole>" from the "AuthDropdown"
    And I wait for loading invisible
    When I "check" the function "<function>" which name is "<authName>" in tiny table
    And I click the "Ensure" button
    Then I will see the success message "保存成功"
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    And I wait for loading invisible
    Then the data name is "AuthTest.csv" then i will see "授权" button
    When the data name is "AuthTest.csv" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "AutoTest" is disabled
    Then I logout current user

    Examples:
      | authRole | authName | function |
      | 用户       | 验证授权用户   | 读取       |

  Scenario Outline: 二次授权读取+编辑
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    And I wait for loading invisible
    When the data name is "AuthTest.csv" then i click the "更多" button
    When I click the "Auth" button
    And I wait for loading invisible
    And I choose the "<authRole>" from the "AuthDropdown"
    And I wait for loading invisible
    When I "check" the function "<function>" which name is "<authName>" in tiny table
    And I click the "Ensure" button
    Then I will see the success message "保存成功"
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'<name>'}" then i will see "<userfunction>" button
    Given delete file "/target/download-files/<name>.zip"
    When the data name is "<name>" then i click the "更多" button
    Then I click the "Download" button
    When the data name is "<name>" then i click the "编辑" button
    Then I will see the "dictionary.CreatePage" page
    And I wait for loading invisible
    And I click the "Next" button
    And I click the "GroupInputButton" button
    And I set the parameter "GroupInput" with value "字典分组AutoTest"
    And I choose the "字典分组AutoTest" from the "Group"
    And I click the "Done" button
    And I will see the element "ResultMessage" contains "添加成功"
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "更多" button
    Then I click the "Label" button
    Then I click the "TagButton" button
    #And I set the parameter "Tag" with value "test"
    #And I choose the "test" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "更多" button
    Then I click the "Auth" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "AutoTest" is disabled
    Then I logout current user

    Examples:
      | authRole | authName        | function | name         |userfunction|
      | 角色       | __user_验证授权用户__ | 编辑       | AuthTest.csv |编辑\n更多        |

  Scenario Outline: 二次授权读取+编辑+删除
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    And I wait for loading invisible
    When the data name is "AuthTest.csv" then i click the "更多" button
    Then I click the "Auth" button
    And I wait for loading invisible
    And I choose the "<authRole>" from the "AuthDropdown"
    And I wait for loading invisible
    When I "check" the function "<function>" which name is "<authName>" in tiny table
    And I click the "Ensure" button
    Then I will see the success message "保存成功"
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'<name>'}" then i will see "<userfunction>" button
    Given delete file "/target/download-files/<name>.zip"
    And the data name is "<name>" then i click the "更多" button
    Then I click the "Download" button
    When the data name is "<name>" then i click the "编辑" button
    Then I will see the "dictionary.CreatePage" page
    And I wait for loading invisible
    And I click the "Next" button
    And I click the "GroupInputButton" button
    #And I set the parameter "GroupInput" with value "字典分组AutoTest"
    #And I choose the "字典分组AutoTest" from the "Group"
    And I click the "Done" button
    And I will see the element "ResultMessage" contains "添加成功"
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "更多" button
    Then I click the "Label" button
    Then I click the "TagButton" button
    #And I set the parameter "Tag" with value "test"
    #And I choose the "test" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "更多" button
    Then I click the "Auth" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "AutoTest" is disabled
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    And I wait for loading invisible
    When the data name is "AuthTest.csv" then i click the "更多" button
    Then I click the "Delete" button
    And I wait for "EnsureButton" will be visible
    And I click the "EnsureButton" button
    Then I wait for element "SuccessMessage" change text to "删除成功"
    Then I logout current user

    Examples:
      | authRole | authName | function | name         |userfunction|
      | 用户分组     | 验证授权用户分组 | 读取,编辑,删除 | AuthTest.csv |编辑\n更多        |
