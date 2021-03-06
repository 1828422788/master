#@auth
Feature: 权限-已存搜索

  Scenario Outline: 勾选所需功能权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "<name>" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    When I "checked" the checkbox which name is "全选"
    When I "unchecked" the checkbox which name is "全选"
    When I "checked" the checkbox which name is "可查看搜索页"
    And I click the "Resource" button
    When I "checked" the checkbox which name is "可查看已存搜索"
    When I "unchecked" the checkbox which name is "新建已存搜索"
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
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for "2000" millsecond
    Then I click the "SavedSearch" button
    Then I will see the "NewSavedSearch" doesn't exist

  Scenario: 授权新建已存搜索
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "Resource" button
    And I wait for "1000" millsecond
    When I "checked" the checkbox which name is "新建已存搜索"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"

  Scenario: 验证新建已存搜索
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for loading invisible
    And I click the "SavedSearch" button
    And I set the parameter "SavedSearchName" with value "AutoTestCreate"
    And I click the "EnsureCreateSavedSearch" button
    Then I will see the success message "创建成功"

  Scenario Outline: 取消读取权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for "1000" millsecond
    Then I click the "{'TabButton':'已存搜索'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" the checkbox which name is "<name>" in auth table
    And I click the "SaveButton" button
    And I will see the success message "更新成功"

    Examples:
      | name           |
      | AutoTestCreate |

  Scenario Outline: 验证无读取权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "splSearch.SavedSearchPage" page for uri "/savedsearches/"
    And I wait for loading invisible
    Then I will see the search result "{'column':'1','name':'<name>','contains':'no'}"

    Examples:
      | name           |
      | AutoTestCreate |

  Scenario Outline: 授权读取
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for "1000" millsecond
    Then I click the "{'TabButton':'已存搜索'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" the checkbox which name is "<name>" in auth table
    When I "checked" function "读取" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"

    Examples:
      | name           |
      | AutoTestCreate |

  Scenario Outline: 验证读取
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "splSearch.SavedSearchPage" page for uri "/savedsearches/"
    And I wait for loading invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "<function>" button
    Then I will see the "Star" is "yotta-icon yotta-icon-StarFilled"
    And the data name is "{'column':'1','name':'<name>'}" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    Given open the "splSearch.SavedSearchPage" page for uri "/savedsearches/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "加载" button
    And switch to another window
    Then I close all tabs except main tab
    Then the page's title will be "搜索"
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for loading invisible
    And I click the "OpenSavedSearchButton" button
    And I wait for loading invisible
    And I click the "OpenSavedSearchList" button
    And I wait for loading invisible
    And I click the star before "{'column':'2','name':'<name>'}" in saved search
    And I wait for "2000" millsecond
    Then I will see the success message "API: 没有相关资源权限"
      #######3.7版本无删除按钮
  #  Given open the "splSearch.SearchPage" page for uri "/search/"
  #  And I wait for loading invisible
  #  And I click the "OpenSavedSearchButton" button
  #  And I wait for loading invisible
  #  And I click the "getOpenSavedSearchList" button
  #  And I wait for loading invisible
  #  When the data is "AutoTestCreate" then i click the button "删除" in more menu in the saved search table
  #  And I wait for loading invisible
  #  And I click the "DeleteSavedSearch" button
  #  Then I will see the success message "删除失败: 没有相关资源权限"

    Examples:
      | name           |function|
      | AutoTestCreate |加载\n授权    |

  Scenario Outline: 授权读取+编辑
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for "1000" millsecond
    Then I click the "{'TabButton':'已存搜索'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "删除,转授" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"

    Examples:
      | name           |
      | AutoTestCreate |

  Scenario Outline: 授权读取+编辑
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "splSearch.SavedSearchPage" page for uri "/savedsearches/"
    And I wait for loading invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "<function>" button
    Then I click the star before "{'column':'2','name':'<name>'}" in saved search list
    Then I will see the success message "更新成功"
    When the data name is "{'column':'1','name':'<name>'}" then i click the "更多" button
    And I click the "Label" button
    And I wait for "TagToInput" will be visible
    And I click the "TagToInput" button
    And I set the parameter "Tag" with value "testTag"
    And I choose the "Tag" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "更新成功"
    And the data name is "{'column':'1','name':'<name>'}" then i click the "更多" button
    And I wait for "1000" millsecond
    And I click the "Auth" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    And I wait for loading invisible
    Given open the "splSearch.SavedSearchPage" page for uri "/savedsearches/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "加载" button
    And switch to another window
    Then I close all tabs except main tab
    Then the page's title will be "搜索"
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for loading invisible
    And I click the "OpenSavedSearchButton" button
    And I wait for loading invisible
    And I wait for "5000" millsecond
    And I click the "OpenSavedSearchList" button
    And I wait for "5000" millsecond
    And I click the star before "{'column':'2','name':'<name>'}" in saved search
    Then I will see the message "更新成功"
    ###3.7没有删除按钮
   # When the data is "AutoTestCreate" then i click the button "删除" in more menu in the saved search table
   # And I click the "DeleteSavedSearch" button
   # And I wait for "SuccessMessage" will be visible
   # Then I will see the success message "删除失败: 没有相关资源权限"

    Examples:
      | name           |function|
      | AutoTestCreate |加载\n更多    |

  #Scenario Outline: 有效期限
    #Given open the "roles.ListPage" page for uri "/account/roles/"
    #And the data name is "__user_AutoTest__" then i click the "授权" button
    #And I will see the "roles.AuthorizationPage" page
    #And I wait for loading invisible
    #Then I click the "{'TabButton':'已存搜索'}" button
    #And I wait for loading invisible
    #And I "checked" the checkbox which name is "<name>" in auth table
    #When the data name is "<name>" then I click the "无限期" button in auth table
    #And I click the "Customize" button
    #And I click the "DateEditor" button
    #And I set the time input "TimeInput" to "1" minutes later
    #And I click the "EnsureTime" button
    #And I click the "SaveButton" button
    #And I will see the success message "更新成功"

   # Examples:
   #   | name           |
   #   | AutoTestCreate |

  Scenario Outline: 新建AutoTest已存搜索
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I click the "SavedSearch" button
    And I set the parameter "OfflineTaskName" with value "<name>"
    And I click the "EnsureCreateSavedSearch" button
    Then I will see the success message "创建成功"

    Examples:
      | name            |
      | AutoTest        |
      | AutoTestForAuth |
      | AutoTestDelete  |

  Scenario Outline: 授权读取+删除-读取
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    Then I click the "{'TabButton':'已存搜索'}" button
    And I wait for loading invisible
    And I wait for "2000" millsecond
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "编辑,转授" from the auth table which name is "<name>"
    And I "checked" the checkbox which name is "AutoTestDelete" in auth table
    When I "unchecked" function "编辑,转授" from the auth table which name is "AutoTestDelete"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "splSearch.SavedSearchPage" page for uri "/savedsearches/"
    And I wait for loading invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "<function>" button
    Then I will see the "Star" is "yotta-icon yotta-icon-StarFilled"
    And the data name is "{'column':'1','name':'<name>'}" then i click the "更多" button
    And I click the "Auth" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    Given open the "splSearch.SavedSearchPage" page for uri "/savedsearches/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "加载" button
    And switch to another window
    Then I close all tabs except main tab
    Then the page's title will be "搜索"
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for loading invisible
    And I click the "OpenSavedSearchButton" button
    And I wait for loading invisible
    And I click the "OpenSavedSearchList" button
    And I wait for loading invisible
    And I click the star before "{'column':'2','name':'<name>'}" in saved search
    Then I will see the success message "API: 没有相关资源权限"

    Examples:
      | name            |function|
      | AutoTestForAuth |加载\n更多    |


  Scenario Outline: 授权读取+删除-删除
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for loading invisible
    And I click the "OpenSavedSearchButton" button
    And I wait for loading invisible
    And I click the "OpenSavedSearchList" button
    And I wait for loading invisible
    #########3.8定位范围
    When the data is "<name>" then i click the button "删除" in more menu in the saved search table
    And I click the "DeleteSavedSearch" button
    Then I will see the message "删除成功"
    Given open the "splSearch.SavedSearchPage" page for uri "/savedsearches/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'AutoTestDelete'}" then i click the "更多" button
    And I click the "Delete" button
    And I click the "Ensure" button
    Then I will see the success message "删除成功"

    Examples:
      | name            |function|
      | AutoTestForAuth |加载\n更多    |



 # Scenario: 验证有效期限
 #   When I wait for "2000" millsecond
 #   And I logout current user
 #   And I wait for title change text to "登录"
 #   And open the "LoginPage" page for uri "/auth/login/"
 #   When I set the parameter "Username" with value "AutoTest"
 #   And I set the parameter "Password" with value "All#123456"
 #   And I click the "LoginButton" button
 #   And I wait for "2000" millsecond
 #   Given open the "splSearch.SavedSearchPage" page for uri "/savedsearches/"
 #   And I wait for loading invisible
 #   Then I will see the search result "{'column':'1','name':'AutoTestCreate','contains':'no'}"

  Scenario Outline: 授权读取+编辑+删除
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    Then I click the "{'TabButton':'已存搜索'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "转授" from the auth table which name is "<name>"
    And I "checked" the checkbox which name is "AutoTest" in auth table
    When I "unchecked" function "转授" from the auth table which name is "AutoTest"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "splSearch.SavedSearchPage" page for uri "/savedsearches/"
    And I wait for loading invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "<function>" button
    Then I click the star before "<name>" in saved search list
    Then I will see the success message "更新成功"
    When the data name is "{'column':'1','name':'<name>'}" then i click the "更多" button
    And I click the "Label" button
    And I wait for "TagToInput" will be visible
    And I click the "TagToInput" button
    And I set the parameter "Tag" with value "testTag"
    And I click the "Ensure" button
    Then I will see the success message "更新成功"
    And the data name is "{'column':'1','name':'<name>'}" then i click the "更多" button
    And I click the "Auth" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    Given open the "splSearch.SavedSearchPage" page for uri "/savedsearches/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "加载" button
    And switch to another window
    Then I close all tabs except main tab
    Then the page's title will be "搜索"
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for loading invisible
    And I click the "OpenSavedSearchButton" button
    And I wait for loading invisible
    And I click the "OpenSavedSearchList" button
    And I wait for loading invisible
    And I click the star before "{'column':'2','name':'<name>'}" in saved search
    Then I will see the message "更新成功"
    And I wait for "Message" will be invisible
    #######3.8定位范围
    When the data is "AutoTestCreate" then i click the button "删除" in more menu in the saved search table
    And I click the "DeleteSavedSearch" button
    Then I will see the message "删除成功"
    Given open the "splSearch.SavedSearchPage" page for uri "/savedsearches/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'AutoTest'}" then i click the "更多" button
    And I click the "Delete" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除成功"

    Examples:
      | name           |function|
      | AutoTestCreate |加载\n更多    |

  Scenario Outline: 授权读取+转授
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for loading invisible
    And I click the "SavedSearch" button
    And I set the parameter "OfflineTaskName" with value "<name>"
    And I click the "EnsureCreateSavedSearch" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "创建成功"
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    Then I click the "{'TabButton':'已存搜索'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "编辑,删除" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "splSearch.SavedSearchPage" page for uri "/savedsearches/"
    And I wait for loading invisible

    Then the data name is "{'column':'1','name':'<name>'}" then i will see "<function>" button
    Then I will see the "Star" is "yotta-icon yotta-icon-StarFilled"
    And the data name is "{'column':'1','name':'<name>'}" then i click the "授权" button
    And I wait for loading invisible
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Given open the "splSearch.SavedSearchPage" page for uri "/savedsearches/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "加载" button
    And switch to another window
    Then I close all tabs except main tab
    Then the page's title will be "搜索"
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "splSearch.SavedSearchPage" page for uri "/savedsearches/"
    And I wait for loading invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "<function>" button
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for loading invisible
    And I click the "OpenSavedSearchButton" button
    And I wait for loading invisible
    And I click the "OpenSavedSearchList" button
    And I wait for loading invisible
    And I click the star before "{'column':'2','name':'<name>'}" in saved search
    Then I will see the success message "API: 没有相关资源权限"
    #3.7版本无删除权限时没有删除按钮
  # Given open the "splSearch.SearchPage" page for uri "/search/"
  #  And I wait for loading invisible
  #  And I click the "OpenSavedSearchButton" button
  #  When the data is "AutoTestCreate" then i click the button "删除" in more menu in the saved search table
  #  And I click the "DeleteSavedSearch" button
  #  Then I will see the success message "删除失败: 没有相关资源权限"

    Examples:
      | name           |function|
      | AutoTestCreate |加载\n授权    |

  Scenario Outline: 授权读取+编辑+转授
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    Then I click the "{'TabButton':'已存搜索'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "删除" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "splSearch.SavedSearchPage" page for uri "/savedsearches/"
    And I wait for loading invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "<function>" button
    Then I click the star before "<name>" in saved search list
    Then I will see the success message "更新成功"
    When the data name is "{'column':'1','name':'<name>'}" then i click the "更多" button
    And I click the "Label" button
    And I wait for "TagToInput" will be visible
    And I click the "TagToInput" button
    And I set the parameter "Tag" with value "testTag"
    And I click the "Ensure" button
    Then I will see the success message "更新成功"
    And the data name is "{'column':'1','name':'<name>'}" then i click the "更多" button
    And I click the "Auth" button
    And I wait for loading invisible
    And I "uncheck" the checkbox which name is "验证授权用户" in tiny table
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "splSearch.SavedSearchPage" page for uri "/savedsearches/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "加载" button
    And switch to another window
    Then I close all tabs except main tab
    Then the page's title will be "搜索"
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for loading invisible
    And I click the "OpenSavedSearchButton" button
    And I wait for loading invisible
    And I wait for "5000" millsecond
    And I click the "OpenSavedSearchList" button
    And I wait for loading invisible
    And I wait for "5000" millsecond
    And I click the star before "{'column':'2','name':'<name>'}" in saved search
    Then I will see the message "更新成功"

    ###3.7版本无删除权限时没有删除按钮
    #Given open the "splSearch.SearchPage" page for uri "/search/"
    #And I wait for loading invisible
    #And I click the "OpenSavedSearchButton" button
    #When the data is "AutoTestCreate" then i click the button "删除" in more menu in the saved search table
    #And I click the "DeleteSavedSearch" button
    #Then I will see the success message "删除失败: 没有相关资源权限"

    Examples:
      | name           |function|
      | AutoTestCreate |加载\n更多    |

  Scenario: 新建AutoTest
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for loading invisible
    And I click the "SavedSearch" button
    And I set the parameter "TaskName" with value "AutoTest"
    And I click the "EnsureCreateSavedSearch" button
    Then I will see the success message "创建成功"

  Scenario Outline: 授权读取+删除+转授
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    Then I click the "{'TabButton':'已存搜索'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "编辑" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "splSearch.SavedSearchPage" page for uri "/savedsearches/"
    And I wait for loading invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "<function>" button
    Then I will see the "Star" is "yotta-icon yotta-icon-StarFilled"
    And the data name is "{'column':'1','name':'<name>'}" then i click the "更多" button
    And I click the "Auth" button
    And I wait for loading invisible
    And I "uncheck" the checkbox which name is "验证授权用户" in tiny table
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Given open the "splSearch.SavedSearchPage" page for uri "/savedsearches/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "加载" button
    And switch to another window
    Then I close all tabs except main tab
    Then the page's title will be "搜索"
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "splSearch.SavedSearchPage" page for uri "/savedsearches/"
    And I wait for loading invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "<function>" button
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for loading invisible
    And I click the "OpenSavedSearchButton" button
    And I wait for loading invisible
    And I click the "OpenSavedSearchList" button
    And I wait for loading invisible
    And I click the star before "{'column':'2','name':'<name>'}" in saved search
    #Then I will see the success message "API: 没有相关资源权限"
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for loading invisible
    And I click the "OpenSavedSearchButton" button
    And I wait for loading invisible
    And I click the "OpenSavedSearchList" button
    And I wait for loading invisible
    When the data is "AutoTestCreate" then i click the button "删除" in more menu in the saved search table
    And I click the "DeleteSavedSearch" button
    Then I will see the message "删除成功"

    Examples:
      | name           |function|
      | AutoTestCreate |加载\n更多    |

  Scenario Outline: 授权所有权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    Then I click the "{'TabButton':'已存搜索'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "splSearch.SavedSearchPage" page for uri "/savedsearches/"
    And I wait for loading invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "<function>" button
    Then I click the star before "<name>" in saved search list
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "更新成功"
    When the data name is "{'column':'1','name':'<name>'}" then i click the "更多" button
    And I click the "Label" button
    And I wait for "TagToInput" will be visible
    And I click the "TagToInput" button
    And I set the parameter "Tag" with value "testTag"
    And I click the "Ensure" button
    Then I will see the success message "更新成功"
    And the data name is "{'column':'1','name':'<name>'}" then i click the "更多" button
    And I click the "Auth" button
    And I wait for loading invisible
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "splSearch.SavedSearchPage" page for uri "/savedsearches/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "加载" button
    And switch to another window
    Then I close all tabs except main tab
    Then the page's title will be "搜索"
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for loading invisible
    And I click the "OpenSavedSearchButton" button
    And I wait for loading invisible
    And I click the "OpenSavedSearchList" button
    And I wait for loading invisible
    And I click the star before "{'column':'2','name':'<name>'}" in saved search
    Then I will see the message "更新成功"
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for loading invisible
    And I click the "OpenSavedSearchButton" button
    And I wait for loading invisible
    And I click the "OpenSavedSearchList" button
    And I wait for loading invisible
  #  And I click the "OpenSavedSearchButton" button
    When the data is "<name>" then i click the button "删除" in more menu in the saved search table
    And I click the "DeleteSavedSearch" button
    Then I will see the message "删除成功"

    Examples:
      | name     |function|
      | AutoTest |加载\n更多    |

  Scenario: 新建
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for loading invisible
    And I click the "SavedSearch" button
    And I set the parameter "TaskName" with value "验证二次授权"
    And I click the "EnsureCreateSavedSearch" button
    Then I will see the success message "创建成功"

  Scenario: 给用户授权所有权限
    Given open the "splSearch.SavedSearchPage" page for uri "/savedsearches/"
    When the data name is "{'column':'1','name':'验证二次授权'}" then i click the "更多" button
    And I click the "Auth" button
    And I "check" the checkbox which name is "AutoTest" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"

  Scenario Outline: 二次授权读取
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "splSearch.SavedSearchPage" page for uri "/savedsearches/"
    And I wait for loading invisible
    And the data name is "{'column':'1','name':'<name>'}" then i click the "更多" button
    And I click the "Auth" button
    And I choose the "<authRole>" from the "AuthDropdown"
    When I "check" the function "<function>" which name is "<authName>" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "splSearch.SavedSearchPage" page for uri "/savedsearches/"
    And I wait for loading invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "<userfunction>" button
    Then I will see the "Star" is "yotta-icon yotta-icon-StarFilled"
    And the data name is "{'column':'1','name':'<name>'}" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "AutoTest" is disabled
    Given open the "splSearch.SavedSearchPage" page for uri "/savedsearches/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "加载" button
    And switch to another window
    Then I close all tabs except main tab
    Then the page's title will be "搜索"
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for loading invisible
    And I click the "OpenSavedSearchButton" button
    And I wait for loading invisible
    And I click the "OpenSavedSearchList" button
    And I wait for loading invisible
    And I click the star before "{'column':'2','name':'<name>'}" in saved search
    Then I will see the success message "API: 没有相关资源权限"
    ####3.7版本无删除权限时没有删除按钮
    #Given open the "splSearch.SearchPage" page for uri "/search/"
    #And I wait for loading invisible
    #And I click the "OpenSavedSearchButton" button
    #When the data is "<name>" then i click the button "删除" in more menu in the saved search table
    #And I click the "DeleteSavedSearch" button
    #Then I will see the success message "删除失败: 没有相关资源权限"

    Examples:
      | authRole | authName | function | name   |userfunction|
      | 用户       | 验证授权用户   | 读取       | 验证二次授权 |加载\n授权        |

  Scenario Outline: 二次授权读取+编辑
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "splSearch.SavedSearchPage" page for uri "/savedsearches/"
    And I wait for loading invisible
    And the data name is "{'column':'1','name':'<name>'}" then i click the "更多" button
    And I click the "Auth" button
    And I choose the "<authRole>" from the "AuthDropdown"
    And I wait for loading invisible
    When I "check" the function "<function>" which name is "<authName>" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "splSearch.SavedSearchPage" page for uri "/savedsearches/"
    And I wait for loading invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "<userfunction>" button
    Then I click the star before "<name>" in saved search list
    Then I will see the success message "更新成功"
    When the data name is "{'column':'1','name':'<name>'}" then i click the "更多" button
    And I click the "Label" button
    And I wait for "TagToInput" will be visible
    And I click the "TagToInput" button
    And I set the parameter "Tag" with value "testTag"
    And I click the "Ensure" button
    Then I will see the success message "更新成功"
    And the data name is "{'column':'1','name':'<name>'}" then i click the "更多" button
    And I click the "Auth" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "AutoTest" is disabled
    And I wait for loading invisible
    Given open the "splSearch.SavedSearchPage" page for uri "/savedsearches/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "加载" button
    And switch to another window
    Then I close all tabs except main tab
    Then the page's title will be "搜索"
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for loading invisible
    And I click the "OpenSavedSearchButton" button
    And I wait for loading invisible
    And I click the "OpenSavedSearchList" button
    And I wait for loading invisible
    And I click the star before "{'column':'2','name':'<name>'}" in saved search
    Then I will see the message "更新成功"
    ###3.7版本无删除权限时没有删除按钮
    #When the data is "<name>" then i click the button "删除" in more menu in the saved search table
    #And I click the "DeleteSavedSearch" button
    #Then I will see the success message "删除失败: 没有相关资源权限"

    Examples:
      | authRole | authName        | function | name   |userfunction|
      | 角色       | __user_验证授权用户__ | 编辑       | 验证二次授权 |加载\n更多        |

  Scenario Outline: 二次授权读取+编辑+删除
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "splSearch.SavedSearchPage" page for uri "/savedsearches/"
    And I wait for loading invisible
    And the data name is "{'column':'1','name':'<name>'}" then i click the "更多" button
    And I click the "Auth" button
    And I choose the "<authRole>" from the "AuthDropdown"
    And I wait for loading invisible
    When I "check" the function "<function>" which name is "<authName>" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "splSearch.SavedSearchPage" page for uri "/savedsearches/"
    And I wait for loading invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "<userfunction>" button
    Then I click the star before "<name>" in saved search list
    Then I will see the success message "更新成功"
    When the data name is "{'column':'1','name':'<name>'}" then i click the "更多" button
    And I click the "Label" button
    And I wait for "TagToInput" will be visible
    And I click the "TagToInput" button
    And I set the parameter "Tag" with value "testTag"
    And I click the "Ensure" button
    Then I will see the success message "更新成功"
    And the data name is "{'column':'1','name':'<name>'}" then i click the "更多" button
    And I click the "Auth" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "AutoTest" is disabled
    Given open the "splSearch.SavedSearchPage" page for uri "/savedsearches/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "加载" button
    And switch to another window
    Then I close all tabs except main tab
    Then the page's title will be "搜索"
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for loading invisible
    And I click the "OpenSavedSearchButton" button
    And I wait for loading invisible
    And I click the "OpenSavedSearchList" button
    And I wait for loading invisible
    And I click the star before "{'column':'2','name':'<name>'}" in saved search
    Then I will see the message "更新成功"
    And I wait for "Message" will be invisible
    When the data is "<name>" then i click the button "删除" in more menu in the saved search table
    And I click the "DeleteSavedSearch" button
    Then I will see the message "删除成功"

    Examples:
      | authRole | authName | function | name   |userfunction|
      | 用户分组     | 验证授权用户分组 | 读取,编辑,删除 | 验证二次授权 |加载\n更多        |