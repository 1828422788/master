Feature: 报表_富文本编辑_9_下载

  Background:
    Given open the "report.ListPage" page for uri "/reports/"
    And I wait for loading invisible

  @reportDownloadTextEditor @report
  Scenario Outline: download_texteditor_word
    When I set the parameter "TextFilter" with value "<name>"
    And I wait for loading invisible
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


  @reportDownloadTextEditor @report
  Scenario Outline: download_texteditor_pdf
    When I set the parameter "TextFilter" with value "<name>"
    And I wait for loading invisible
    And the data name is "{'column':'1','name':'<name>'}" then i click the "<name>" button
    And I wait for element "SelectedReport" change text to "<name>"
    Then I will see the element "LastGeneratedReport" contains ".pdf"
    And I click the "Download" button
    And I wait for "4000" millsecond
    And I download the latest report to local
    And I wait for "2000" millsecond
    Then I compare source report file "expect/报表/<name>.pdf" with target report file "<name>.pdf"

    Examples:
      |          name                 |
      | ChangeToPDF                   |
      | ChangeToPDF_Single            |

    @reportSmoke
    Scenario Outline: 下载WORD报表
      When I set the parameter "TextFilter" with value "<name>"
      #等待word报表生成完成
      And I wait for "25000" millsecond
      And I wait for loading invisible
      And the data name is "{'column':'1','name':'<name>'}" then i click the "<name>" button
      And I wait for element "SelectedReport" change text to "<name>"
      Then I will see the element "LastGeneratedReport" contains ".docx"
      And I click the "Download" button
      And I wait for "4000" millsecond
      And I download the latest report to local

      Examples:
        | name                 |
        | FontSize             |
        | Table3x2_Color       |
        | Image                |
        | DividingLine         |