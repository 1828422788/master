#@auth
Feature: 权限-报表

  Scenario Outline: 勾选所需功能权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "<name>" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    When I "checked" the checkbox which name is "全选"
    When I "unchecked" the checkbox which name is "全选"
    And I click the "Resource" button
    When I "checked" the checkbox which name is "可查看报表"
    When I "unchecked" the checkbox which name is "新建报表"
    And I "checked" the checkbox which name is "可查看仪表盘"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"

    Examples:
      | name              |
      | __user_AutoTest__ |
      | __user_验证授权用户__   |

  Scenario Outline: 新建所需趋势图
    Given open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading invisible
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I wait for "1500" millsecond
    And I click the "NextButton" button
    And I wait for "1500" millsecond
    When I set the parameter "NameInput" with value "<name>"
    And I click the "Complete" button
    And I wait for "SuccessCreate" will be visible
    Then I logout current user

    Examples:
      | name        | spl                                                                                             |
      | ForAutoTest | tag:*hide \| stats avg(apache.status) as a_\|eval icon=if(a_>300,\"thumbs-down\",\"thumbs-up\") |

  Scenario: 验证无新建权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "report.ListPage" page for uri "/reports/"
    And I wait for loading invisible
    Then I will see the "Create" doesn't exist
    Then I logout current user

  Scenario: 授权有新建权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "Resource" button
    And I wait for "1000" millsecond
    When I "checked" the checkbox which name is "新建报表"
    And I click the "ResourceAuth" button
    And I wait for "1000" millsecond
    Then I click the "{'TabButton':'趋势图'}" button
    And I "checked" the checkbox which name is "ForAutoTest" in auth table
    And I click the "SaveButton" button
    And I wait for "2500" millsecond
    And I will see the success message "更新成功"
    Then I logout current user

  Scenario: 验证有新建权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "report.ListPage" page for uri "/reports/"
    And I click the "Create" button
    And I click the "NewReportButton" button
    Then I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "AutoTestCreate"
    And I choose the "PDF" from the "ReportType"
    And I set the parameter "Subject" with value "test"
    And I set the parameter "Hour" with value "11"
    And I set the parameter "Minute" with value "11"
    And I click the "NextButton" button
    And I choose the "ForAutoTest" from the "ChartList"
    And I wait for "2000" millsecond
    And I click the "Save" button
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "新建成功"
    Then I logout current user

  Scenario: 取消读取权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "ResourceAuth" button
    And I wait for loading invisible
    Then I click the "{'TabButton':'报表'}" button
    And I wait for "1000" millsecond
    And I "checked" the checkbox which name is "AutoTestCreate" in auth table
    And I "unchecked" the checkbox which name is "AutoTestCreate" in auth table
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Then I logout current user

  Scenario: 验证无读取权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "report.ListPage" page for uri "/reports/"
    Then I will see the search result "{'column':'1','name':'AutoTestCreate','contains':'no'}"
    Then I logout current user

  Scenario Outline: 授权读取权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "ResourceAuth" button
    And I wait for loading invisible
    Then I click the "{'TabButton':'报表'}" button
    And I wait for "1000" millsecond
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" the checkbox which name is "<name>" in auth table
    When I "checked" function "读取" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Then I logout current user

    Examples:
      | name           |
      | AutoTestCreate |

  Scenario Outline: 验证读取权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "report.ListPage" page for uri "/reports/"
    And I wait for loading invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "<function>" button
    And I wait for "1000" millsecond
    Then I will see the switch button before "{'column':'1','name':'<name>'}" is disabled
    And the data name is "{'column':'1','name':'<name>'}" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    Given open the "report.ListPage" page for uri "/reports/"
    And the data name is "{'column':'1','name':'<name>'}" then i click the "查看" button
    Then I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "AutoCreate"
    And I click the "NextButton" button
    And I wait for "1000" millsecond
    And I click the "Complete" button
    Then I will see the error message "API: 没有相关资源权限"
    Then I logout current user

    Examples:
      | name           |function|
      | AutoTestCreate |查看\n授权    |

  Scenario Outline: 授权读取+编辑权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "ResourceAuth" button
    And I wait for loading invisible
    Then I click the "{'TabButton':'报表'}" button
    And I wait for "1000" millsecond
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "删除,转授" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Then I logout current user

    Examples:
      | name           |
      | AutoTestCreate |

  Scenario Outline: 验证读取+编辑权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "report.ListPage" page for uri "/reports/"
    And I wait for loading invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "<function>" button
    When the data name is "{'column':'1','name':'<name>'}" then I "close" the switch
    Then I will see the message "禁用成功"
    When the data name is "{'column':'1','name':'<name>'}" then i click the "更多" button
    And I click the "Label" button
    And I wait for "TagToInput" will be visible
    And I click the "TagToInput" button
    And I set the parameter "Tag" with value "测试标签"
    And I click the "Ensure" button
    #Then I will see the message "修改成功"
    Then I will see the success message "修改成功"
    When the data name is "{'column':'1','name':'<name>'}" then i click the "编辑" button
    Then I will see the "report.CreatePage" page
    And I wait for "1000" millsecond
    #And I wait for element "DefaultReportType" change text to "PDF"
    And I set the parameter "Name" with value "AutoTestRename"
    And I click the "NextButton" button
    And I click the "Complete" button
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "更新成功"
    Given open the "report.ListPage" page for uri "/reports/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'AutoTestRename'}" then i click the "更多" button
    And I click the "Auth" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    Then I logout current user

    Examples:
      | name           |function|
      | AutoTestCreate |编辑\n更多    |

  Scenario Outline: 授权读取+编辑+删除
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "ResourceAuth" button
    And I wait for loading invisible
    Then I click the "{'TabButton':'报表'}" button
    And I wait for "1000" millsecond
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "转授" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Then I logout current user

    Examples:
      | name           |
      | AutoTestRename |

  Scenario Outline: 验证读取+编辑+删除
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "report.ListPage" page for uri "/reports/"
    And I wait for loading invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "<function>" button
    When the data name is "{'column':'1','name':'<name>'}" then i click the "编辑" button
    Then I will see the "report.CreatePage" page
    And I wait for "1000" millsecond
    And I set the parameter "Name" with value "AutoTestCreate"
    And I click the "NextButton" button
    And I click the "Complete" button
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "更新成功"
    Given open the "report.ListPage" page for uri "/reports/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'AutoTestCreate'}" then I "open" the switch
   # Then I will see the message "开启成功"
    When the data name is "{'column':'1','name':'AutoTestCreate'}" then i click the "更多" button
    And I click the "Label" button
    And I wait for "TagToInput" will be visible
    And I click the "TagToInput" button
    And I set the parameter "Tag" with value "测试标签"
    And I choose the "测试标签" from the "LastDropdownList"
    And I click the "Ensure" button
    Then I will see the message "修改成功"
    Given open the "report.ListPage" page for uri "/reports/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'AutoTestCreate'}" then i click the "更多" button
    And I click the "Auth" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    Given open the "report.ListPage" page for uri "/reports/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'AutoTestCreate'}" then i click the "更多" button
    And I click the "Delete" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I wait for element "Message" change text to "删除成功"
    Then I logout current user

    Examples:
      | name           |function|
      | AutoTestRename |编辑\n更多    |

  Scenario Outline: 授权读取+删除
    Given open the "report.ListPage" page for uri "/reports/"
    And I click the "Create" button
    Then I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "<name>"
    And I choose the "PDF" from the "ReportType"
    And I set the parameter "Subject" with value "test"
    And I set the parameter "Hour" with value "11"
    And I set the parameter "Minute" with value "11"
    And I click the "NextButton" button
    And I choose the "ForAutoTest" from the "ChartList"
    And I click the "Save" button
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "新建成功"
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "ResourceAuth" button
    And I wait for loading invisible
    Then I click the "{'TabButton':'报表'}" button
    And I wait for "1000" millsecond
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "编辑,转授" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Then I logout current user

    Examples:
      | name           |
      | AutoTestCreate |

  Scenario Outline: 验证读取+删除
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "report.ListPage" page for uri "/reports/"
    And I wait for loading invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "<function>" button
    Then I will see the switch button before "{'column':'1','name':'<name>'}" is disabled
    And the data name is "{'column':'1','name':'<name>'}" then i click the "更多" button
    And I click the "Auth" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    Given open the "report.ListPage" page for uri "/reports/"
    And I wait for loading invisible
    And the data name is "{'column':'1','name':'<name>'}" then i click the "查看" button
    Then I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "AutoCreate"
    And I click the "NextButton" button
    #And I wait for "TopoTitle" will be visible
    Then I will see the element "Complete" attribute is "disabled"
    Given open the "report.ListPage" page for uri "/reports/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "更多" button
    And I click the "Delete" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I wait for element "Message" change text to "删除成功"
    Then I logout current user

    Examples:
      | name           |function|
      | AutoTestCreate |查看\n更多    |

  Scenario Outline: 授权读取+转授权限
    Given open the "report.ListPage" page for uri "/reports/"
    And I wait for loading invisible
    And I click the "Create" button
    Then I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "<name>"
    And I set the parameter "Subject" with value "test"
    And I set the parameter "Hour" with value "11"
    And I set the parameter "Minute" with value "11"
    And I click the "NextButton" button
    And I choose the "ForAutoTest" from the "ChartList"
  #  And I wait for "TopoTitle" will be visible
    And I click the "Save" button
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "新建成功"
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "ResourceAuth" button
    And I wait for loading invisible
    Then I click the "{'TabButton':'报表'}" button
    And I wait for "1000" millsecond
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "编辑,删除" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Then I logout current user

    Examples:
      | name           |
      | AutoTestCreate |

  Scenario Outline: 验证读取+转授权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "report.ListPage" page for uri "/reports/"
    And I wait for loading invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "<function>" button
    Then I will see the switch button before "{'column':'1','name':'<name>'}" is disabled
    And the data name is "{'column':'1','name':'<name>'}" then i click the "授权" button
    And I wait for loading invisible
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "report.ListPage" page for uri "/reports/"
    And I wait for loading invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "<function>" button
    And the data name is "{'column':'1','name':'<name>'}" then i click the "查看" button
    Then I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "AutoCreate"
    And I choose the "PDF" from the "ReportType"
    And I click the "NextButton" button
    Then I will see the element "Complete" attribute is "disabled"
    Then I logout current user

    Examples:
      | name           |function|
      | AutoTestCreate |查看\n授权    |

  Scenario Outline: 授权读取+编辑+转授权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "ResourceAuth" button
    And I wait for loading invisible
    Then I click the "{'TabButton':'报表'}" button
    And I wait for "1000" millsecond
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "删除" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Then I logout current user

    Examples:
      | name           |
      | AutoTestCreate |

  Scenario Outline: 验证读取+编辑+转授权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "report.ListPage" page for uri "/reports/"
    And I wait for loading invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "<function>" button
    When the data name is "{'column':'1','name':'<name>'}" then I "close" the switch
#    Then I will see the message "禁用成功"
    When the data name is "{'column':'1','name':'<name>'}" then i click the "更多" button
    And I click the "Label" button
    And I wait for "TagToInput" will be visible
    And I click the "TagToInput" button
    And I set the parameter "Tag" with value "测试标签"
    And I choose the "测试标签" from the "LastDropdownList"
    And I click the "Ensure" button
    And I wait for element "Message" change text to "修改成功"
    Given open the "report.ListPage" page for uri "/reports/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "更多" button
    And I click the "Auth" button
    And I wait for loading invisible
    And I "uncheck" the checkbox which name is "验证授权用户" in tiny table
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "report.ListPage" page for uri "/reports/"
    And I wait for loading invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "<function>" button
    When the data name is "{'column':'1','name':'<name>'}" then i click the "编辑" button
    Then I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "AutoTestRename"
    And I click the "NextButton" button
    And I click the "Complete" button
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "更新成功"

    Examples:
      | name           |function|
      | AutoTestCreate |编辑\n更多    |

 # Scenario: 有效期限
 #   Given open the "roles.ListPage" page for uri "/account/roles/"
 #   And the data name is "__user_AutoTest__" then i click the "授权" button
 #   And I will see the "roles.AuthorizationPage" page
 #   And I click the "ResourceAuth" button
 #   And I wait for loading invisible
 #   Then I click the "{'TabButton':'报表'}" button
 #   And I wait for "1000" millsecond
 #   And I "checked" the checkbox which name is "AutoTestRename" in auth table
 #   When the data name is "AutoTestRename" then I click the "无限期" button in auth table
 #   And I click the "Customize" button
 #   And I click the "DateEditor" button
 #   And I set the time input "TimeInput" to "1" minutes later
 #   And I click the "EnsureTime" button
 #   And I click the "SaveButton" button
 #   And I will see the success message "更新成功"

  Scenario: 新建
    Given open the "report.ListPage" page for uri "/reports/"
    And I wait for loading invisible
    And I click the "Create" button
    Then I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "AutoTestCreate"
    And I choose the "PDF" from the "ReportType"
    And I set the parameter "Subject" with value "test"
    And I set the parameter "Hour" with value "11"
    And I set the parameter "Minute" with value "11"
    And I click the "NextButton" button
    And I choose the "ForAutoTest" from the "ChartList"
    And I click the "Save" button
  #  And I wait for "TopoTitle" will be visible
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "新建成功"

  Scenario Outline: 授权所有权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "ResourceAuth" button
    And I wait for loading invisible
    Then I click the "{'TabButton':'报表'}" button
    And I wait for "1000" millsecond
    And I "checked" the checkbox which name is "<name>" in auth table
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Then I logout current user

    Examples:
      | name           |
      | AutoTestCreate |

  Scenario Outline: 验证所有权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "report.ListPage" page for uri "/reports/"
    And I wait for loading invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "<function>" button
    When the data name is "{'column':'1','name':'<name>'}" then I "close" the switch
    When the data name is "{'column':'1','name':'<name>'}" then i click the "更多" button
    And I click the "Label" button
    And I wait for "TagToInput" will be visible
    And I click the "TagToInput" button
    And I set the parameter "Tag" with value "测试标签"
    And I choose the "测试标签" from the "LastDropdownList"
    And I click the "Ensure" button
    And I wait for element "Message" change text to "修改成功"
    Given open the "report.ListPage" page for uri "/reports/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "更多" button
    And I click the "Auth" button
    And I wait for loading invisible
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "report.ListPage" page for uri "/reports/"
    And I wait for loading invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "<function>" button
    When the data name is "{'column':'1','name':'<name>'}" then i click the "编辑" button
    Then I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "AutoTestRename"
    And I click the "NextButton" button
    And I click the "Complete" button
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "更新成功"
    Given open the "report.ListPage" page for uri "/reports/"
    And I wait for loading invisible
    And the data name is "{'column':'1','name':'AutoTestRename'}" then i click the "更多" button
    And I click the "Delete" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I wait for element "Message" change text to "删除成功"
    Then I logout current user

    Examples:
      | name           |function|
      | AutoTestCreate |编辑\n更多    |

  Scenario: 新建报表用来测试二次授权
    Given open the "report.ListPage" page for uri "/reports/"
    And I wait for loading invisible
    And I click the "Create" button
    Then I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "测试二次授权"
    And I set the parameter "Subject" with value "test"
    And I set the parameter "Hour" with value "11"
    And I set the parameter "Minute" with value "11"
    And I click the "NextButton" button
    And I choose the "ForAutoTest" from the "ChartList"
    And I click the "Save" button
   # And I wait for "TopoTitle" will be visible
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "新建成功"

  Scenario: 给AutoTest用户授权
    Given open the "report.ListPage" page for uri "/reports/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'测试二次授权'}" then i click the "更多" button
    And I click the "Auth" button
    And I "check" the checkbox which name is "AutoTest" in tiny table
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the message "保存成功"

  Scenario Outline: 二次授权读取
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "report.ListPage" page for uri "/reports/"
    When the data name is "{'column':'1','name':'测试二次授权'}" then i click the "更多" button
    And I click the "Auth" button
    When I "check" the function "<function>" which name is "<authName>" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "report.ListPage" page for uri "/reports/"
    And I wait for loading invisible
    Then the data name is "{'column':'1','name':'测试二次授权'}" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "AutoTest" is disabled
    Then I logout current user

    Examples:
      | authName | function |
      | 验证授权用户   | 读取       |

  Scenario Outline: 二次授权读取+编辑
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "report.ListPage" page for uri "/reports/"
    When the data name is "{'column':'1','name':'测试二次授权'}" then i click the "更多" button
    And I click the "Auth" button
    And I choose the "<authRole>" from the "AuthDropdown"
    And I wait for loading invisible
    When I "check" the function "<function>" which name is "<authName>" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "report.ListPage" page for uri "/reports/"
    And I wait for loading invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "<function>" button
    When the data name is "{'column':'1','name':'<name>'}" then i click the "编辑" button
    Then I will see the "report.CreatePage" page
   # And I wait for element "DefaultReportType" change text to "PDF"
    And I set the parameter "Name" with value "测试权限重命名"
    And I click the "NextButton" button
    And I click the "Complete" button
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "更新成功"
    Given open the "report.ListPage" page for uri "/reports/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'测试权限重命名'}" then I "close" the switch
#    Then I will see the message "禁用成功"
    When the data name is "{'column':'1','name':'测试权限重命名'}" then i click the "更多" button
    And I click the "Label" button
    And I wait for "TagToInput" will be visible
    And I click the "TagToInput" button
    And I set the parameter "Tag" with value "测试标签"
    And I choose the "测试标签" from the "LastDropdownList"
    And I click the "Ensure" button
    And I wait for "Message" will be visible
    When the data name is "{'column':'1','name':'测试权限重命名'}" then i click the "更多" button
    And I click the "Auth" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "AutoTest" is disabled

    Examples:
      | authRole | authName        | function | name   |userfunction|
      | 角色       | __user_验证授权用户__ | 编辑       | 测试二次授权 |编辑\n更多        |

  Scenario Outline: 二次授权读取+编辑+删除
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "report.ListPage" page for uri "/reports/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "更多" button
    And I click the "Auth" button
    And I wait for "2000" millsecond
    And I choose the "<authRole>" from the "AuthDropdown"
    And I wait for loading invisible
    When I "check" the function "<function>" which name is "<authName>" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "report.ListPage" page for uri "/reports/"
    And I wait for loading invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "<userfunction>" button
    When the data name is "{'column':'1','name':'<name>'}" then i click the "编辑" button
    Then I will see the "report.CreatePage" page
   # And I wait for element "DefaultReportType" change text to "PDF"
    And I set the parameter "Name" with value "测试二次授权"
    And I click the "NextButton" button
    And I click the "Complete" button
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "更新成功"
    Given open the "report.ListPage" page for uri "/reports/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'测试二次授权'}" then I "open" the switch
#    Then I will see the message "开启成功"
    When the data name is "{'column':'1','name':'测试二次授权'}" then i click the "更多" button
    And I click the "Label" button
    And I wait for "TagField" will be visible
    And I click the "TagField" button
    And I set the parameter "Tag" with value "测试标签"
    And I choose the "测试标签" from the "LastDropdownList"
    And I click the "Ensure" button
    And I wait for "Message" will be visible
    Given open the "report.ListPage" page for uri "/reports/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'测试二次授权'}" then i click the "更多" button
    And I click the "Auth" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "AutoTest" is disabled
    Given open the "report.ListPage" page for uri "/reports/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'测试二次授权'}" then i click the "更多" button
    And I click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I wait for element "Message" change text to "删除成功"

    Examples:
      | authRole | authName | function | name    |userfunction|
      | 用户分组     | 验证授权用户分组 | 读取,编辑,删除 | 测试权限重命名 |编辑\n更多        |

 # Scenario: 验证有效期限
 #   Given I login user "Autotest" with password "All#123456"
 #   And I wait for "2000" millsecond
 #   Given open the "report.ListPage" page for uri "/reports/"
 #  Then I will see the search result "{'column':'1','name':'AutoTestRename','contains':'no'}"

  Scenario Outline: 授权读取+删除+转授权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "ResourceAuth" button
    And I wait for loading invisible
    Then I click the "{'TabButton':'报表'}" button
    And I wait for "1000" millsecond
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "编辑" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "report.ListPage" page for uri "/reports/"
    And I wait for loading invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "<function>" button
    Then I will see the switch button before "{'column':'1','name':'<name>'}" is disabled
    And the data name is "{'column':'1','name':'<name>'}" then i click the "更多" button
    And I click the "Auth" button
    And I wait for loading invisible
    And I "uncheck" the checkbox which name is "验证授权用户" in tiny table
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "report.ListPage" page for uri "/reports/"
    And I wait for loading invisible
   # Then the data name is "{'column':'1','name':'<name>'}" then i will see "<function>" button
   # And the data name is "{'column':'1','name':'<name>'}" then i click the "查看" button
   # Then I will see the "report.CreatePage" page
   # And I set the parameter "Name" with value "AutoCreate"
   # And I click the "NextButton" button
   # Then I will see the element "Complete" attribute is "disabled"
   # Given open the "report.ListPage" page for uri "/reports/"
   # And I wait for loading invisible
    And the data name is "{'column':'1','name':'<name>'}" then i click the "更多" button
    And I click the "Delete" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I wait for element "Message" change text to "删除成功"

    Examples:
      | name           |function|
      | AutoTestRename |查看\n更多    |