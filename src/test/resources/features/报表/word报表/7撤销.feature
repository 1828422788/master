@reportTextEditor @report
Feature:报表_富文本编辑_7_撤销

  Background:
    Given open the "report.ListPage" page for uri "/reports/"
    And I click the "NewReportButton" button
    Then I will see the "report.CreatePage" page
    And I wait for element "SelectedUser" change text to username
    And I set the parameter "Describe" with value "AutoCreate"
    And I set the parameters "Hour" and "Minute" as "5" minutes later from now
    And I choose the "WORD" from the "ReportType"

  Scenario Outline: text_undo
    When I set the parameter "Name" with value "Default_<name>"
    And I click the "NextButton" button
    And I will see the "report.CreatePageWORD" page

    And I wait for "TextArea" will be visible
    And I set the parameter "TextArea" with value "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi quis aliquet nisl.  Cras tempor nisi urna, sed pulvinar sem molestie in. Fusce scelerisque eleifend accumsan. textclick"

    And I select all text in "TextArea" element
    And I click the element "<button1>" in word report
    And I click the element "<button2>" in word report
    And I wait for "<text_area>" will be visible
    And I click the element "Undo" in word report
    And I wait for "<text_area>" will be invisible
    And I click the element "Redo" in word report
    And I wait for "<text_area>" will be visible


    Examples:
      |   name       |   button1      |   button2        | text_area           |
      | Color        | Color          | Pink             | TextAreaStyle       |
      | Font         |                | TextFontSize48   | TextAreaStyle       |
      | RightAlign   | Alignment      | RightAlignment   | TextAlignment       |
      | Bold         |                | Bold             | BoldElement         |
      | Italics      |                | Italics          | ItalicsElement      |
      | Underline    |                | Underline        | UnderlineElement    |
      | Footer       |                | Footer           | FooterText          |
      | Header       |                | Header           | HeaderText          |
      | Content      |                | Content          | ContentMenu         |
      | Table        | AddTable       | AddTable3x2      | TableElement        |
      | DivLine      |                | DividingLine     | DividingLineElement |
      | Heading      | Heading        | Heading_1        | HeadingElement      |

