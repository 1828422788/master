@reportTextEditor @report
Feature:报表_富文本编辑_表格

  Background:
    Given open the "report.ListPage" page for uri "/reports/"
    And I click the "NewReportButton" button under some element
    Then I will see the "report.CreatePage" page
    And I wait for element "SelectedUser" change text to username
    And I set the parameter "Describe" with value "AutoCreate"
    And I set the parameters "Hour" and "Minute" as "5" minutes later from now
    And I choose the "WORD" from the "ReportType"

  Scenario: table_color
    When I set the parameter "Name" with value "Table3x2_Color"
    And I click the "NextButton" button under some element
    And I will see the "report.CreatePageWORD" page
    Then I wait for "ChartListButtonWord" will be visible
    And I wait for "5000" millsecond

    And I set the parameter "TextArea" with value "textclick" and press enter in word report
    And I set the parameter "NewLine" with value "text" and press enter in word report
    And I select all text in "TextAreaLocator" element
    And I click the element "TextAreaLocator" in word report
    And I click the element "AddTable" in word report
    And I click the element "AddTable3x2" in word report
    And I wait for "2000" millsecond
    And I will see the "TableElement" is display
    And I set the table cell in row "1" and column "1" with value "Cell 1 1" in word report
    And I select all text in row "1" and column "1" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#CC4125"
    And I set the table cell in row "1" and column "2" with value "Cell 1 2" in word report
    And I select all text in row "1" and column "2" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#E69138"
    And I set the table cell in row "1" and column "3" with value "Cell 1 3" in word report
    And I select all text in row "1" and column "3" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#3D85C6"
    And I set the table cell in row "2" and column "1" with value "Cell 2 1" in word report
    And I select all text in row "2" and column "1" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#B45F06"
    And I set the table cell in row "2" and column "2" with value "Cell 2 2" in word report
    And I select all text in row "2" and column "2" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#38761D"
    And I set the table cell in row "2" and column "3" with value "Cell 2 3" in word report
    And I select all text in row "2" and column "3" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#733554"
    And I wait for "2000" millsecond

    And I select all text in "NewLine" element
    And I click the element "NewLine" in word report
    And I set the parameter "ChartListInput" with value "报表测试"
    And I click the button with text "报表测试"
    And I wait for "2000" millsecond
    When I click the "FinishButton" button under some element
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "新建成功"

  Scenario: table_alignment
    When I set the parameter "Name" with value "Table4x2_Alignment"
    And I click the "NextButton" button under some element
    And I will see the "report.CreatePageWORD" page
    Then I wait for "ChartListButtonWord" will be visible
    And I wait for "5000" millsecond

    And I set the parameter "TextArea" with value "textclick" and press enter in word report
    And I set the parameter "NewLine" with value "text" and press enter in word report
    And I select all text in "TextAreaLocator" element
    And I click the element "TextAreaLocator" in word report
    And I click the element "AddTable" in word report
    And I click the element "NoBorders" in word report
    And I click the element "AddTable4x2" in word report
    And I wait for "2000" millsecond
    And I will see the "NoBorderTableElement" is display
    And I set the table cell in row "1" and column "1" with value "Default: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras cursus tincidunt eros, sit amet posuere risus laoreet et." in word report
    And I select all text in row "1" and column "1" of the table in word report
    And I set the table cell in row "1" and column "2" with value "Left: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras cursus tincidunt eros, sit amet posuere risus laoreet et." in word report
    And I select all text in row "1" and column "2" of the table in word report
    And I click the element "Alignment" in word report
    And I click the element "LeftAlignment" in word report
    And I set the table cell in row "1" and column "3" with value "Center: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras cursus tincidunt eros, sit amet posuere risus laoreet et." in word report
    And I select all text in row "1" and column "3" of the table in word report
    And I click the element "Alignment" in word report
    And I click the element "Alignment" in word report
    And I click the element "CenterAlignment" in word report
    And I set the table cell in row "1" and column "4" with value "Justify: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras cursus tincidunt eros, sit amet posuere risus laoreet et." in word report
    And I select all text in row "1" and column "4" of the table in word report
    And I click the element "Alignment" in word report
    And I click the element "JustifyAlignment" in word report
    And I set the table cell in row "2" and column "1" with value "Right: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras cursus tincidunt eros, sit amet posuere risus laoreet et. " in word report
    And I select all text in row "2" and column "1" of the table in word report
    And I click the element "Alignment" in word report
    And I click the element "RightAlignment" in word report
    And I set the table cell in row "2" and column "2" with value "Default: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras cursus tincidunt eros, sit amet posuere risus laoreet et." in word report
    And I set the table cell in row "2" and column "3" with value "Default: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras cursus tincidunt eros, sit amet posuere risus laoreet et." in word report
    And I set the table cell in row "2" and column "4" with value "Default: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras cursus tincidunt eros, sit amet posuere risus laoreet et." in word report
    And I wait for "2000" millsecond

    And I select all text in "NewLine" element
    And I click the element "NewLine" in word report
    And I set the parameter "ChartListInput" with value "报表测试"
    And I click the button with text "报表测试"
    And I wait for "2000" millsecond
    When I click the "FinishButton" button under some element
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "新建成功"


  Scenario Outline: table_delete
    When I set the parameter "Name" with value "Table3x3_<button>"
    And I click the "NextButton" button under some element
    And I will see the "report.CreatePageWORD" page
    Then I wait for "ChartListButtonWord" will be visible
    And I wait for "5000" millsecond

    And I set the parameter "TextArea" with value "<button> in Cell 2 2" and press enter in word report
    And I set the parameter "NewLine" with value "textclick" and press enter in word report
    And I select all text in "TextAreaLocator" element
    And I click the element "TextAreaLocator" in word report
    And I click the element "AddTable" in word report
    And I click the element "AddTable3x3" in word report
    And I wait for "2000" millsecond
    And I will see the "TableElement" is display
    And I set the table cell in row "1" and column "1" with value "Cell 1 1" in word report
    And I set the table cell in row "1" and column "2" with value "Cell 1 2" in word report
    And I set the table cell in row "1" and column "3" with value "Cell 1 3" in word report
    And I set the table cell in row "2" and column "1" with value "Cell 2 1" in word report
    And I set the table cell in row "2" and column "2" with value "Cell 2 2" in word report
    And I set the table cell in row "2" and column "3" with value "Cell 2 3" in word report
    And I set the table cell in row "3" and column "1" with value "Cell 3 1" in word report
    And I set the table cell in row "3" and column "2" with value "Cell 3 2" in word report
    And I set the table cell in row "3" and column "3" with value "Cell 3 3" in word report
    And I select all text in row "2" and column "2" of the table in word report
    And I click the element "Cell22" in word report

    And I wait for "DeleteElement" will be visible
    And I click the element "DeleteElement" in word report
    And I wait for "<button>" will be visible
    And I click the element "<button>" in word report

    And I select all text in "NewLine" element
    And I click the element "NewLine" in word report
    And I set the parameter "ChartListInput" with value "报表测试"
    And I click the button with text "报表测试"
    And I wait for "2000" millsecond
    When I click the "FinishButton" button under some element
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "新建成功"

  Examples:
    |   button           |
    | DeleteTable        |
    | DeleteRow          |
    | DeleteColumn       |
    | ClearContent       |

  Scenario Outline: table_add
    When I set the parameter "Name" with value "Table3x3_<button2>"
    And I click the "NextButton" button under some element
    And I will see the "report.CreatePageWORD" page
    Then I wait for "ChartListButtonWord" will be visible
    And I wait for "5000" millsecond

    And I set the parameter "TextArea" with value "<button2> in Cell 2 2" and press enter in word report
    And I set the parameter "NewLine" with value "textclick" and press enter in word report
    And I set the parameter "NewLine" with value "text" in word report
    And I set the parameter "ChartListInput" with value "报表测试"
    And I click the button with text "报表测试"
    And I wait for "2000" millsecond
    And I select all text in "TextAreaLocator" element
    And I click the element "TextAreaLocator" in word report
    And I click the element "AddTable" in word report
    And I click the element "AddTable3x3" in word report
    And I wait for "2000" millsecond
    And I will see the "TableElement" is display
    And I set the table cell in row "1" and column "1" with value "Cell 1 1" in word report
    And I set the table cell in row "1" and column "2" with value "Cell 1 2" in word report
    And I set the table cell in row "1" and column "3" with value "Cell 1 3" in word report
    And I set the table cell in row "2" and column "1" with value "Cell 2 1" in word report
    And I set the table cell in row "2" and column "2" with value "Cell 2 2" in word report
    And I set the table cell in row "2" and column "3" with value "Cell 2 3" in word report
    And I set the table cell in row "3" and column "1" with value "Cell 3 1" in word report
    And I set the table cell in row "3" and column "2" with value "Cell 3 2" in word report
    And I set the table cell in row "3" and column "3" with value "Cell 3 3" in word report
    And I select all text in row "2" and column "2" of the table in word report
    And I click the element "Cell22" in word report

    And I wait for "<button1>" will be visible
    And I click the element "<button1>" in word report
    And I wait for "<button2>" will be visible
    And I click the element "<button2>" in word report
    And I wait for "2000" millsecond

    And I set the table cell in row "<row1>" and column "<col1>" with value "ADD" in word report
    And I select all text in row "<row1>" and column "<col1>" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#FF0000"
    And I set the table cell in row "<row2>" and column "<col2>" with value "ADD" in word report
    And I select all text in row "<row2>" and column "<col2>" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#FF0000"
    And I set the table cell in row "<row3>" and column "<col3>" with value "ADD" in word report
    And I select all text in row "<row3>" and column "<col3>" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#FF0000"
    And I will see the "TableElement" is display

    When I click the "FinishButton" button under some element
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "新建成功"

    Examples:
      |   button1   | button2         | row1 | row2 | row3 | col1 | col2 | col3 |
      | AddRow      | AddRowAbove     | 2    | 2    | 2    | 1    | 2    | 3    |
      | AddRow      | AddRowBelow     | 3    | 3    | 3    | 1    | 2    | 3    |
      | AddColumn   | AddColumnBefore | 1    | 2    | 3    | 2    | 2    | 2    |
      | AddColumn   | AddColumnAfter  | 1    | 2    | 3    | 3    | 3    | 3    |

  Scenario Outline: table_vertical_alignment
    When I set the parameter "Name" with value "Table3x2_<button1>"
    And I click the "NextButton" button under some element
    And I will see the "report.CreatePageWORD" page
    Then I wait for "ChartListButtonWord" will be visible
    And I wait for "5000" millsecond

    And I set the parameter "TextArea" with value "<button1> <button2> in Cell 2 2" and press enter in word report
    And I set the parameter "NewLine" with value "textclick" and press enter in word report
    And I set the parameter "NewLine" with value "text" in word report
    And I set the parameter "ChartListInput" with value "报表测试"
    And I click the button with text "报表测试"
    And I wait for "2000" millsecond
    And I select all text in "TextAreaLocator" element
    And I click the element "TextAreaLocator" in word report
    And I click the element "AddTable" in word report
    And I click the element "AddTable3x2" in word report
    And I wait for "2000" millsecond
    And I will see the "TableElement" is display
    And I set the table cell in row "1" and column "1" with value "Cell 1 1" in word report
    And I set the table cell in row "1" and column "2" with value "Cell 1 2" in word report
    And I set the table cell in row "1" and column "3" with value "Cell 1 3" in word report
    And I set the table cell in row "2" and column "1" with value "test <br>test <br>test " in word report
    And I set the table cell in row "2" and column "2" with value "TEST" in word report
    And I set the table cell in row "2" and column "3" with value "Cell 2 3" in word report
    And I select all text in row "2" and column "2" of the table in word report
    And I click the element "Color" in word report
    And I click the button with title "#FF0000"
    And I click the element "Cell22" in word report

    And I wait for "VerticalAlignment" will be visible
    And I click the element "VerticalAlignment" in word report
    And I wait for "2000" millsecond
    And I wait for "<button1>" will be visible
    And I click the element "<button1>" in word report
    And I wait for "2000" millsecond

    And I wait for "Alignment" will be visible
    And I click the element "Alignment" in word report
    And I wait for "2000" millsecond
    And I wait for "<button2>" will be visible
    And I click the element "<button2>" in word report
    And I wait for "2000" millsecond

    And I will see the element "Cell22" style contains "<style1>"
    And I will see the element "Cell22" style contains "<style2>"

    When I click the "FinishButton" button under some element
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "新建成功"

    Examples:
      | button1              | button2            | style1                    | style2              |
      | TopVerticalAlign     | LeftAlignment      | vertical-align: top;      | text-align: left;   |
      | MiddleVerticalAlign  | CenterAlignment    | vertical-align: middle;   | text-align: center; |
      | BottomVerticalAlign  | RightAlignment     | vertical-align: bottom;   | text-align: right;  |

  Scenario: table_resize
    When I set the parameter "Name" with value "Table3x3_Resize"
    And I click the "NextButton" button under some element
    And I will see the "report.CreatePageWORD" page
    Then I wait for "ChartListButtonWord" will be visible
    And I wait for "5000" millsecond

    And I set the parameter "TextArea" with value "Resize Table" and press enter in word report
    And I set the parameter "NewLine" with value "textclick" and press enter in word report
    And I set the parameter "NewLine" with value "text" in word report
    And I set the parameter "ChartListInput" with value "报表测试"
    And I click the button with text "报表测试"
    And I wait for "2000" millsecond
    And I select all text in "TextAreaLocator" element
    And I click the element "TextAreaLocator" in word report
    And I click the element "AddTable" in word report
    And I click the element "AddTable3x3" in word report
    And I wait for "2000" millsecond
    And I will see the "TableElement" is display
    And I will see the element "TableElement" style contains "width: 100%;"
    And I set the table cell in row "1" and column "1" with value "Cell 1 1" in word report
    And I set the table cell in row "1" and column "2" with value "Cell 1 2" in word report
    And I set the table cell in row "1" and column "3" with value "Cell 1 3" in word report
    And I set the table cell in row "2" and column "1" with value "Cell 2 1" in word report
    And I set the table cell in row "2" and column "2" with value "Cell 2 2" in word report
    And I set the table cell in row "2" and column "3" with value "Cell 2 3" in word report
    And I set the table cell in row "3" and column "1" with value "Cell 3 1" in word report
    And I set the table cell in row "3" and column "2" with value "Cell 3 2" in word report
    And I set the table cell in row "3" and column "3" with value "Cell 3 3" in word report

    And I click the element "Cell22" in word report
    And I will see the "BottomRightCorner" is display
    And I drag the element "BottomRightCorner" by "-1100" pixels

    # check that width has changed
    And I will see the element "TableElement" style contains "width: 2"

    When I click the "FinishButton" button under some element
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "新建成功"


