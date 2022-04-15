@reportTextEditor @report
Feature:报表_富文本编辑_6_分割线

  Background:
    Given open the "report.ListPage" page for uri "/reports/"
    And I click the "NewReportButton" button
    Then I will see the "report.CreatePage" page
    And I wait for element "SelectedUser" change text to username
    And I set the parameter "Describe" with value "AutoCreate"
    And I set the parameters "Hour" and "Minute" as "3" minutes later from now
    And I choose the "WORD" from the "ReportType"

  @reportSmoke
  Scenario: 添加分割线
    When I set the parameter "Name" with value "DividingLine"
    And I click the "NextButton" button
    And I will see the "report.CreatePageWORD" page

    And I wait for "TextArea" will be visible
    And I set the parameter "TextArea" with value "DIVIDING LINE 分线: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi quis aliquet nisl. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras tempor nisi urna, sed pulvinar sem molestie in. Fusce scelerisque eleifend accumsan. Phasellus laoreet ligula id orci congue rhoncus non rutrum quam. Donec hendrerit faucibus consequat. Etiam tellus tortor, ultrices et tellus eget, sollicitudin scelerisque risus. Integer mattis velit et nunc sollicitudin, non tempus lorem hendrerit. textclick"
    And I click the element "DividingLine" in word report
    And I wait for "DividingLineElement" will be visible
    And I choose the "报表测试" from the "ChartList"
    When I click the "FinishButton" button
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "新建成功"