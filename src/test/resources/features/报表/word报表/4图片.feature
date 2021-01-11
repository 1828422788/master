@reportTextEditor
Feature:报表_富文本编辑_图片

  Background:
    Given open the "report.ListPage" page for uri "/reports/"
    And I click the "NewReportButton" button under some element
    Then I will see the "report.CreatePage" page
    And I wait for element "SelectedUser" change text to username
    And I set the parameter "Describe" with value "AutoCreate"
    And I set the parameters "Hour" and "Minute" as "5" minutes later from now
    And I choose the "WORD" from the "ReportType"

  Scenario: image
    When I set the parameter "Name" with value "Image"
    And I click the "NextButton" button under some element
    Then I wait for "ChartListButtonWord" will be visible
    And I wait for "5000" millsecond

    When I upload a file "UploadImage" with name "/src/test/resources/testdata/image/smallRobbot.png"
    And I wait for "2000" millsecond
    And I wait for "ImageElement" will be visible

    And I set the parameter "ChartListInput" with value "报表测试"
    And I click the button with text "报表测试"
    And I wait for "2000" millsecond
    When I click the "FinishButton" button under some element
    And I wait for "EnsureButton" will be visible
    Then I will see the success message "保存成功"
    And I click the "EnsureButton" button

  Scenario: image_20kb
    When I set the parameter "Name" with value "Image"
    And I click the "NextButton" button under some element
    Then I wait for "ChartListButtonWord" will be visible
    And I wait for "5000" millsecond

    When I upload a file "UploadImage" with name "/src/test/resources/testdata/image/pikachu.jpeg"
    And I wait for "EnsureButton" will be visible
    Then I will see the message "内嵌图片最大支持20kb"
