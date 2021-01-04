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
    And I wait for "2000" millsecond

    Examples:
      |          name        |
      | TextFontSize48       |
      | Bold                 |
      | Italics              |
      | Underline            |
      | RightAlignment       |
      | LeftAlignment        |
      | CenterAlignment      |
      | JustifyAlignment     |
      | DividingLine         |
      | Image                |
      | Table3x2             |
