Feature: 字典管理上传文件

  Background:
    Given open the "dictionary.ListPage" page for uri "/dictionary/"

  Scenario Outline: 上传字典管理文件
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
