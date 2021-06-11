Feature: 报表_预览

  Background:
    Given open the "report.ListPage" page for uri "/reports/"

  @reportPreviewWORDdoc
  Scenario Outline: preview_word
    When I set the parameter "SearchInput" with value "<name>"
    And I wait for "2000" millsecond
    And the data name is "{'column':'1','name':'<name>'}" then i click the "编辑" button
    Then I will see the "report.CreatePage" page
    And I wait for element "SelectedUser" change text to username
    And I click the "NextButton" button under some element
    And I wait for "5000" millsecond
    Then I will see the "report.CreatePageWORD" page
    And I choose the "下载到本地预览" from the "Preview"
    And I wait for "SuccessMessage" will be visible
    And I wait for "35000" millsecond
    And I wait for "SuccessMessage" will be invisible
#    And I wait for element "SuccessMessage" change text to "下载到本地预览成功，请查看并下载完报表历史也最新文件"
    When I click the "FinishButton" button under some element
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "更新成功"

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