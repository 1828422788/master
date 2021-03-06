@app
Feature: 应用数据集

  Scenario Outline: 新建数据集应用
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
    And I click the "CreateButton" button
    And I will see the "app.ListPage" page
    Then I wait for "CreateButton" will be visible

    Examples:
      | name       | menuName | url       |
      | DatasetApp | 数据集      | /dataset/ |

  Scenario Outline: 安装资源成功
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for "CreateButton" will be visible
    And I click the "InstallButton" button
    Then I will see the "app.InstallPage" page
    And I wait for loading invisible
    And I wait for "AddDataset" will be visible
    And I choose the "__admin__" from the "Role"
    When I upload a file "Upload" with name "/target/download-files/<appName>.tar"
    And I will see the element "VerifyText" name is "上传完成"
    And I click the "AddDataset" button
    And I set the parameter "SearchInput" with value "AutoTestApp"
    And I wait for "500" millsecond
    And I drag the scroll bar to the element "ResultDataset"
    And I click the "ResultDataset" button
    And I click the "Ensure" button
    And I click the "NextButton" button
    And I wait for "1500" millsecond
    And I click the "Done" button
    And I wait for "ImportSuccess" will be visible
    Then I will see the element "ImportSuccess" name is "添加成功"

    Examples:
      | appName    |
      | DatasetApp |

  Scenario: 新建数据集
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When  I click the detail which name is "DatasetApp"
    And I will see the "app.AppPage" page
    Then I will see the element "Title" name is "DatasetApp"
    Then I will see the "dataset.ListPage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "DatasetApp内新建"
    And I set the parameter "Alias" with value "DatasetApp"
    And I set the parameter "Spl" with value "*"
    And I click the "Save" button
    Then I wait for title change text to "数据集详情"

  Scenario: 编辑数据集
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When  I click the detail which name is "DatasetApp"
    And I will see the "app.AppPage" page
    Then I will see the element "Title" name is "DatasetApp"
    Then I will see the "dataset.ListPage" page
    And I wait for "2000" millsecond
    When the data name is "DatasetApp内新建" then i click the "编辑" button
    And I will see the "app.AppPage" page
    Then I will see the element "Title" name is "DatasetApp"
    Then I will see the "dataset.DetailPage" page
    And I wait for loading invisible
#    When I choose the "编辑根事件" from the "MoreList"
#    And I set the parameter "EditYuJu" with value "tag:heka"
#    And I click the "RootSave" button
#    And I wait for loading invisible
#    And I wait for "3000" millsecond
#    Then I will see the "AfterYuJu" result will be "tag:heka"

  Scenario: 修改标签
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When  I click the detail which name is "DatasetApp"
    And I will see the "app.AppPage" page
    Then I will see the element "Title" name is "DatasetApp"
    Then I will see the "dataset.ListPage" page
    And I wait for "2000" millsecond
    When the data name is "DatasetApp内新建" then i click the "标签" button in more menu
    And I wait for "2000" millsecond
    And I click the Element with text "请选择或输入"
    And I wait for "Tag" will be visible
    And I set the parameter "Tag" with value "AutoApp"
    And I wait for "1500" millsecond
    And I choose the "AutoApp" from the "LastDropdownList"
    And I wait for "500" millsecond
    And I click the "Ensure" button
    Then I will see the success message "修改成功"
#    Then I will see the data "{'column':'1','name':'DatasetApp内新建'}" values "{'column':'2','name':'AutoApp'}"

  Scenario: 新建无标签数据集
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When  I click the detail which name is "DatasetApp"
    And I will see the "app.AppPage" page
    Then I will see the element "Title" name is "DatasetApp"
    Then I will see the "dataset.ListPage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "DatasetApp内新建无标签"
    And I set the parameter "Alias" with value "DatasetAppWithoutTag"
    And I set the parameter "Spl" with value "*"
    And I click the "Save" button
    Then I wait for title change text to "数据集详情"

  Scenario: 根据标签搜索
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When  I click the detail which name is "DatasetApp"
    And I will see the "app.AppPage" page
    Then I will see the element "Title" name is "DatasetApp"
    Then I will see the "dataset.ListPage" page
    And I wait for loading invisible
    When I choose the "AutoApp" from the "ResourceDropdown"
    And I wait for loading invisible
    Then I will see the search result contains "DatasetApp内新建"
    And I wait for "2000" millsecond
    Then I will see the search result "{'column':'0','name':'DatasetApp内新建无标签','contains':'no'}"

  Scenario Outline: 根据名称搜索
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When  I click the detail which name is "DatasetApp"
    And I will see the "app.AppPage" page
    Then I will see the element "Title" name is "DatasetApp"
    Then I will see the "dataset.ListPage" page
    And I wait for loading invisible
    When I set the parameter "TextFilter" with value "<name>"
    And I wait for "2000" millsecond
    And I click the "Search" button
    And I wait for loading invisible
    Then I will see the search result "<name>"

    Examples:
      | name             |
      | DatasetApp内新建无标签 |

  Scenario: 取消所属应用
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When  I click the detail which name is "DatasetApp"
    And I will see the "app.AppPage" page
    Then I will see the element "Title" name is "DatasetApp"
    Then I will see the "dataset.ListPage" page
    And I wait for "2000" millsecond
    When the data name is "DatasetApp内新建无标签" then i click the "编辑" button
    And I will see the "app.AppPage" page
    Then I will see the element "Title" name is "DatasetApp"
    Then I will see the "dataset.DetailPage" page
    And I wait for loading invisible
    When I choose the "编辑根事件" from the "MoreList"
    Then I will see the "dataset.ListPage" page
    And I wait for "BeforeDeleteApp" will be visible
    And I move the mouse pointer to the "BeforeDeleteApp"
    And I click the "DeleteApp" button
    Then I will see the "dataset.DetailPage" page
    And I click the "Save" button
    Then I will see the "dataset.ListPage" page
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "修改成功"

  Scenario: 按照应用搜索
    Given open the "dataset.ListPage" page for uri "/dataset/"
    And I wait for loading invisible
    And I choose the "DatasetApp" from the "AppDropdown"
    And I wait for loading invisible
    Then I will see the search result contains "DatasetApp内新建"
    Then I will see the search result "{'column':'0','name':'DatasetApp内新建无标签','contains':'no'}"

  Scenario Outline: 修改app资源范围
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "编辑" button
    Then I will see the "app.CreatePage" page
    And I wait for loading invisible
    And I click the "OverallSituation" button
    And I wait for "1500" millsecond
    And I click the "SaveButton" button
    Then I wait for "1500" millsecond
    And I will see the message "更新成功"

    Examples:
      | name       |
      | DatasetApp |

  Scenario Outline: 删除数据集
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When  I click the detail which name is "DatasetApp"
    And I will see the "app.AppPage" page
    Then I will see the element "Title" name is "DatasetApp"
    Then I will see the "dataset.ListPage" page
    And I wait for "2000" millsecond
    Given the data name is "<name>" then i click the "删除" button in more menu
    And I wait for "Ensure" will be visible
    When I click the "Ensure" button

    Examples:
      | name             |
      | DatasetApp内新建    |
      | DatasetApp内新建无标签 |