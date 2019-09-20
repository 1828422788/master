Feature: 字典管理

  @configsSmoke
  Scenario: 新建字典分组
    Given open the "resourceGroups.ListPage" page for uri "/account/resourcegroups/"
    And I click the "CreateResourceGroup" button
    Then I will see the "resourceGroups.CreatePage" page
    When I set the parameter "ResourceGroupName" with value "字典分组AutoTest"
    And I choose the "字典" from the "ResourceGroupType"
    And I choose the "admin" from the "ResourceGroupOwner"
    And I click the "CreateButton" button
    Then I will see the success message "创建成功"

  @configsSmoke
  Scenario: 更新字典分组
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    When the data name is "AutoTest.csv" then i click the "编辑" button
    And I choose the "字典分组AutoTest" from the "Group"
    And I upload a file with name "/src/test/resources/testdata/dictionary/AutoTest.csv"
    And I click the "Update" button
    Then I will see the success message "上传成功"

  @configsSmoke
  Scenario: 搜索字典管理
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    Given search "{'group':'字典分组AutoTest'}" and I will see the column number "1" contains "AutoTest.csv"
    And I search the group "未分组"
    And I wait for loading invisible
    Then I will see the search result "{'column':'0','name':'AutoTest.csv','contains':'no'}"

  @cleanConfigs
  Scenario Outline: 删除字典管理
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    When the data name is "<name>" then i click the "删除" button
    And I click the "EnsureButton" button

    Examples:
      | name         |
      | AutoTest.csv |

  @cleanConfigs
  Scenario Outline: 删除字典分组
    Given open the "resourceGroups.ListPage" page for uri "/account/resourcegroups/"
    And I wait for loading invisible
    Given I set the search input with "<name>"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "删除" button
    And I click the "MessageBoxOKButton" button
    Then I will see the success message "删除成功"

    Examples:
      | name         |
      | 字典分组AutoTest |