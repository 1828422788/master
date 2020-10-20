@app @appSmoke
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
    And I click the "AddMenuButton" button under some element
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
    And I wait for "AddDataset" will be visible
    And I choose the "__admin__" from the "Role"
    When I upload a file "Upload" with name "/target/download-files/<appName>.tar"
    And I will see the element "VerifyText" name is "上传完成"
    And I click the "AddDataset" button
    And I set the parameter "SearchInput" with value "AutoTestApp"
    And I click the "SearchIcon" button
    And I drag the scroll bar to the element "ResultDataset"
    And I click the "ResultDataset" button
    And I click the "Ensure" button
    And I click the "NextButton" button under some element
    And I click the "NextButton" button
    And I wait for "ImportSuccess" will be visible
    Then I will see the element "ImportSuccess" name is "添加成功"

    Examples:
      | appName    |
      | DatasetApp |

  Scenario: 新建数据集
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "DatasetApp" then i click the "打开" button
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
    When the data name is "DatasetApp" then i click the "打开" button
    And I will see the "app.AppPage" page
    Then I will see the element "Title" name is "DatasetApp"
    Then I will see the "dataset.ListPage" page
    When the data name is "DatasetApp内新建" then i click the "编辑" button
    And I will see the "app.AppPage" page
    Then I will see the element "Title" name is "DatasetApp"
    Then I will see the "dataset.DetailPage" page
    And I wait for loading invisible
    When I click the "EditEvent" button
    And I set the parameter "EditYuJu" with value "tag:heka"
    And I click the "RootSave" button
    And I wait for loading invisible
    Then I will see the "AfterYuJu" result will be "tag:heka"

  Scenario: 修改标签
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "DatasetApp" then i click the "打开" button
    And I will see the "app.AppPage" page
    Then I will see the element "Title" name is "DatasetApp"
    Then I will see the "dataset.ListPage" page
    When the data name is "DatasetApp内新建" then i click the "标签" button
    And I wait for "Tag" will be visible
    And I set the parameter "Tag" with value "AutoApp"
    And I choose the "AutoApp" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"
    Then I will see the data "{'column':'0','name':'DatasetApp内新建'}" values "{'column':'6','name':'AutoApp'}"

  Scenario: 新建无标签数据集
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "DatasetApp" then i click the "打开" button
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
    When the data name is "DatasetApp" then i click the "打开" button
    And I will see the "app.AppPage" page
    Then I will see the element "Title" name is "DatasetApp"
    Then I will see the "dataset.ListPage" page
    And I wait for loading invisible
    When I choose the "AutoApp" from the "ResourceDropdown"
    And I wait for loading invisible
    Then I will see the search result contains "DatasetApp内新建"
    Then I will see the search result "{'column':'0','name':'DatasetApp内新建无标签','contains':'no'}"

  Scenario Outline: 根据名称搜索
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "DatasetApp" then i click the "打开" button
    And I will see the "app.AppPage" page
    Then I will see the element "Title" name is "DatasetApp"
    Then I will see the "dataset.ListPage" page
    And I wait for loading invisible
    When I set the parameter "SearchInput" with value "<name>"
    And I click the "Search" button
    And I wait for loading invisible
    Then I will see the search result "<name>"

    Examples:
      | name             |
      | DatasetApp内新建无标签 |

  Scenario: 取消所属应用
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "DatasetApp" then i click the "打开" button
    And I will see the "app.AppPage" page
    Then I will see the element "Title" name is "DatasetApp"
    Then I will see the "dataset.ListPage" page
    When the data name is "DatasetApp内新建无标签" then i click the "编辑" button
    And I will see the "app.AppPage" page
    Then I will see the element "Title" name is "DatasetApp"
    Then I will see the "dataset.DetailPage" page
    And I wait for loading invisible
    When I click the "EditEvent" button
    Then I will see the "dataset.ListPage" page
    And I move the mouse pointer to the "DeleteApp"
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
    When the data name is "<name>" then i click the "编辑" button
    Then I will see the "app.CreatePage" page
    And I wait for loading invisible
    And I click the "OverallSituation" button
    And I click the "SaveButton" button

    Examples:
      | name       |
      | DatasetApp |

  Scenario Outline: 删除数据集
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "DatasetApp" then i click the "打开" button
    And I will see the "app.AppPage" page
    Then I will see the element "Title" name is "DatasetApp"
    Then I will see the "dataset.ListPage" page
    Given the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    When I click the "Ensure" button

    Examples:
      | name             |
      | DatasetApp内新建    |
      | DatasetApp内新建无标签 |