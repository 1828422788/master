@app @appSmoke
Feature: 应用字段提取（RZY-2129）

  Background:
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "ConfigsApp" then i click the "打开" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "ConfigsApp"
    Then I will see the "configs.ListPage" page

  Scenario: 新建字段提取
    When I click the "Create" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "ConfigsApp"
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "test"
    And I click the "AddRule" button
    And I choose the "XML解析" from the "ParseRule"
    And I choose the "raw_message" from the "SourceField"
    And I click the "EnsureAddParseRule" button
    And I click the "NextButton" button under some element
    When I set the parameter "Name" with value "AutoTest"
    And I set the parameter "Logtype" with value "other"
    And I set the parameter "AppName" with value "auto_test_csv"
    And I set the parameter "Tag" with value "auto_test_csv"
    And I click the "NextButton" button
    Then I wait for "ConfigDone" will be visible
    And I click the "Return" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "ConfigsApp"

  Scenario Outline: 复制字段提取
    When the data name is "{'column':'1','name':'<name>'}" then i click the "复制" button
    And I refresh the website
    And I wait for loading invisible
    Then I will see the search result contains "{'column':'1','name':'<name>(副本)'}"
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "ConfigsApp"

    Examples:
      | name     |
      | AutoTest |

  Scenario: 编辑字段提取
    When the data name is "{'column':'1','name':'AutoTest(副本)'}" then i click the "编辑" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "ConfigsApp"
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "test"
    And I click the "NextButton" button
    And I click the "SwitchButton" button
    Then I click the "NextButton" button
    And I wait for "ConfigDone" will be visible

  Scenario Outline: 上传字典管理
    When I click the "Dictionary" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "ConfigsApp"
    Then I will see the "dictionary.ListPage" page
    When I click the "UploadButton" button
    And I set the parameter "GroupInput" with value "字典分组AutoTest"
    And I choose the "字典分组AutoTest" from the "Group"
    And I upload a file with name "/src/test/resources/testdata/dictionary/<name>"
    And I wait for "FileName" will be visible
    And I click the "EnsureUpload" button
    Then I will see the success message "创建字典成功"

    Examples:
      | name         |
      | AutoTest.csv |

  Scenario Outline: 删除字典管理
    When I click the "Dictionary" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "ConfigsApp"
    Then I will see the "dictionary.ListPage" page
    When the data name is "<name>" then i click the "删除" button
    And I click the "EnsureButton" button
    And I refresh the website
    Then I will see the element "EmptyText" value is "暂无数据"

    Examples:
      | name         |
      | AutoTest.csv |

  Scenario Outline: 删除字段提取
    When the data name is "{'column':'1','name':'<name>'}" then i click the "删除" button
    And I click the "Ensure" button
    Then I will see the success message "删除成功"

    Examples:
      | name         |
      | AutoTest(副本) |
      | AutoTest     |


