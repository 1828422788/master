@app @appSmoke
Feature: 应用字段提取（RZY-2129）

  Background:
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AutoTestAppWithAllResources" then i click the "打开" button
    And I will see the "app.AppPage" page
    And I click the "Config" button
    Then I will see the "configs.ListPage" page

  Scenario: 新建字段提取
    When I click the "CreateButton" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AutoTest...pWithAllResources"
    Then I will see the "configs.CreatePage" page
    When I set the parameter "Name" with value "AutoTestApp"
    And I set the parameter "Logtype" with value "test"
    Then I choose the "AutoTestRoleWithAllResource" from the "Group"
    And I choose the "XML解析" from the "ParseRule"
    And I alter the element "ExtractSample" class to "yw-extract-sample yw-extract-sample-container"
    And I choose the "raw_message" from the "SourceField"
    And I click the "NextButton" button
    And I click the "SwitchButton" button
    Then I click the "NextButton" button

  Scenario: 禁用字段提取
    When I disabled the data "AutoTestApp"
    And I refresh the website
    Then I will see the element "AutoTestApp" is disabled

  Scenario Outline: 复制字段提取
    When the data name is "<name>" then i click the "复制" button
    And I refresh the website
    Then I will see the search result contains "{'column':'0','name':'<name>(副本)'}"

    Examples:
      | name        |
      | AutoTestApp |

  Scenario: 编辑字段提取
    When the data name is "AutoTestApp(副本)" then i click the "编辑" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AutoTest...pWithAllResources"
    Then I will see the "configs.CreatePage" page
    And I click the "NextButton" button
    And I click the "SwitchButton" button
    Then I click the "NextButton" button
    And I wait for "ConfigDone" will be visible

  Scenario: 字段提取分组
    When the data name is "AutoTestApp(副本)" then i click the "分组" button
    And I cancel selection "AutoTestRoleWithAllResource" from the "Group"
    And I click the "Ensure" button
    And I refresh the website
    Then I will see the search result "{'contains':'no','column':'0','name':'AutoTestApp(副本)'}"

  Scenario: 按分组搜索字段提取
    When I choose the "AutoTestRoleWithAllResource" from the "GroupList"
    And I wait for loading invisible
    Then I will see the search result "{'column':'0','name':'AutoTestApp'}"
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AutoTest...pWithAllResources"

  Scenario: 按名称搜索字段提取
    When I set the parameter "SearchInput" with value "AutoTest"
    And I click the "Search" button
    And I wait for loading invisible
    Then I will see the search result "{'column':'0','name':'AutoTestApp'}"
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AutoTest...pWithAllResources"

  Scenario Outline: 上传字典管理
    When I click the "Dictionary" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AutoTest...pWithAllResources"
    Then I will see the "dictionary.ListPage" page
    When I click the "UploadButton" button
    And I choose the "AutoTestRoleWithAllResource" from the "Group"
    And I upload a file with name "/src/test/resources/testdata/dictionary/<name>"
    And I wait for "FileName" will be visible
    And I click the "UploadFile" button
    And I refresh the website
    Then I will see the search result "{'column':'0','name':'<name>'}"

    Examples:
      | name         |
      | AutoTest.csv |

  Scenario Outline: 删除字典管理
    When I click the "Dictionary" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AutoTest...pWithAllResources"
    Then I will see the "dictionary.ListPage" page
    When the data name is "<name>" then i click the "删除" button
    And I click the "EnsureButton" button
    And I refresh the website
    Then I will see the element "EmptyText" value is "暂无数据"

    Examples:
      | name         |
      | AutoTest.csv |

  Scenario: 删除字段提取
    When the data name is "AutoTestApp" then i click the "删除" button
    And I click the "EnsureButton" button
    Given open the "configs.ListPage" page for uri "/configs/"
    When the data name is "AutoTestApp(副本)" then i click the "删除" button
    And I click the "EnsureButton" button


