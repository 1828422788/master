@reportTextEditorExtra
Feature:
  Background:
    Given open the "report.ListPage" page for uri "/reports/"
    And I click the "NewReportButton" button
    Then I will see the "report.CreatePage" page
    And I wait for element "SelectedUser" change text to username
    And I set the parameter "Describe" with value "AutoCreate"
    And I set the parameters "Hour" and "Minute" as "7" minutes later from now
    And I choose the "WORD" from the "ReportType"

  Scenario Outline: table_all_colors
    When I set the parameter "Name" with value "Table8x10_<button>"
    And I click the "NextButton" button
    And I will see the "report.CreatePageWORD" page
    Then I wait for "ChartListButtonWord" will be visible
    And I wait for "5000" millsecond

    And I click the element "AddTable" in word report
    And I click the element "AddTable8x10" in word report
    And I wait for "2000" millsecond
    #1
    And I set the table cell in row "1" and column "1" with value "Cell 1 1" in word report
    And I select all text in row "1" and column "1" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#000000"

    And I set the table cell in row "1" and column "2" with value "Cell 1 2" in word report
    And I select all text in row "1" and column "2" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#434343"

    And I set the table cell in row "1" and column "3" with value "Cell 1 3" in word report
    And I select all text in row "1" and column "3" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#666666"

    And I set the table cell in row "1" and column "4" with value "Cell 1 4" in word report
    And I select all text in row "1" and column "4" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#999999"

    And I set the table cell in row "1" and column "5" with value "Cell 1 5" in word report
    And I select all text in row "1" and column "5" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#B7B7B7"

    And I set the table cell in row "1" and column "6" with value "Cell 1 6" in word report
    And I select all text in row "1" and column "6" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#CCCCCC"

    And I set the table cell in row "1" and column "7" with value "Cell 1 7" in word report
    And I select all text in row "1" and column "7" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#D9D9D9"

    And I set the table cell in row "1" and column "8" with value "Cell 1 8" in word report
    And I select all text in row "1" and column "8" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#EFEFEF"

    And I set the table cell in row "1" and column "9" with value "Cell 1 9" in word report
    And I select all text in row "1" and column "9" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#F3F3F3"

    And I set the table cell in row "1" and column "10" with value "Cell 1 10" in word report
    And I select all text in row "1" and column "10" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#FFFFFF"

        #2
    And I set the table cell in row "2" and column "1" with value "Cell 2 1" in word report
    And I select all text in row "2" and column "1" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#980000"

    And I set the table cell in row "2" and column "2" with value "Cell 2 2" in word report
    And I select all text in row "2" and column "2" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#FF0000"

    And I set the table cell in row "2" and column "3" with value "Cell 2 3" in word report
    And I select all text in row "2" and column "3" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#FF9900"

    And I set the table cell in row "2" and column "4" with value "Cell 2 4" in word report
    And I select all text in row "2" and column "4" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#FFFF00"

    And I set the table cell in row "2" and column "5" with value "Cell 2 5" in word report
    And I select all text in row "2" and column "5" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#00F0F0"

    And I set the table cell in row "2" and column "6" with value "Cell 2 6" in word report
    And I select all text in row "2" and column "6" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#00FFFF"

    And I set the table cell in row "2" and column "7" with value "Cell 2 7" in word report
    And I select all text in row "2" and column "7" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#4A86E8"

    And I set the table cell in row "2" and column "8" with value "Cell 2 8" in word report
    And I select all text in row "2" and column "8" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#0000FF"

    And I set the table cell in row "2" and column "9" with value "Cell 2 9" in word report
    And I select all text in row "2" and column "9" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#9900FF"

    And I set the table cell in row "2" and column "10" with value "Cell 2 10" in word report
    And I select all text in row "2" and column "10" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#FF00FF"

