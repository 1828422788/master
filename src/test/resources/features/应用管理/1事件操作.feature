@app @appSmoke
Feature: 应用事件操作（RZY-2141）

  Scenario Outline: 新建app
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
    And I click the "AddMenuButton" button under some element
    And I wait for "MenuName" will be visible
    And I set the parameter "MenuName" with value "<menuName>"
    And I set the parameter "Url" with value "<url>"
    And I click the "SaveMenuButton" button
    And I choose the "<menuName>" from the "DefaultPage"
    And I click the "CurrentApp" button
    And I click the "ColorPicker" button
    And I set the parameter "ColorValue" with value "<color>"
    And I click the "CreateButton" button under some element
    And I will see the "app.ListPage" page
    Then I wait for "CreateButton" will be visible

    Examples:
      | name     | menuName | url            | color   |
      | EventApp | 事件操作     | /event/action/ | #68E632 |

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
    And I wait for "1500" millsecond
    And I click the "AddDataset" button
    And I wait for "500" millsecond
    And I set the parameter "SearchInput" with value "AutoTestApp"
    And I wait for "500" millsecond
#    And I click the "SearchIcon" button
    And I drag the scroll bar to the element "ResultDataset"
    And I click the "ResultDataset" button
    And I click the "Ensure" button
    And I click the "NextButton" button under some element
    And I wait for "1500" millsecond
    And I click the "Done" button under some element
    And I wait for "ImportSuccess" will be visible
    And I will see the element "ImportSuccess" name is "添加成功"

    Examples:
      | appName  |
      | EventApp |

  Scenario: 新建事件操作
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When  I click the detail which name is "EventApp"
   # When the data name is "EventApp" then i click the "打开" button in more menu
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "EventApp"
    Then I will see the "event.ListPage" page
    And I wait for "Create" will be visible
    When I click the "Create" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "EventApp"
    Then I will see the "event.CreatePage" page
    And I wait for "2000" millsecond
    And I set the parameter "Name" with value "AutoTestApp"
    And I wait for "500" millsecond
    And I set the parameter "Url" with value "https://www.baidu.com"
    And I wait for "500" millsecond
    And I click the "CreateButton" button
    And I wait for "Message" will be visible
    Then I will see the message "提交事件操作成功"

  Scenario: 编辑事件操作
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When  I click the detail which name is "EventApp"
    #When the data name is "EventApp" then i click the "打开" button in more menu
    And I will see the "app.AppPage" page
    And I wait for "1000" millsecond
    And I will see the element "Title" name is "EventApp"
    Then I will see the "event.ListPage" page
    And I wait for "2000" millsecond
    When the data name is "{'column':'1','name':'AutoTestApp'}" then i click the "编辑" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "EventApp"
    Then I will see the "event.CreatePage" page
    And I set the parameter "Name" with value "AutoApp"
    And I click the "CreateButton" button
    And I wait for "Message" will be visible
    Then I will see the message "提交事件操作成功"

  Scenario Outline: 搜索事件操作
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When  I click the detail which name is "EventApp"
    #When the data name is "EventApp" then i click the "打开" button in more menu
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "EventApp"
    Then I will see the "event.ListPage" page
    And I wait for "2000" millsecond
    Given I set the parameter "SearchInput" with value "<name>"
    And I wait for loading invisible
    Then I will see the search result "{'column':'1','name':'<name>'}"
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "EventApp"

    Examples:
      | name    |
      | AutoApp |

  Scenario Outline: 删除事件操作
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When  I click the detail which name is "EventApp"
    #When the data name is "EventApp" then i click the "打开" button in more menu
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "EventApp"
    Then I will see the "event.ListPage" page
    And I wait for "2000" millsecond
    When the data name is "{'column':'1','name':'<name>'}" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I refresh the website
    And I wait for "800" millsecond
    Then I will see the search result "{'column':'1','name':'<name>','contains':'no'}"
    And I will see the "app.AppPage" page
    Then I will see the element "Title" name is "EventApp"

    Examples:
      | name    |
      | AutoApp |