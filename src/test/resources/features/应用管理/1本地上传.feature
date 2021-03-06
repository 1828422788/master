@app @appSmoke
Feature: 应用本地上传日志（RZY-2148）

  Background:
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When  I click the detail which name is "AutoTestAppWithAllResources"
    And I will see the "app.AppPage" page

  Scenario: 上传日志
    When I click the "Upload" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AutoTestAppWithAllResources"
    Then I will see the "localUpload.ListPage" page
    When I set the parameter "AppName" with value "AutoAppAppname"
    And I wait for "Tag" will be visible
    And I set the parameter "Tag" with value "AutoAppTag"
    And I upload a file with name "/src/test/resources/testdata/log/rename.log"
    And I click the "UploadButton" button
    And I wait for "VerifyText" will be visible
    Then I wait for element "VerifyText" change text to "上传完成"
