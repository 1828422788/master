@app
Feature: 应用拓扑图（RZY-2142）

  @appSmoke
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
      | name        | menuName | url        | color   |
      | TopologyApp | 拓扑图      | /topology/ | #06030B |

  @appSmoke
  Scenario Outline: 安装资源成功
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for "CreateButton" will be visible
    And I click the "InstallButton" button
    Then I will see the "app.InstallPage" page
    And I wait for "AddDataset" will be visible
    When I upload a file "Upload" with name "/target/download-files/<appName>.tar"
    And I wait for "800" millsecond
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
      | appName     |
      | TopologyApp |

  Scenario Outline: 验证资源正确
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When  I click the detail which name is "<name>"
    And I will see the "app.AppPage" page
    And I wait for loading invisible
    #Then I will see the search result "app所选资源"
    And I will see the element "Title" name is "<name>"

    Examples:
      | name        |
      | TopologyApp |

  @appSmoke
  Scenario: 新建拓扑图
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When  I click the detail which name is "TopologyApp"
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "TopologyApp"
    Then I will see the "topology.ListPage" page
    When I click the "Create" button
    And I choose the "TopologyApp" from the "BelongApp"
    And I wait for "1500" millsecond
#    And I set the parameter "TagInput" with value "AutoTest"
    And I choose the "AutoTest" from the "ResourceTag"
    And I wait for "1500" millsecond
    And I set the parameter "NameInput" with value "AutoTestApp"
    And I wait for "500" millsecond
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "创建成功"
    And I will see the "app.AppPage" page
    Then I will see the element "Title" name is "TopologyApp"

  Scenario: 拓扑图重命名
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When  I click the detail which name is "TopologyApp"
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "TopologyApp"
    Then I will see the "topology.ListPage" page
    When the data name is "AutoTestApp" then i click the "重命名" button in more menu
    Then I set the parameter "NameInput" with value "AutoApp"
    Then I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "修改成功"
    And I will see the "app.AppPage" page
    Then I will see the element "Title" name is "TopologyApp"

  Scenario: 新建无标签拓扑图
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When  I click the detail which name is "TopologyApp"
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "TopologyApp"
    Then I will see the "topology.ListPage" page
    When I click the "Create" button
    And I set the parameter "NameInput" with value "无标签"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "创建成功"

  Scenario Outline: 根据标签搜索（RZY-355）
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When  I click the detail which name is "TopologyApp"
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "TopologyApp"
    Then I will see the "topology.ListPage" page
    Given I wait for loading invisible
    Given I choose the "AutoTest" from the "ResourceDropdown"
    And I wait for loading invisible
    Then I will see the search result contains "<name>"
    Then I will see the search result "{'column':'0','name':'无标签','contains':'no'}"

    Examples:
      | name    |
      | AutoApp |

  Scenario Outline: 根据输入内容搜索（RZY-354）
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When  I click the detail which name is "TopologyApp"
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "TopologyApp"
    Then I will see the "topology.ListPage" page
    Given I set the parameter "SearchInput" with value "<name>"
    And I wait for "2000" millsecond
    And I click the "Search" button
    And I wait for "2000" millsecond
    Then I will see the search result "{'column':'0','name':'<name>'}"
    Then I will see the search result "{'column':'0','name':'无标签','contains':'no'}"

    Examples:
      | name    |
      | AutoApp |

  Scenario: 拓扑图详情
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When  I click the detail which name is "TopologyApp"
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "TopologyApp"
    Then I will see the "topology.ListPage" page
    And I wait for loading invisible
    And I click the detail which name is "AutoApp"
    And I will see the "app.AppPage" page
    And I wait for loading invisible
    Then I will see the url contains "app"
    Then the page's title will be "AutoApp"
    And open the "topology.ListPage" page for uri "/topology/"

  Scenario: 新建无所属应用的拓扑图
    And open the "topology.ListPage" page for uri "/topology/"
    And I wait for loading invisible
    And I click the "Create" button
    And I set the parameter "NameInput" with value "无app"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "创建成功"

  Scenario: 在app外搜索
    Given open the "topology.ListPage" page for uri "/topology/"
    And I wait for loading invisible
    And I choose the "TopologyApp" from the "AppDropdown"
    And I wait for loading invisible
    Then I will see the search result contains "AutoApp"
    Then I will see the search result "{'column':'0','name':'无app','contains':'no'}"

  Scenario Outline: 修改app资源范围
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "<name>" then i click the "编辑" button
    Then I will see the "app.CreatePage" page
    And I wait for loading invisible
    And I click the "OverallSituation" button
    And I wait for "1500" millsecond
    And I click the "SaveButton" button
    Then I wait for "1500" millsecond
    And I will see the message "更新成功"

    Examples:
      | name        |
      | TopologyApp |

  Scenario Outline: 删除拓扑图
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When  I click the detail which name is "TopologyApp"
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "TopologyApp"
    Then I will see the "topology.ListPage" page
    And I wait for loading invisible
    When the data name is "<name>" then i click the "删除" button in more menu
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "删除成功"

    Examples:
      | name    |
      | 无app    |
      | 无标签     |
      | AutoApp |
