@reportSend
Feature: 报表_发送

  Background:
    Given open the "report.ListPage" page for uri "/reports/"
    And I wait for loading invisible

  @reportSendEditorWORD
  Scenario Outline: send_word
    When I set the parameter "SearchInput" with value "<name>"
    And I wait for loading invisible
    And the data name is "{'column':'1','name':'<name>'}" then i click the "编辑" button
    Then I will see the "report.CreatePage" page
    And I wait for element "SelectedUser" change text to username
    And I set the parameters "Hour" and "Minute" as "3" minutes later from now
    And I choose the "ekaterina.kiseleva@yottabyte.cn" from the "EmailInput"
    And I set the parameter "Subject" with value " 报表名称：<%report_name%>，发送时间：<%report_time%>"
    And I click the "NextButton" button
    And I wait for "5000" millsecond
    When I click the "FinishButton" button
    Then I will see the success message "保存成功"
    And I click the "EnsureButton" button

    Examples:
      |          name                 |
      | SingleTrend                   |
      | SingleTrend_Table             |
      | SingleTrend_HF                |
      | FontSize                      |
      | BoldText                      |
      | ItalicsText                   |
      | UnderlinedText                |
      | RightAlignment                |
      | LeftAlignment                 |
      | CenterAlignment               |
      | JustifyAlignment              |
      | DividingLine                  |
      | Image                         |
      | Image_HF                      |
      | Image_Table                   |
      | Content                       |
      | Content_Place                 |
      | Table3x2_Color                |
      | Table4x2_Alignment            |
      | Table3x3_DeleteTable          |
      | Table3x3_DeleteRow            |
      | Table3x3_DeleteColumn         |
      | Table3x3_ClearContent         |
      | Table3x3_AddRowAbove          |
      | Table3x3_AddRowBelow          |
      | Table3x3_AddColumnBefore      |
      | Table3x3_AddColumnAfter       |
      | Table3x2_TopVerticalAlign     |
      | Table3x2_MiddleVerticalAlign  |
      | Table3x3_Resize               |
      | test_5trends_WORD             |