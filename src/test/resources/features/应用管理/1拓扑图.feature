@app @appSmoke
Feature: 应用拓扑图（RZY-2142）

  Scenario: 新建拓扑图
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "TopologyApp" then i click the "打开" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "TopologyApp"
    Then I will see the "topology.ListPage" page
    When I click the "Create" button
    And I set the parameter "NameInput" with value "AutoTestApp"
    And I click the "Ensure" button
    Then I will see the success message "创建成功"
    And I will see the "app.AppPage" page
    Then I will see the element "Title" name is "TopologyApp"

  Scenario: 拓扑图重命名
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "TopologyApp" then i click the "打开" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "TopologyApp"
    Then I will see the "topology.ListPage" page
    When the data name is "AutoTestApp" then i click the "重命名" button
    Then I set the parameter "NameInput" with value "AutoApp"
    Then I click the "Ensure" button
    Then I will see the success message "修改成功"
    And I will see the "app.AppPage" page
    Then I will see the element "Title" name is "TopologyApp"

  Scenario: 拓扑图标签
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "TopologyApp" then i click the "打开" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "TopologyApp"
    Then I will see the "topology.ListPage" page
    When the data name is "AutoApp" then i click the "标签" button
    And I wait for "Tag" will be visible
    And I set the parameter "Tag" with value "测试标签"
    And I choose the "测试标签" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"
    And I will see the "app.AppPage" page
    Then I will see the element "Title" name is "TopologyApp"

  Scenario Outline: 根据标签搜索（RZY-355）
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "TopologyApp" then i click the "打开" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "TopologyApp"
    Then I will see the "topology.ListPage" page
    Given I wait for loading invisible
    Given I choose the "测试标签" from the "ResourceDropdown"
    And I wait for loading invisible
    Then I will see the search result contains "<name>"

    Examples:
      | name    |
      | AutoApp |

  Scenario Outline: 根据输入内容搜索（RZY-354）
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "TopologyApp" then i click the "打开" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "TopologyApp"
    Then I will see the "topology.ListPage" page
    Given I set the parameter "SearchInput" with value "<name>"
    And I click the "Search" button
    And I wait for loading invisible
    Then I will see the search result "{'column':'0','name':'<name>'}"

    Examples:
      | name    |
      | AutoApp |

  Scenario: 拓扑图详情
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "TopologyApp" then i click the "打开" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "TopologyApp"
    Then I will see the "topology.ListPage" page
    And I click the detail which name is "AutoApp"
    Then the page's title will be "拓扑图详情"

  Scenario: 在app外搜索
    Given open the "topology.ListPage" page for uri "/topology/"
    And I wait for loading invisible
    And I choose the "AutoApp" from the "AppDropdown"
    Then I will see the search result contains "AutoApp"

  Scenario: 删除拓扑图
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "TopologyApp" then i click the "打开" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "TopologyApp"
    Then I will see the "topology.ListPage" page
    When the data name is "AutoApp" then i click the "删除" button
    And I click the "Ensure" button
    Then I will see the success message "删除成功"
