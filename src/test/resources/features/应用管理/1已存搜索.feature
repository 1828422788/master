@all @smoke @app
Feature: 应用已存搜索（RZY-2125）

  Scenario Outline: 新建单个资源app
    Given open the "app.ListPage" page for uri "/app/list/"
    And I click the "CreateButton" button
    Then I will see the "app.CreatePage" page
    Given delete file "/target/download-files/<name>.tar"
    And I set the parameter "NameInput" with value "<name>"
    And I click the "AddResource" button
    And I set the parameter "SearchResourceInput" with value "app所选资源"
    And I wait for "SearchLoading" will be invisible
    And I "check" the checkbox which name is "app所选资源" in tiny table
    And I click the "SaveMenuButton" button
    And I click the "AddMenuButton" button
    And I wait for "MenuName" will be visible
    And I set the parameter "MenuName" with value "<menuName>"
    And I set the parameter "Url" with value "<url>"
    And I click the "SaveMenuButton" button
    And I choose the "<menuName>" from the "DefaultPage"
    And I click the "CurrentApp" button
    And I click the "ColorPicker" button
    And I set the parameter "ColorValue" with value "<color>"
    And I click the "CreateButton" button
    And I will see the "app.ListPage" page
    Then I wait for "CreateButton" will be visible

    Examples:
      | name             | menuName | url             | color   |
      | SavedsearchesApp | 已存搜索     | /savedsearches/ | #FFE6E4 |

  Scenario Outline: 安装资源成功
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for "CreateButton" will be visible
    And I click the "InstallButton" button
    Then I will see the "app.InstallPage" page
    And I wait for "AddDataset" will be visible
    When I upload a file "Upload" with name "/target/download-files/<appName>.tar"
    And I will see the element "VerifyText" name is "上传完成"
    And I wait for "2000" millsecond
    And I choose the "__admin__" from the "Role"
    And I click the "AddDataset" button
    And I set the parameter "SearchInput" with value "AutoTestApp"
    And I wait for "1000" millsecond
    And I drag the scroll bar to the element "ResultDataset"
    And I click the "ResultDataset" button
    And I click the "Ensure" button
    And I click the "NextButton" button
    And I wait for "1500" millsecond
    And I click the "Done" button
    And I wait for "ImportSuccess" will be visible
    And I will see the element "ImportSuccess" name is "添加成功"

    Examples:
      | appName          |
      | SavedsearchesApp |

  Scenario Outline: 验证单个资源的app资源范围是否正确
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When  I click the detail which name is "<name>"
    And I will see the "app.AppPage" page
    And I wait for loading invisible
    And I wait for "EmptyText" will be visible
    And I will see the element "Title" name is "<name>"

    Examples:
      | name             |
      | SavedsearchesApp |

  Scenario: 新建已存搜索
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When  I click the detail which name is "AutoTestAppWithAllResources"
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AutoTestAppWithAllResources"
    Then I will see the "splSearch.SearchPage" page
    When I click the "SavedSearch" button
#    And I click the Element with text "新建"
#    And I choose the "新建" from the "DropdownMenu"
    And I set the parameter "OfflineTaskName" with value "AutoApp"
    And I choose the "SavedsearchesApp" from the "AppDropdown"
    And I click the "EnsureCreateSavedSearch" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "创建成功"

  Scenario: 新建无所属app的已存搜索
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for loading invisible
    When I click the "SavedSearch" button
#    And I choose the "新建" from the "DropdownMenu"
#    And I click the Element with text "新建"
    And I set the parameter "OfflineTaskName" with value "验证无App"
    And I click the "EnsureCreateSavedSearch" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "创建成功"

  Scenario: 按应用搜索已存搜索
    Given open the "splSearch.SavedSearchPage" page for uri "/savedsearches/"
    And I wait for loading invisible
    And I choose the "SavedsearchesApp" from the "AppDropdown"
    And I wait for "2000" millsecond
    Then I will see the search result contains "{'column':'1','name':'AutoApp'}"
    And I wait for "2000" millsecond
    Then I will see the search result "{'column':'1','name':'验证无App','contains':'no'}"

  Scenario: 已存搜索加载
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When  I click the detail which name is "SavedsearchesApp"
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "SavedsearchesApp"
    Then I will see the "splSearch.SavedSearchPage" page
    And I wait for "1500" millsecond
   # And I click the detail which name is "AutoApp" in saved search
    And I set the parameter "TextFilter" with value "AutoApp"
    Given I wait for loading complete
    And I wait for "1000" millsecond
    Given I click the which saved name is "AutoApp" on saved page
    And switch to window "搜索"
    And I close all tabs except main tab
    Then I will see the "splSearch.SearchPage" page
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "SavedsearchesApp"

  Scenario: 已存搜索标签
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When  I click the detail which name is "SavedsearchesApp"
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "SavedsearchesApp"
    Then I will see the "splSearch.SavedSearchPage" page
    And I wait for "2000" millsecond
    When the data name is "{'column':'1','name':'AutoApp'}" then i click the "标签" button in more menu
    And I click the Element with text "请选择或输入"
    And I wait for "Tag" will be visible
    And I set the parameter "Tag" with value "testTag"
    And I choose the "testTag" from the "TagDropdown"
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "更新成功"

  #Scenario: 根据标签搜索  4.0去掉了该功能
   # Given open the "app.ListPage" page for uri "/app/list/"
   # And I wait for loading invisible
   # When  I click the detail which name is "SavedsearchesApp"
   # And I will see the "app.AppPage" page
   # And I will see the element "Title" name is "SavedsearchesApp"
   # Then I will see the "splSearch.SavedSearchPage" page
   # And I wait for loading invisible
   # And I choose the "testTag" from the "ResourceDropdown"
   # And I wait for loading invisible
   # Then I will see the search result contains "{'column':'1','name':'AutoApp'}"

  Scenario Outline: 修改app资源范围
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "编辑" button
    Then I will see the "app.CreatePage" page
    And I wait for loading invisible
    And I click the "OverallSituation" button
    And I click the "SaveButton" button
    And I wait for "Message" will be visible in "8000" milliseconds

    Examples:
      | name             |
      | SavedsearchesApp |

  Scenario Outline: 已存搜索删除
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When  I click the detail which name is "SavedsearchesApp"
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "SavedsearchesApp"
    Then I will see the "splSearch.SavedSearchPage" page
    And I wait for "2000" millsecond
    And I set the parameter "TextFilter" with value "<name>"
    Given I wait for loading complete
    And I wait for "1000" millsecond
    When the data name is "{'column':'1','name':'<name>'}" then i click the "删除" button in more menu
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "删除成功"

    Examples:
      | name    |
      | 验证无App  |
#      | AutoApp |
