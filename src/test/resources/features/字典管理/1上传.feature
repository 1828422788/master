@configsSmoke
Feature: 字典管理上传文件

  Scenario Outline: 上传字典管理文件
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    When I click the "UploadButton" button
    And I choose the "default_Dictionary" from the "Group"
    And I upload a file with name "/src/test/resources/testdata/dictionary/<name>"
    And I wait for "FileName" will be visible
    And I click the "UploadFile" button
    And I refresh the website
    Then I will see the search result contains "{'column':'0','name':'<name>'}"

    Examples:
      | name         |
      | AutoTest.csv |

  Scenario: 新建字典分组
    Given open the "resourceGroups.ListPage" page for uri "/account/resourcegroups/"
    And I click the "CreateResourceGroup" button
    Then I will see the "resourceGroups.CreatePage" page
    When I set the parameter "ResourceGroupName" with value "字典分组AutoTest"
    And I choose the "字典" from the "ResourceGroupType"
    And I choose the "admin" from the "ResourceGroupOwner"
    And I click the "CreateButton" button
    Then I will see the success message "创建成功"

  Scenario: 更新字典分组
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    When the data name is "AutoTest.csv" then i click the "编辑" button
    And I choose the "字典分组AutoTest" from the "Group"
    And I upload a file with name "/src/test/resources/testdata/dictionary/AutoTest.csv"
    And I click the "Update" button
    Then I will see the success message "上传成功"