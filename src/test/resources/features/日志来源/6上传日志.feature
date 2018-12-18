@resourceGroups @all @smoke @resourceGroupsSmoke
Feature: 日志来源上传日志（RZY-366、RZY-367）

  Scenario: 上传日志
    Given open the "sourceGroup.ListPage" page for uri "/sources/input/os/"
    When I set the parameter "Tag" with value "AutoTestTag"
    And I set the parameter "Appname" with value "AutoTestAppname"
    And I upload a file with name "/src/test/resources/testdata/log/test.log"
    And I click the "UploadButton" button
    Then I will see the element "VerifyText" name is "上传完成"

  Scenario: 验证选择非匹配的日志来源是否正确（RZY-367步骤2）
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I click the "ArrowDown" button
    And I click the "AutoTestLogSource" button
    And I click the "Sunxjautotest" button
    And I set the parameter "SearchInput" with value "tag:sample*"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I will see the element "NoResult" name is "查询无结果。"

  Scenario: 在搜索页面验证 日志来源是否正确（RZY-367步骤1、RZY-1655）
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I click the "ArrowDown" button
    And I click the "AutoTestLogSource" button
    And I click the "Sunxjautotest" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I will see the element "AppnameValue" name is "AutoTestAppname"
    Then I will see the element "TagValue" name is "AutoTestTag"
