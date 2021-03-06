@reportTextEditor @report
Feature:报表_富文本编辑_2_本文

  Background:
    Given open the "report.ListPage" page for uri "/reports/"
    And I click the "NewReportButton" button
    Then I will see the "report.CreatePage" page
    And I wait for element "SelectedUser" change text to username
    And I set the parameter "Describe" with value "AutoCreate"
    And I set the parameters "Hour" and "Minute" as "2" minutes later from now
    And I choose the "WORD" from the "ReportType"

  @reportSmoke
  Scenario Outline: 本文（字号，颜色）
    When I set the parameter "Name" with value "<name>"
    And I click the "NextButton" button
    And I will see the "report.CreatePageWORD" page
    And I wait for "TextArea" will be visible
    And I set the parameter "TextArea" with value "<text> Lorem ipsum dolor sit amet, consectetur adipiscing elit, non tempus lorem hendrerit. textclick"

    And I choose the "报表测试" from the "ChartList"
    And I click the element "Header" in word report
    And I set the parameter "HeaderText" with value "<text> header" in word report
    And I click the element "Footer" in word report
    And I set the parameter "FooterText" with value "<text> footer" in word report
    And I select all text in "TextArea" element
    And I click the element "Color" in word report
    And I click the button with data-color "#6AA84F"
    And I click the element "<button>" in word report

    And I will see the element "TextAreaLocator" style contains "font-size: 48px;"
    And I will see the element "HeaderTextStyle" style contains "font-size: 48px;"
    And I will see the element "FooterTextStyle" style contains "font-size: 48px;"
    And I will see the element "TextAreaLocator" style contains "color: rgb(106, 168, 79);"
    And I will see the element "HeaderTextStyle" style contains "color: rgb(106, 168, 79);"
    And I will see the element "FooterTextStyle" style contains "color: rgb(106, 168, 79);"
    When I click the "Complete" button
    And I will see the element "ResultMessage" contains "新建成功"

  Examples:
    |   button        |   name   |      text          |
    | TextFontSize48  | FontSize | 48 FONT SIZE 字号: |


  Scenario Outline: text_style
    When I set the parameter "Name" with value "<name>"
    And I click the "NextButton" button
    And I will see the "report.CreatePageWORD" page
    And I wait for "TextArea" will be visible
    And I set the parameter "TextArea" with value "<text> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi quis aliquet nisl. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras tempor nisi urna, sed pulvinar sem molestie in. Fusce scelerisque eleifend accumsan. Phasellus laoreet ligula id orci congue rhoncus non rutrum quam. Donec hendrerit faucibus consequat. Etiam tellus tortor, ultrices et tellus eget, sollicitudin scelerisque risus. Integer mattis velit et nunc sollicitudin, non tempus lorem hendrerit. textclick"
    And I choose the "报表测试" from the "ChartList"
    And I click the element "Header" in word report
    And I set the parameter "HeaderText" with value "<text> header" in word report
    And I click the element "Footer" in word report
    And I set the parameter "FooterText" with value "<text> footer" in word report
    And I click the element "TextArea" in word report
    And I select all text in "TextArea" element
    And I click the element "Color" in word report
    And I click the button with data-color "<color>"
    And I click the element "<button>" in word report
    And I wait for "<button>Element" will be visible
    And I will see the element "HeaderTextStyle" style contains "<colorstyle>"
    And I will see the element "FooterTextStyle" style contains "<colorstyle>"
    When I click the "Complete" button
    And I will see the element "ResultMessage" contains "新建成功"

    Examples:
      |   button        |   name          |      text              |   color   |  colorstyle     |
      | Bold            | BoldText        | BOLD TEXT 粗体:        | #9900FF   | color: rgb(153, 0, 255);|
      | Italics         | ItalicsText     | ITALICS TEXT 斜体:     | #990000   | color: rgb(153, 0, 0);  |
      | Underline       | UnderlinedText  | UNDERLINED TEXT 下划线:| #E69138   | color: rgb(230, 145, 56);|

  Scenario Outline: text_alignment
    When I set the parameter "Name" with value "<button>"
    And I click the "NextButton" button
    And I will see the "report.CreatePageWORD" page
    And I wait for "TextArea" will be visible
    And I set the parameter "TextArea" with value "<text> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi quis aliquet nisl. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras tempor nisi urna, sed pulvinar sem molestie in. Fusce scelerisque eleifend accumsan. Phasellus laoreet ligula id orci congue rhoncus non rutrum quam. Donec hendrerit faucibus consequat. Etiam tellus tortor, ultrices et tellus eget, sollicitudin scelerisque risus. Integer mattis velit et nunc sollicitudin, non tempus lorem hendrerit. textclick"
    And I choose the "报表测试" from the "ChartList"
    And I click the element "Header" in word report
    And I set the parameter "HeaderText" with value "<text> header" in word report
    And I click the element "Footer" in word report
    And I set the parameter "FooterText" with value "<text> footer" in word report
    And I select all text in "TextArea" element
    And I click the element "Color" in word report
    And I click the button with data-color "<color>"
    And I click the element "Alignment" in word report
    And I click the element "Alignment" in word report
    And I click the element "<button>" in word report
    And I will see the element "TextAlignment" style contains "<alignment>"
    And I will see the element "HeaderText" style contains "<alignment>"
    And I will see the element "FooterText" style contains "<alignment>"
    And I will see the element "TextAreaLocator" style contains "<colorstyle>"
    And I will see the element "HeaderTextStyle" style contains "<colorstyle>"
    And I will see the element "FooterTextStyle" style contains "<colorstyle>"
    And I click the element "TextArea" in word report
    When I click the "Complete" button
    And I will see the element "ResultMessage" contains "新建成功"

   Examples:
    |   button        |      text                   | alignment           |  color    | colorstyle              |
    | RightAlignment  | RIGHT ALIGNMENT 左对齐:     | text-align: right;  | #00F0F0   | color: rgb(0, 240, 240);|
    | LeftAlignment   | LEFT ALIGNMENT 右对齐:      | text-align: left;   | #6D9EEB   | color: rgb(109, 158, 235);|
    | CenterAlignment | CENTER ALIGNMENT 居中:      | text-align: center; | #CC4125   | color: rgb(204, 65, 37); |
    | JustifyAlignment| JUSTIFY ALIGNMENT 对齐文本: | text-align: justify;| #783F04   | color: rgb(120, 63, 4);    |