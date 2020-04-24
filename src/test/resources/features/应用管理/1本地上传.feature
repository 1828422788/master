@app @appSmoke
Feature: 应用本地上传日志（RZY-2148）

  Background:
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AutoTestAppWithAllResources" then i click the "打开" button
    And I will see the "app.AppPage" page

  Scenario: 上传日志
    When I click the "Upload" button
    And I will see the "app.AppPage" page
    And I will see the element "OldTitle" name is "AutoTest...pWithAllResources"
    Then I will see the "localUpload.ListPage" page
    When I set the parameter "AppName" with value "AutoAppAppname"
    And I set the parameter "Tag" with value "AutoAppTag"
    And I upload a file with name "/src/test/resources/testdata/log/rename.log"
    And I click the "UploadButton" button
    Then I will see the element "VerifyText" name is "上传完成"
