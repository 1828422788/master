@fulllink_upload
Feature: 全链路_上传日志

  Scenario Outline: upload_logs
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "json"
    And I set the parameter "Tag" with value "<tag>"
    And I upload a file with name "/src/test/resources/testdata/log/fulllink/<log>.txt"
    And I click the "UploadButton" button
    And I wait for "15000" millsecond
    And I wait for "VerifyText" will be visible
    And I will see the element "VerifyText" contains "上传完成"
    And I wait for "2000" millsecond

    Examples:
      |    tag          | log         |
      | fulllink_test_1 | fulllink_1  |
      | fulllink_test_2 | fulllink_2  |
      | fulllink_test_3 | fulllink_3  |