@reportTextEditor
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
    Then I wait for "ChartListButtonWord" will be visible
    And I wait for "5000" millsecond

    And I set the parameter "TextArea" with value "textclick" and press enter in word report
    And I set the parameter "NewLine" with value "text" and press enter in word report
    And I select all text in "TextAreaLocator" element
    And I click the "TextAreaLocator" button
    And I click the "AddTable" button
    And I click the "AddTable3x2" button
    And I wait for "2000" millsecond
    And I will see the "TableElement" is display
    And I set the table cell in row "1" and column "1" with value "Cell 1 1" in word report
    And I select all text in row "1" and column "1" of the table in word report
    And I click the "Color" button
    And I click the button with title "#CC4125"
    And I set the table cell in row "1" and column "2" with value "Cell 1 2" in word report
    And I select all text in row "1" and column "2" of the table in word report
    And I click the "Color" button
    And I click the button with title "#E69138"
    And I set the table cell in row "1" and column "3" with value "Cell 1 3" in word report
    And I select all text in row "1" and column "3" of the table in word report
    And I click the "Color" button
    And I click the button with title "#3D85C6"
    And I set the table cell in row "2" and column "1" with value "Cell 2 1" in word report
    And I select all text in row "2" and column "1" of the table in word report
    And I click the "Color" button
    And I click the button with title "#B45F06"
    And I set the table cell in row "2" and column "2" with value "Cell 2 2" in word report
    And I select all text in row "2" and column "2" of the table in word report
    And I click the "Color" button
    And I click the button with title "#38761D"
    And I set the table cell in row "2" and column "3" with value "Cell 2 3" in word report
    And I select all text in row "2" and column "3" of the table in word report
    And I click the "Color" button
    And I click the button with title "#733554"
    And I wait for "2000" millsecond

    And I select all text in "NewLine" element
    And I click the "NewLine" button
    And I set the parameter "ChartListInput" with value "报表测试"
    And I click the button with text "报表测试"
    And I wait for "2000" millsecond
    When I click the "FinishButton" button under some element
    And I wait for "EnsureButton" will be visible
    Then I will see the success message "保存成功"
    And I click the "EnsureButton" button

  Scenario: table_alignment
    When I set the parameter "Name" with value "Table4x2_Alignment"
    And I click the "NextButton" button under some element
    Then I wait for "ChartListButtonWord" will be visible
    And I wait for "5000" millsecond

    And I set the parameter "TextArea" with value "textclick" and press enter in word report
    And I set the parameter "NewLine" with value "text" and press enter in word report
    And I select all text in "TextAreaLocator" element
    And I click the "TextAreaLocator" button
    And I click the "AddTable" button
    And I click the "NoBorders" button
    And I click the "AddTable4x2" button
    And I wait for "2000" millsecond
    And I will see the "NoBorderTableElement" is display
    And I set the table cell in row "1" and column "1" with value "Default: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras cursus tincidunt eros, sit amet posuere risus laoreet et." in word report
    And I select all text in row "1" and column "1" of the table in word report
    And I set the table cell in row "1" and column "2" with value "Left: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras cursus tincidunt eros, sit amet posuere risus laoreet et." in word report
    And I select all text in row "1" and column "2" of the table in word report
    And I click the "Alignment" button
    And I click the "LeftAlignment" button
    And I set the table cell in row "1" and column "3" with value "Center: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras cursus tincidunt eros, sit amet posuere risus laoreet et." in word report
    And I select all text in row "1" and column "3" of the table in word report
    And I click the "Alignment" button
    And I click the "Alignment" button
    And I click the "CenterAlignment" button
    And I set the table cell in row "1" and column "4" with value "Justify: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras cursus tincidunt eros, sit amet posuere risus laoreet et." in word report
    And I select all text in row "1" and column "4" of the table in word report
    And I click the "Alignment" button
    And I click the "JustifyAlignment" button
    And I set the table cell in row "2" and column "1" with value "Right: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras cursus tincidunt eros, sit amet posuere risus laoreet et. " in word report
    And I select all text in row "2" and column "1" of the table in word report
    And I click the "Alignment" button
    And I click the "RightAlignment" button
    And I set the table cell in row "2" and column "2" with value "Default: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras cursus tincidunt eros, sit amet posuere risus laoreet et." in word report
    And I set the table cell in row "2" and column "3" with value "Default: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras cursus tincidunt eros, sit amet posuere risus laoreet et." in word report
    And I set the table cell in row "2" and column "4" with value "Default: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras cursus tincidunt eros, sit amet posuere risus laoreet et." in word report
    And I wait for "2000" millsecond

    And I select all text in "NewLine" element
    And I click the "NewLine" button
    And I set the parameter "ChartListInput" with value "报表测试"
    And I click the button with text "报表测试"
    And I wait for "2000" millsecond
    When I click the "FinishButton" button under some element
    And I wait for "EnsureButton" will be visible
    Then I will see the success message "保存成功"
    And I click the "EnsureButton" button


  Scenario Outline: table_delete
    When I set the parameter "Name" with value "Table3x3_<button>"
    And I click the "NextButton" button under some element
    Then I wait for "ChartListButtonWord" will be visible
    And I wait for "5000" millsecond

    And I set the parameter "TextArea" with value "<button> in Cell 2 2" and press enter in word report
    And I set the parameter "NewLine" with value "textclick" and press enter in word report
    And I select all text in "TextAreaLocator" element
    And I click the "TextAreaLocator" button
    And I click the "AddTable" button
    And I click the "AddTable3x3" button
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
    And I click the "Cell22" button

    And I wait for "DeleteElement" will be visible
    And I click the "DeleteElement" button
    And I wait for "<button>" will be visible
    And I click the "<button>" button

    And I select all text in "NewLine" element
    And I click the "NewLine" button
    And I set the parameter "ChartListInput" with value "报表测试"
    And I click the button with text "报表测试"
    And I wait for "2000" millsecond
    When I click the "FinishButton" button under some element
    And I wait for "EnsureButton" will be visible
    Then I will see the success message "保存成功"
    And I click the "EnsureButton" button

  Examples:
    |   button           |
    | DeleteTable        |
    | DeleteRow          |
    | DeleteColumn       |
    | CleanContent       |

