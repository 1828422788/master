@reportDownloadTextEditor
Feature: 报表_富文本编辑下载

  Background:
    Given open the "report.ListPage" page for uri "/reports/"

  Scenario Outline: download_texteditor
    When I set the parameter "SearchInput" with value "<name>"
    And I wait for "2000" millsecond
    And the data name is "{'column':'1','name':'<name>'}" then i click the "<name>" button
    And I wait for element "SelectedReport" change text to "<name>"
    Then I will see the element "LastGeneratedReport" contains ".docx"
    And I click the "Download" button
    And I wait for "4000" millsecond
    And I download the latest report to local
#    And I wait for "2000" millsecond
#    Then I compare source report file "expect/<name>.docx" with target report file "<name>.docx"

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
      | test_5trends_WORD             |
