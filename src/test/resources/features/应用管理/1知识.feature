@all @smoke @app @appSmoke
Feature: 应用知识

  Scenario Outline: 新建单个资源app
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
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
      | name         | menuName | url         | color   |
      | KnowledgeApp | 知识       | /knowledge/ | #FF6C5C |

  Scenario Outline: 安装资源成功
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for "CreateButton" will be visible
    And I click the "InstallButton" button
    Then I will see the "app.InstallPage" page
    And I wait for "AddDataset" will be visible
    When I upload a file "Upload" with name "/target/download-files/<appName>.tar"
    And I will see the element "VerifyText" name is "上传完成"
    And I choose the "__admin__" from the "Role"
    And I click the "AddDataset" button
    And I set the parameter "SearchInput" with value "AutoTestApp"
#    And I click the "SearchIcon" button
    And I wait for "500" millsecond
    And I drag the scroll bar to the element "ResultDataset"
    And I click the "ResultDataset" button
    And I click the "Ensure" button
    And I click the "NextButton" button under some element
    And I wait for "1500" millsecond
    And I click the "Done" button under some element
    And I wait for "ImportSuccess" will be visible
    And I will see the element "ImportSuccess" name is "添加成功"

    Examples:
      | appName      |
      | KnowledgeApp |

  Scenario Outline: 验证单个资源的app资源范围是否正确
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "打开" button in more menu
    And I will see the "app.AppPage" page
    And I wait for loading invisible
    And I wait for "EmptyText" will be visible
    And I will see the element "Title" name is "<name>"

    Examples:
      | name         |
      | KnowledgeApp |

  Scenario: 新增知识并验证是否跳转到外部
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "KnowledgeApp" then i click the "打开" button in more menu
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "KnowledgeApp"
    Then I will see the "knowledge.ListPage" page
    And I click the "Create" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "KnowledgeApp"
    Then I will see the "knowledge.CreatePage" page
    And I click the "Next" button
    And I wait for "1000" millsecond
    And I click the "Next" button
    And I wait for "1000" millsecond
    And I set the parameter "EventCode" with value "知识app"
    And I click the "Done" button
    Then I will see the element "SuccessAdd" name is "新建成功"

  Scenario: 知识编辑
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "KnowledgeApp" then i click the "打开" button in more menu
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "KnowledgeApp"
    Then I will see the "knowledge.ListPage" page
    When the data name is "知识app" then i click the "编辑" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "KnowledgeApp"
    Then I will see the "knowledge.CreatePage" page
    And I click the "Next" button
    And I wait for "1000" millsecond
    And I click the "Next" button
    And I wait for "1000" millsecond
    And I set the parameter "EventCode" with value "知识app修改名称"
    And I click the "Done" button
    Then I will see the element "SuccessAdd" name is "编辑成功"

  Scenario Outline: 全文搜索
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "KnowledgeApp" then i click the "打开" button in more menu
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "KnowledgeApp"
    Then I will see the "knowledge.ListPage" page
    When I set the parameter "SearchInput" with value "<search>"
    And I click the "SearchAll" button
    And I wait for "SearchCount" will be visible
    And I will see the "app.AppPage" page
    And I wait for "2000" millsecond
    And I will see the element "Title" name is "KnowledgeApp"

    Examples:
      | search |
      | 知识app  |

  Scenario: 修改标签
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "KnowledgeApp" then i click the "打开" button in more menu
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "KnowledgeApp"
    Then I will see the "knowledge.ListPage" page
    When the data name is "知识app" then i click the "标签" button in more menu
    And I wait for "AutoTag" will be visible
    And I click the Element with text "请选择或输入"
    And I wait for "Tag" will be visible
    And I set the parameter "Tag" with value "AutoTag"
    And I choose the "AutoTag" from the "TagDropdown"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "修改成功"

  Scenario: 标签搜索
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "KnowledgeApp" then i click the "打开" button in more menu
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "KnowledgeApp"
    Then I will see the "knowledge.ListPage" page
    Given I wait for loading invisible
    When I choose the "AutoTag" from the "ResourceDropdown"
    And I wait for loading invisible
    Then I will see the search result "知识app"

  Scenario: 新建无所属应用知识
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I wait for loading invisible
    And I click the "Create" button
    Then I will see the "knowledge.CreatePage" page
    And I wait for "RichEditor" will be visible
    And I set the parameter "RichEditor" with value "若该知识没被删除，则证明app全局资源有问题"
    And I click the "Next" button
    And I wait for "1000" millsecond
    And I click the "Next" button
    And I wait for "1000" millsecond
    When I set the parameter "EventCode" with value "测试无应用"
    And I click the "Done" button
    Then I will see the element "SuccessAdd" name is "新建成功"

  Scenario: 按照应用搜索
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I wait for loading invisible
    And I choose the "KnowledgeApp" from the "AppDropdown"
    And I wait for loading invisible
    Then I will see the search result contains "知识app"
    Then I will see the search result "{'column':'0','name':'测试无应用','contains':'no'}"

  Scenario Outline: 修改app资源范围
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "编辑" button
    Then I will see the "app.CreatePage" page
    And I wait for loading invisible
    And I click the "OverallSituation" button
    And I click the "SaveButton" button

    Examples:
      | name         |
      | KnowledgeApp |

  Scenario Outline: 删除知识
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "KnowledgeApp" then i click the "打开" button in more menu
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "KnowledgeApp"
    Then I will see the "knowledge.ListPage" page
    And I wait for loading invisible
    Given the data name is "{'column':'0','name':'<Name>'}" then i click the "删除" button in more menu
    And I wait for "Ensure" will be visible
    When I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "删除知识成功"

    Examples:
      | Name  |
      | 测试无应用 |
      | 知识app |