##############3
    And I set the table cell in row "3" and column "1" with value "Cell 3 1" in word report
    And I select all text in row "3" and column "1" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#E6B8AF"

    And I set the table cell in row "3" and column "2" with value "Cell 3 2" in word report
    And I select all text in row "3" and column "2" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#F4CCCC"

    And I set the table cell in row "3" and column "3" with value "Cell 3 3" in word report
    And I select all text in row "3" and column "3" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#FCE5CD"

    And I set the table cell in row "3" and column "4" with value "Cell 3 4" in word report
    And I select all text in row "3" and column "4" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#FFF2CC"

    And I set the table cell in row "3" and column "5" with value "Cell 3 5" in word report
    And I select all text in row "3" and column "5" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#D9EAD3"

    And I set the table cell in row "3" and column "6" with value "Cell 3 6" in word report
    And I select all text in row "3" and column "6" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#D0E0E3"

    And I set the table cell in row "3" and column "7" with value "Cell 3 7" in word report
    And I select all text in row "3" and column "7" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#C9DAF8"

    And I set the table cell in row "3" and column "8" with value "Cell 3 8" in word report
    And I select all text in row "3" and column "8" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#CFE2F3"

    And I set the table cell in row "3" and column "9" with value "Cell 3 9" in word report
    And I select all text in row "3" and column "9" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#D9D2E9"

    And I set the table cell in row "3" and column "10" with value "Cell 3 10" in word report
    And I select all text in row "3" and column "10" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#EAD1DC"

    ##############4
    And I set the table cell in row "4" and column "1" with value "Cell 4 1" in word report
    And I select all text in row "4" and column "1" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#DD7E6B"

    And I set the table cell in row "4" and column "2" with value "Cell 4 2" in word report
    And I select all text in row "4" and column "2" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#EA9999"

    And I set the table cell in row "4" and column "3" with value "Cell 4 3" in word report
    And I select all text in row "4" and column "3" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#F9CB9C"

    And I set the table cell in row "4" and column "4" with value "Cell 4 4" in word report
    And I select all text in row "4" and column "4" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#FFE599"

    And I set the table cell in row "4" and column "5" with value "Cell 4 5" in word report
    And I select all text in row "4" and column "5" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#B6D7A8"

    And I set the table cell in row "4" and column "6" with value "Cell 4 6" in word report
    And I select all text in row "4" and column "6" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#A2C4C9"

    And I set the table cell in row "4" and column "7" with value "Cell 4 7" in word report
    And I select all text in row "4" and column "7" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#A4C2F4"

    And I set the table cell in row "4" and column "8" with value "Cell 4 8" in word report
    And I select all text in row "4" and column "8" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#9FC5E8"

    And I set the table cell in row "4" and column "9" with value "Cell 4 9" in word report
    And I select all text in row "4" and column "9" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#B4A7D6"

    And I set the table cell in row "4" and column "10" with value "Cell 4 10" in word report
    And I select all text in row "4" and column "10" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#D5A6BD"

    ##############5
    And I set the table cell in row "5" and column "1" with value "Cell 5 1" in word report
    And I select all text in row "5" and column "1" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#CC4125"

    And I set the table cell in row "5" and column "2" with value "Cell 5 2" in word report
    And I select all text in row "5" and column "2" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#E06666"

    And I set the table cell in row "5" and column "3" with value "Cell 5 3" in word report
    And I select all text in row "5" and column "3" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#F6B26B"

    And I set the table cell in row "5" and column "4" with value "Cell 5 4" in word report
    And I select all text in row "5" and column "4" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#FFD966"

    And I set the table cell in row "5" and column "5" with value "Cell 5 5" in word report
    And I select all text in row "5" and column "5" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#93C47D"

    And I set the table cell in row "5" and column "6" with value "Cell 5 6" in word report
    And I select all text in row "5" and column "6" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#76A5AF"

    And I set the table cell in row "5" and column "7" with value "Cell 5 7" in word report
    And I select all text in row "5" and column "7" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#6D9EEB"

    And I set the table cell in row "5" and column "8" with value "Cell 5 8" in word report
    And I select all text in row "5" and column "8" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#6FA8DC"

    And I set the table cell in row "5" and column "9" with value "Cell 5 9" in word report
    And I select all text in row "5" and column "9" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#8E7CC3"

    And I set the table cell in row "5" and column "10" with value "Cell 5 10" in word report
    And I select all text in row "5" and column "10" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#C27BA0"

    ##############6
    And I set the table cell in row "6" and column "1" with value "Cell 6 1" in word report
    And I select all text in row "6" and column "1" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#A61C00"

    And I set the table cell in row "6" and column "2" with value "Cell 6 2" in word report
    And I select all text in row "6" and column "2" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#CC0000"

    And I set the table cell in row "6" and column "3" with value "Cell 6 3" in word report
    And I select all text in row "6" and column "3" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#E69138"

    And I set the table cell in row "6" and column "4" with value "Cell 6 4" in word report
    And I select all text in row "6" and column "4" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#F1C232"

    And I set the table cell in row "6" and column "5" with value "Cell 6 5" in word report
    And I select all text in row "6" and column "5" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#6AA84F"

    And I set the table cell in row "6" and column "6" with value "Cell 6 6" in word report
    And I select all text in row "6" and column "6" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#45818E"

    And I set the table cell in row "6" and column "7" with value "Cell 6 7" in word report
    And I select all text in row "6" and column "7" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#3C78D8"

    And I set the table cell in row "6" and column "8" with value "Cell 6 8" in word report
    And I select all text in row "6" and column "8" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#3D85C6"

    And I set the table cell in row "6" and column "9" with value "Cell 6 9" in word report
    And I select all text in row "6" and column "9" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#674EA7"

    And I set the table cell in row "6" and column "10" with value "Cell 6 10" in word report
    And I select all text in row "6" and column "10" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#A64D79"

    ##############7
    And I set the table cell in row "7" and column "1" with value "Cell 7 1" in word report
    And I select all text in row "7" and column "1" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#85200C"

    And I set the table cell in row "7" and column "2" with value "Cell 7 2" in word report
    And I select all text in row "7" and column "2" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#990000"

    And I set the table cell in row "7" and column "3" with value "Cell 7 3" in word report
    And I select all text in row "7" and column "3" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#B45F06"

    And I set the table cell in row "7" and column "4" with value "Cell 7 4" in word report
    And I select all text in row "7" and column "4" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#BF9000"

    And I set the table cell in row "7" and column "5" with value "Cell 7 5" in word report
    And I select all text in row "7" and column "5" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#38761D"

    And I set the table cell in row "7" and column "6" with value "Cell 7 6" in word report
    And I select all text in row "7" and column "6" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#134F5C"

    And I set the table cell in row "7" and column "7" with value "Cell 7 7" in word report
    And I select all text in row "7" and column "7" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#1155CC"

    And I set the table cell in row "7" and column "8" with value "Cell 7 8" in word report
    And I select all text in row "7" and column "8" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#0B5394"

    And I set the table cell in row "7" and column "9" with value "Cell 7 9" in word report
    And I select all text in row "7" and column "9" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#351C75"

    And I set the table cell in row "7" and column "10" with value "Cell 7 10" in word report
    And I select all text in row "7" and column "10" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#733554"

    ##############8
    And I set the table cell in row "8" and column "1" with value "Cell 8 1" in word report
    And I select all text in row "8" and column "1" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#5B0F00"

    And I set the table cell in row "8" and column "2" with value "Cell 8 2" in word report
    And I select all text in row "8" and column "2" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#660000"

    And I set the table cell in row "8" and column "3" with value "Cell 8 3" in word report
    And I select all text in row "8" and column "3" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#783F04"

    And I set the table cell in row "8" and column "4" with value "Cell 8 4" in word report
    And I select all text in row "8" and column "4" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#7F6000"

    And I set the table cell in row "8" and column "5" with value "Cell 8 5" in word report
    And I select all text in row "8" and column "5" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#274E13"

    And I set the table cell in row "8" and column "6" with value "Cell 8 6" in word report
    And I select all text in row "8" and column "6" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#0C343D"

    And I set the table cell in row "8" and column "7" with value "Cell 8 7" in word report
    And I select all text in row "8" and column "7" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#1C4587"

    And I set the table cell in row "8" and column "8" with value "Cell 8 8" in word report
    And I select all text in row "8" and column "8" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#073763"

    And I set the table cell in row "8" and column "9" with value "Cell 8 9" in word report
    And I select all text in row "8" and column "9" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#20124D"

    And I set the table cell in row "8" and column "10" with value "Cell 8 10" in word report
    And I select all text in row "8" and column "10" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#4C1130"

    And I wait for "2000" millsecond
    And I select all text in "TextArea" element

    And I click the element "<button>" in word report

    And I set the parameter "ChartListInput" with value "报表测试"
    And I click the button with text "报表测试"
    And I wait for "2000" millsecond
    When I click the "FinishButton" button
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "新建成功"

    Examples:
    | button          |
    | Color           |
    | Bold            |
    | Italics         |
    | Underline       |
    | TextFontSize48  |