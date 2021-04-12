@authtest
Feature: 权限-趋势图

  Scenario Outline: 勾选功能权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "<name>" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "Resource" button
    When I "checked" the checkbox which name is "全选"
    When I "unchecked" the checkbox which name is "全选"
    And I "checked" the checkbox which name is "可查看趋势图,可查看仪表盘,新建仪表盘"
    And I click the "SaveButton" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"
    Then I logout current user

    Examples:
      | name              |
      | __user_AutoTest__ |
      | __user_验证授权用户__   |

  Scenario: 验证无新建权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    And open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading invisible
    Then I will see the "Create" doesn't exist
    Then I logout current user

  Scenario: 授权新建权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "Resource" button
    And I "checked" the checkbox which name is "新建趋势图"
    And I click the "SaveButton" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"

  Scenario: 新建趋势图
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    And open the "trend.ListPage" page for uri "/trend/"
    And I wait for "2000" millsecond
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page
    And I set the parameter "SearchInput" with value "tag:*display | stats count() by apache.clientip,apache.resp_len | limit 10 "
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I wait for "Header" will be visible
    And I wait for "1000" millsecond
    And I click the "NextButton" button
    And I wait for "1000" millsecond
    When I set the parameter "NameInput" with value "AutoTest"
    And I click the "Complete" button
    And I wait for "SuccessCreate" will be visible
    Then I logout current user

  Scenario Outline: 不授予任何权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for "1000" millsecond
    Then I click the "{'TabButton':'趋势图'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" the checkbox which name is "<name>" in auth table
    And I click the "SaveButton" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"
    Then I logout current user

    Examples:
      | name     |
      | AutoTest |

  Scenario Outline: 验证无任何权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    And open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading invisible
    Then I will see the search result "{'column':'0','name':'<name>','contains':'no'}"
    Then I logout current user

    Examples:
      | name     |
      | AutoTest |

  Scenario Outline: 仅授权读取
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for "1000" millsecond
    Then I click the "{'TabButton':'趋势图'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" the checkbox which name is "<name>" in auth table
    When I "checked" function "读取" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"

    Examples:
      | name     |
      | AutoTest |

  Scenario Outline: 验证读取
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    And open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading invisible
    Then the data name is "<name>" then i will see "<function>" button
    When the data name is "<name>" then i click the "查看" button
    Then I will see the "trend.CreatePage" page
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I wait for "Header" will be visible
    And I wait for "2000" millsecond
    And I click the "NextButton" button
    And I wait for "2000" millsecond
    When I set the parameter "NameInput" with value "AutoTest"
    And I click the "Complete" button
    And I will see the error message "无更改权限"
  #  Then I will see the element "Complete" attribute is "disabled"
    And open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "更多" button
    And I click the "Auth" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    And open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "更多" button
    And I click the "Copy" button
    And I wait for "Message" will be visible
    Then I will see the message "复制成功"
    Then I logout current user

    Examples:
      | name     |function|
      | AutoTest |查看\n更多    |

  Scenario Outline: 取消新建趋势图权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "Resource" button
    When I "unchecked" the checkbox which name is "新建趋势图"
    And I click the "ResourceAuth" button
    And I wait for "1000" millsecond
    Then I click the "{'TabButton':'趋势图'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" the checkbox which name is "<name>" in auth table
    When I "checked" function "读取" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"

    Examples:
      | name         |
      | AutoTest_副本 |

  Scenario Outline: 验证无复制权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    And open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'<name>'}" then i will see "<function>" button
    When the data name is "<name>" then i click the "查看" button
    Then I will see the "trend.CreatePage" page
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I wait for "Header" will be visible
    And I wait for "1000" millsecond
    And I click the "NextButton" button
    And I wait for "1000" millsecond
    When I set the parameter "NameInput" with value "AutoTest"
    And I click the "Complete" button
    And I will see the error message "无更改权限"
   # Then I will see the element "NextButton" attribute is "disabled"
    And open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    Then I logout current user

    Examples:
      | name         |function|
      | AutoTest_副本 |查看\n授权     |

  Scenario Outline: 授权读取+编辑
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for "1000" millsecond
    Then I click the "{'TabButton':'趋势图'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" the checkbox which name is "<name>" in auth table
    When I "checked" function "读取,编辑" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"
    Then I logout current user

    Examples:
      | name         |
      | AutoTest_副本 |

  Scenario Outline: 验证读取+编辑
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    And open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading invisible
    Then the data name is "<name>" then i will see "<function>" button
    When the data name is "<name>" then i click the "更多" button
    And I click the "Label" button
    And I wait for "2000" millsecond
    And I wait for "TagToInput" will be visible
    And I click the "TagToInput" button
    And I set the parameter "Tag" with value "testTag"
    And I choose the "testTag" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "更新成功"
    When the data name is "<name>" then i click the "更多" button
    And I click the "Auth" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    And open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "编辑" button
    Then I will see the "trend.CreatePage" page
    And I wait for loading invisible
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I wait for "Header" will be visible
    And I wait for "1000" millsecond
    And I click the "NextButton" button
    And I wait for "1000" millsecond
    And I set the parameter "NameInput" with value "AutoEditCopy"
    And I wait for "2000" millsecond
    And I click the "Complete" button
    And I wait for "SuccessUpdate" will be visible
    And I click the "Report" button
    And switch to another window
    Then I close all tabs except main tab
    Then the page's title will be "403 Permission Denied"
    And I logout current user

    Examples:
      | name         |function|
      | AutoTest_副本 |编辑\n更多     |

  Scenario Outline: 授权读取+编辑+删除+有效期限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "Resource" button
    And I "checked" the checkbox which name is "可查看报表,新建报表"
    And I click the "ResourceAuth" button
    And I wait for "1000" millsecond
    Then I click the "{'TabButton':'趋势图'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "转授" from the auth table which name is "<name>"
    And I "checked" the checkbox which name is "AutoTest" in auth table
    And I click the "SaveButton" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"
    Then I logout current user

    Examples:
      | name         |
      | AutoEditCopy |

 # Scenario: 授权有效期限
 #   Given open the "roles.ListPage" page for uri "/account/roles/"
 #   And I wait for loading invisible
 #   And the data name is "__user_AutoTest__" then i click the "授权" button
 #   And I will see the "roles.AuthorizationPage" page
 #   And I wait for loading invisible
 #   And I click the "ResourceAuth" button
 #   And I wait for "1000" millsecond
 #   Then I click the "{'TabButton':'趋势图'}" button
 #   And I wait for loading invisible
 #   When the data name is "AutoTest" then I click the "无限期" button in auth table
 #   And I click the "Customize" button
 #   And I click the "DateEditor" button
 #   And I set the time input "TimeInput" to "1" minutes later
 #   And I click the "EnsureTime" button
 #   And I click the "SaveButton" button
 #   And I wait for "SuccessMessage" will be visible
 #   And I will see the success message "更新成功"



  Scenario Outline: 验证读取+编辑+删除+有效期限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    And open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading invisible
    Then the data name is "<name>" then i will see "<function>" button
    When the data name is "<name>" then i click the "更多" button
    And I click the "Label" button
    And I wait for "2000" millsecond
    And I wait for "TagToInput" will be visible
    And I click the "TagToInput" button
    And I set the parameter "Tag" with value "testTag"
    And I choose the "testTag" from the "TagDropdown"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "更新成功"
    When the data name is "<name>" then i click the "更多" button
    And I click the "Auth" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    And open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "编辑" button
    Then I will see the "trend.CreatePage" page
    And I wait for loading invisible
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I wait for "Header" will be visible
    And I wait for "1000" millsecond
    And I click the "NextButton" button
    And I wait for "1000" millsecond
    And I set the parameter "NameInput" with value "AutoEditCopy"
    And I wait for "1000" millsecond
    And I click the "Complete" button
    And I wait for "SuccessUpdate" will be visible
    And I click the "Report" button
    And switch to another window
    Then I close all tabs except main tab
    Then I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "AutoTestCreate"
    And I set the parameter "Subject" with value "test"
    And I set the parameter "Hour" with value "11"
    And I set the parameter "Minute" with value "11"
    And I click the "NextButton" button
    #And I wait for "TopoTitle" will be visible
    And I will see the element "TopoTitle" name is "1<name>"
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "新建成功"
    And open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "更多" button
    And I click the "Delete" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "删除成功"
    Then I logout current user

    Examples:
      | name         |function|
      | AutoEditCopy |编辑\n更多    |

  Scenario Outline: 复制AutoTest
    Given open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "更多" button
    And I click the "Copy" button
    And I wait for "Message" will be visible
    Then I will see the message "复制成功"

    Examples:
      | name     |
      | AutoTest |

  Scenario Outline: 授权读取+转授权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "Resource" button
    And I "checked" the checkbox which name is "新建趋势图"
    And I click the "SaveButton" button
    And I click the "ResourceAuth" button
    And I wait for "1000" millsecond
    Then I click the "{'TabButton':'趋势图'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "编辑,删除" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Then I logout current user

    Examples:
      | name         |
      | AutoTest_副本 |

  Scenario Outline: 验证读取+转授权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    And open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading invisible
    Then the data name is "<name>" then i will see "<function>" button
    When the data name is "<name>" then i click the "查看" button
    Then I will see the "trend.CreatePage" page
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I wait for "Header" will be visible
    And I wait for "1000" millsecond
    And I click the "NextButton" button
    When I set the parameter "NameInput" with value "AutoTest"
    And I click the "Complete" button
    And I will see the error message "无更改权限"
    #Then I will see the element "NextButton" attribute is "disabled"
    And open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "更多" button
    And I click the "Copy" button
    And I wait for "Message" will be visible
    Then I will see the message "复制成功"
    And open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "更多" button
    And I click the "Auth" button
    And I wait for loading invisible
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    And I wait for "Message" will be visible
    Then I will see the message "保存成功"
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    And open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading invisible
    Then the data name is "<name>" then i will see "<function>" button
    When the data name is "<name>" then i click the "更多" button
    And I click the "Auth" button
    And I wait for loading invisible
    Then I logout current user

    Examples:
      | name         |function|
      | AutoTest_副本 |查看\n更多    |

  Scenario: 授权读取+编辑+转授权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for "1000" millsecond
    Then I click the "{'TabButton':'趋势图'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "AutoTest_副本_副本" in auth table
    When I "unchecked" function "删除" from the auth table which name is "AutoTest_副本_副本"
    And I click the "SaveButton" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"

  Scenario: 授权读取+编辑+转授权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "__user_验证授权用户__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for "1000" millsecond
    Then I click the "{'TabButton':'趋势图'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "AutoTest_副本_副本" in auth table
    And I "unchecked" the checkbox which name is "AutoTest_副本_副本" in auth table
    And I click the "SaveButton" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"
    Then I logout current user

  Scenario Outline: 验证读取+编辑+转授权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    And open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading invisible
    Then the data name is "AutoTest_副本_副本" then i will see "<function>" button
    When the data name is "AutoTest_副本_副本" then i click the "更多" button
    And I click the "Label" button
    And I wait for "2000" millsecond
    And I wait for "TagToInput" will be visible
    And I click the "TagToInput" button
    And I set the parameter "Tag" with value "testTag"
    And I choose the "testTag" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "更新成功"
    When the data name is "AutoTest_副本_副本" then i click the "编辑" button
    Then I will see the "trend.CreatePage" page
    And I wait for loading invisible
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I wait for "Header" will be visible
    And I wait for "1000" millsecond
    And I click the "NextButton" button
    And I set the parameter "NameInput" with value "<name>"
    And I wait for "1000" millsecond
    And I click the "Complete" button
    And I wait for "SuccessUpdate" will be visible
    And open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "更多" button
    And I click the "Auth" button
    And I wait for loading invisible
    And I "uncheck" the checkbox which name is "验证授权用户" in tiny table
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    And I wait for "Message" will be visible
    Then I will see the message "保存成功"
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    And open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading invisible
    Then the data name is "<name>" then i will see "<function>" button
    When the data name is "<name>" then i click the "更多" button
    And I click the "Label" button
    And I wait for "2000" millsecond
    And I wait for "TagToInput" will be visible
    And I click the "TagToInput" button
    And I set the parameter "Tag" with value "testTag"
    And I choose the "testTag" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "更新成功"

    Examples:
      | name         |function|
      | AutoUserEdit |编辑\n更多    |

  Scenario: 新建仪表盘
    And I login user "AutoTest" with password "All#123456"
    And open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the "Create" button under some element
    And I wait for "DashBoardName" will be visible
    And I set the parameter "DashBoardName" with value "趋势图仪表盘相关"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "新建仪表盘成功"
    Then I logout current user

  Scenario: 新建标签页
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "趋势图仪表盘相关"
    Then I will see the "dashboard.DetailPage" page
    When I set the parameter "TagName" with value "test"
    And I click the "EnsureCreateTagButton" button
    And I wait for loading complete
    And I back to before

  Scenario: 授权趋势图所有权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for "1000" millsecond
    Then I click the "{'TabButton':'趋势图'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "AutoTest_副本" in auth table
    And I click the "SaveButton" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"

  Scenario Outline: 验证添加图表
    Given I login user "AutoTest" with password "All#123456"
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "趋势图仪表盘相关"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "AddEventButton" will be visible
    When I click the "AddEventButton" button
    And I click the "AddChart" button
    And I wait for "SpinDot" will be invisible
    And I set the parameter "SearchChartInput" with value "<name>"
  #  And I wait for "SpinDot" will be invisible
    Then I wait for "AutotestCopy" will be visible
    Then I logout current user

    Examples:
      | name         |
      | AutoTest_副本 |

  Scenario: 取消授权趋势图所有权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for "1000" millsecond
    Then I click the "{'TabButton':'趋势图'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "AutoTest_副本" in auth table
    And I "unchecked" the checkbox which name is "AutoTest_副本" in auth table
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Then I logout current user

  Scenario Outline: 验证无趋势图图表
    Given I login user "AutoTest" with password "All#123456"
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "趋势图仪表盘相关"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "AddEventButton" will be visible
    When I click the "AddEventButton" button
    And I click the "AddChart" button
    And I wait for "SpinDot" will be invisible
    And I set the parameter "SearchChartInput" with value "<name>"
   # And I wait for "SpinDot" will be invisible
    Then I will see the "AutotestCopy" doesn't exist
    Then I logout current user

    Examples:
      | name         |
      | AutoTest_副本 |

  Scenario Outline: 删除趋势图
    And open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "更多" button
    And I click the "Delete" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除成功"

    Examples:
      | name         |
      | AutoTest_副本 |

  Scenario Outline: 授权读取+删除
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for "1000" millsecond
    Then I click the "{'TabButton':'趋势图'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "编辑,转授" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Then I logout current user

    Examples:
      | name     |
      | AutoTest |

  Scenario Outline: 验证读取+删除
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    And open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading invisible
    Then the data name is "<name>" then i will see "<function>" button
    When the data name is "<name>" then i click the "更多" button
    And I click the "Copy" button
    And I wait for "Message" will be visible
    Then I will see the message "复制成功"
    And open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "查看" button
    Then I will see the "trend.CreatePage" page
    And I wait for "Header" will be visible
    And I wait for "1000" millsecond
    And I click the "NextButton" button
    And I wait for "Header" will be visible
    And I wait for "1000" millsecond
    And I click the "NextButton" button
    When I set the parameter "NameInput" with value "AutoTest"
    And I click the "Complete" button
    And I will see the error message "无更改权限"
   # Then I will see the element "NextButton" attribute is "disabled"
    And open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "更多" button
    And I click the "Auth" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    And open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "更多" button
    And I click the "Delete" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "删除成功"
    Then I logout current user

    Examples:
      | name     |function|
      | AutoTest |查看\n更多    |

  Scenario Outline: 授权读取+删除+转授权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for "1000" millsecond
    Then I click the "{'TabButton':'趋势图'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "编辑" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"

    Examples:
      | name         |
      | AutoUserEdit |

  Scenario Outline: 授权读取+删除+转授权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "__user_验证授权用户__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for "1000" millsecond
    Then I click the "{'TabButton':'趋势图'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" the checkbox which name is "<name>" in auth table
    And I click the "SaveButton" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"

    Examples:
      | name         |
      | AutoUserEdit |

  Scenario Outline: 验证读取+删除+转授权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    And open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading invisible
    Then the data name is "<name>" then i will see "<function>" button
    When the data name is "<name>" then i click the "查看" button
    Then I will see the "trend.CreatePage" page
    And I wait for "Header" will be visible
    And I wait for "1000" millsecond
    And I click the "NextButton" button
    And I wait for "Header" will be visible
    And I wait for "1000" millsecond
    And I click the "NextButton" button
    When I set the parameter "NameInput" with value "AutoTest"
    And I click the "Complete" button
    And I will see the error message "无更改权限"
   # Then I will see the element "NextButton" attribute is "disabled"
    And open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "更多" button
    And I click the "Auth" button
    And I wait for loading invisible
    And I "uncheck" the checkbox which name is "验证授权用户" in tiny table
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    And open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "更多" button
    And I click the "Copy" button
    And I wait for "Message" will be visible
    Then I will see the message "复制成功"
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    And open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading invisible
    Then the data name is "<name>" then i will see "<function>" button
    When the data name is "<name>" then i click the "更多" button
    And I click the "Copy" button
    And I wait for "Message" will be visible
    Then I will see the message "复制成功"
    And open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading invisible
    Then the data name is "<name>" then i will see "<function>" button
    When the data name is "<name>" then i click the "更多" button
    And I click the "Delete" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除成功"
    Then I logout current user

    Examples:
      | name         |function|
      | AutoUserEdit |查看\n更多    |

  Scenario Outline: 授权所有权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for "1000" millsecond
    Then I click the "{'TabButton':'趋势图'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I click the "SaveButton" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"
    Then I logout current user

    Examples:
      | name             |
      | AutoUserEdit_副本 |

  Scenario Outline: 验证所有权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    And open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading invisible
    Then the data name is "<name>" then i will see "<function>" button
    When the data name is "<name>" then i click the "更多" button
    And I click the "Label" button
    And I wait for "2000" millsecond
    And I wait for "TagToInput" will be visible
    And I click the "TagToInput" button
    And I set the parameter "Tag" with value "testTag"
    And I choose the "testTag" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "更新成功"
    When the data name is "<name>" then i click the "编辑" button
    Then I will see the "trend.CreatePage" page
    And I wait for loading invisible
    And I wait for "Header" will be visible
    And I wait for "1000" millsecond
    And I click the "NextButton" button
    And I wait for "Header" will be visible
    And I wait for "1000" millsecond
    And I click the "NextButton" button
    And I set the parameter "NameInput" with value "AutoEditCopy"
    And I click the "Complete" button
    And I wait for "SuccessUpdate" will be visible
    And open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading invisible
    When the data name is "<newName>" then i click the "更多" button
    And I click the "Auth" button
    And I wait for loading invisible
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "Message" will be visible
    Then I will see the message "保存成功"
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    And open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading invisible
    Then the data name is "<newName>" then i will see "<function>" button
    When the data name is "<newName>" then i click the "更多" button
    And I click the "Copy" button
    And I wait for "Message" will be visible
    Then I will see the message "复制成功"
    And open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading invisible
    When the data name is "<newName>" then i click the "更多" button
    And I click the "Delete" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除成功"
    And I logout current user

    Examples:
      | name             | newName      |function|
      | AutoUserEdit_副本 | AutoEditCopy |编辑\n更多    |

  Scenario: 删除报表
    Given open the "report.ListPage" page for uri "/reports/"
    And I wait for loading invisible
    And the data name is "{'column':'1','name':'AutoTestCreate'}" then i click the "更多" button
    And I click the "Delete" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I wait for element "Message" change text to "删除成功"

  Scenario: 给AutoTest用户授权
    Given open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading invisible
    When the data name is "AutoEditCopy_副本" then i click the "更多" button
    And I click the "Auth" button
    And I wait for loading invisible
    And I "check" the checkbox which name is "AutoTest" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"

  Scenario: 给AutoTest用户授权
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "__user_验证授权用户__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for "1000" millsecond
    Then I click the "{'TabButton':'趋势图'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "AutoEditCopy_副本" in auth table
    And I "unchecked" the checkbox which name is "AutoEditCopy_副本" in auth table
    And I click the "SaveButton" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"
    Then I logout current user

  Scenario Outline: 二次授权读取
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading invisible
    When the data name is "{'column':'0','name':'<name>'}" then i click the "更多" button
    And I click the "Auth" button
    And I wait for loading invisible
    And I choose the "<authRole>" from the "AuthDropdown"
    When I "check" the function "<function>" which name is "<authName>" in tiny table
    And I click the "Ensure" button
    And I wait for "Message" will be visible
    Then I will see the message "保存成功"
    Then I logout current user

    Examples:
      | authRole | authName | function | name             |
      | 用户       | 验证授权用户   | 读取       | AutoEditCopy_副本 |

  Scenario Outline: 验证二次授权读取
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    And open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading invisible
    Then the data name is "<name>" then i will see "<function>" button
    When the data name is "<name>" then i click the "查看" button
    Then I will see the "trend.CreatePage" page
    And I wait for "2000" millsecond
    And I click the "NextButton" button
    And I wait for "1000" millsecond
    And I click the "NextButton" button
    When I set the parameter "NameInput" with value "AutoTest"
    And I click the "Complete" button
    And I wait for "SuccessUpdate" will be visible
    And open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "更多" button
    And I click the "Auth" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "AutoTest" is disabled
    Then I logout current user

    Examples:
      | authRole | authName | function | name             |function|
      | 用户       | 验证授权用户   | 读取       | AutoEditCopy_副本 |查看\n更多     |

  Scenario Outline: 二次授权读取+编辑
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading invisible
    When the data name is "{'column':'0','name':'<name>'}" then i click the "更多" button
    And I click the "Auth" button
    And I wait for loading invisible
    And I choose the "<authRole>" from the "AuthDropdown"
    And I wait for loading invisible
    When I "check" the function "<function>" which name is "<authName>" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Then I logout current user

    Examples:
      | authRole | authName        | function | name             |
      | 角色       | __user_验证授权用户__ | 编辑       | AutoEditCopy_副本|


  Scenario Outline: 验证二次授权读取+编辑
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    And open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading invisible
    Then the data name is "<name>" then i will see "<function>" button
    When the data name is "<name>" then i click the "更多" button
    And I click the "Label" button
    And I wait for "2000" millsecond
    And I wait for "TagToInput" will be visible
    And I click the "TagToInput" button
    And I set the parameter "Tag" with value "testTag"
    And I choose the "testTag" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "更新成功"
    When the data name is "<name>" then i click the "更多" button
    And I click the "Auth" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "AutoTest" is disabled
    And open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "编辑" button
    Then I will see the "trend.CreatePage" page
    And I wait for "2000" millsecond
    And I click the "NextButton" button
    And I wait for "1000" millsecond
    And I click the "NextButton" button
    And I set the parameter "NameInput" with value "AutoEditCopy"
    And I click the "Complete" button
    And I wait for "SuccessUpdate" will be visible
    Then I logout current user

    Examples:
      | authRole | authName        | function | name             |function|
      | 角色       | __user_验证授权用户__ | 编辑       | AutoEditCopy_副本 |编辑\n更多     |

  Scenario Outline: 二次授权读取+编辑+删除
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading invisible
    When the data name is "{'column':'0','name':'<name>'}" then i click the "更多" button
    And I click the "Auth" button
    And I wait for loading invisible
    And I choose the "<authRole>" from the "AuthDropdown"
    And I wait for loading invisible
    When I "check" the function "<function>" which name is "<authName>" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Then I logout current user

    Examples:
      | authRole | authName | function | name         |
      | 用户分组     | 验证授权用户分组 | 读取,编辑,删除 | AutoEditCopy |


  Scenario Outline: 验证二次授权读取+编辑+删除
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    And open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading invisible
    Then the data name is "<name>" then i will see "<function>" button
    When the data name is "<name>" then i click the "更多" button
    And I click the "Label" button
    And I wait for "2000" millsecond
    And I wait for "TagToInput" will be visible
    And I click the "TagToInput" button
    And I wait for "Tag" will be visible
    And I set the parameter "Tag" with value "testTag"
    And I choose the "testTag" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "更新成功"
    When the data name is "<name>" then i click the "更多" button
    And I click the "Auth" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "AutoTest" is disabled
    And open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "编辑" button
    Then I will see the "trend.CreatePage" page
    And I wait for "2000" millsecond
    And I click the "NextButton" button
    And I wait for "1000" millsecond
    And I click the "NextButton" button
    And I wait for "1000" millsecond
    And I click the "Complete" button
    And I wait for "SuccessUpdate" will be visible
    And I click the "Report" button
    And switch to another window
    Then I close all tabs except main tab
    Then I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "AutoTestCreate"
    And I set the parameter "Subject" with value "test"
    And I set the parameter "Hour" with value "11"
    And I set the parameter "Minute" with value "11"
    And I click the "NextButton" button
    And I wait for "TopoTitle" will be visible
    And I will see the element "TopoTitle" name is "1<name>"
    And I click the "Save" button
    Then I will see the success message "保存成功"
    And open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "更多" button
    And I click the "Delete" button
    And I click the "Ensure" button
    Then I will see the success message "删除成功"
    Then I logout current user

    Examples:
      | authRole | authName | function | name         |function|
      | 用户分组     | 验证授权用户分组 | 读取,编辑,删除 | AutoEditCopy |编辑\n更多    |

 # Scenario: 验证有效期限生效
 #   Given I login user "AutoTest" with password "All#123456"
 #   Given open the "trend.ListPage" page for uri "/trend/"
 #   And I wait for loading invisible
 #   Then I will see the search result "{'column':'0','name':'AutoTest','contains':'no'}"
 #   Then I logout current user

  Scenario: 删除仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And the data name is "趋势图仪表盘相关" then i click the "更多" button
    And I click the "Delete" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "删除仪表盘成功"