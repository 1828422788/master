@report @reportTemplate @downloadReportWithTemplate
Feature: 报表模板_5下载

  Background:
    Given open the "report.ListPage" page for uri "/reports/"
    And I wait for loading invisible

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
      |       name         |
      | 使用模板_图表_绿色 |
      | 报表_选择模板      |
      | 报表_上传模板      |
      | 报表_使用模板      |