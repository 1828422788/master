Feature: 字典管理

  @configsSmoke
  Scenario: 更新字典分组
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    When the data name is "AutoTest.csv" then i click the "编辑" button
    And I set the parameter "GroupInput" with value "字典分组AutoTest"
    And I choose the "字典分组AutoTest" from the "Group"
    And I upload a file with name "/src/test/resources/testdata/dictionary/AutoTest.csv"
    And I wait for "FileName" will be visible
    And I click the "EnsureUpload" button
    Then I will see the success message "更新字典内容成功"

  @configsSmoke
  Scenario: 按照分组搜索字典管理
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    And I wait for loading invisible
    And I choose the "字典分组AutoTest" from the "ResourceDropdown"
    And I wait for loading invisible
    Then I will see the search result contains "{'column':'0','name':'AutoTest.csv'}"

  @configsSmoke
  Scenario: 按照名称搜索字典管理
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "AutoTest.csv"
    And I wait for loading invisible
    Then I will see the search result "{'column':'0','name':'AutoTest.csv'}"

  @configsSmoke
  Scenario Outline: 删除字典管理
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    When the data name is "<name>" then i click the "删除" button
    And I click the "EnsureButton" button

    Examples:
      | name         |
      | AutoTest.csv |