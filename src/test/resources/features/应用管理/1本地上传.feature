@app @appSmoke
Feature: 应用本地上传日志（RZY-2148）

  Background:
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AutoTestAppWithAllResources" then i click the "打开" button
    And I will see the "app.AppPage" page

  Scenario: 上传日志
    When I click the "Upload" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AutoTest...pWithAllResources"
    Then I will see the "sourceGroup.ListPage" page
    When I set the parameter "Appname" with value "AutoAppAppname"
    And I set the parameter "Tag" with value "AutoAppTag"
    And I upload a file with name "/src/test/resources/testdata/log/rename.log"
    And I click the "UploadButton" button
    Then I will see the element "VerifyText" name is "上传完成"

  Scenario: 搜索上传日志
    When I click the "Search" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AutoTest...pWithAllResources"
    And I will see the "splSearch.SearchPage" page
    When I set the parameter "SearchInput" with value "tag:AutoAppTag"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then take a screenshot with name "RZY-2148:App本地上传"
