@reportTextEditor
Feature:报表_富文本编辑

  Background:
    Given open the "report.ListPage" page for uri "/reports/"
    And I click the "NewReportButton" button under some element
    Then I will see the "report.CreatePage" page
    And I wait for element "SelectedUser" change text to username
    And I set the parameter "Describe" with value "AutoCreate"
    And I set the parameters "Hour" and "Minute" as "5" minutes later from now
    And I choose the "WORD" from the "ReportType"

  Scenario: empty_report
    When I set the parameter "Name" with value "empty_word_report"
    And I click the "NextButton" button under some element
    Then I wait for "ChartListButtonWord" will be visible
    And I wait for "5000" millsecond

    And I set the parameter "ChartListInput" with value "报表测试"
    And I click the button with text "报表测试"
    And I wait for "2000" millsecond

    And I wait for "TextArea" will be visible
    And I set the parameter "TextArea" with value "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "

    When I click the "FinishButton" button under some element
    And I wait for "EnsureButton" will be visible
    Then I will see the success message "至少选择一个趋势图"


  Scenario Outline: text_font
    When I set the parameter "Name" with value "<name>"
    And I click the "NextButton" button under some element
    Then I wait for "ChartListButtonWord" will be visible
    And I wait for "5000" millsecond

    And I wait for "TextArea" will be visible
    And I set the parameter "TextArea" with value "<text> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi quis aliquet nisl. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras tempor nisi urna, sed pulvinar sem molestie in. Fusce scelerisque eleifend accumsan. Phasellus laoreet ligula id orci congue rhoncus non rutrum quam. Donec hendrerit faucibus consequat. Etiam tellus tortor, ultrices et tellus eget, sollicitudin scelerisque risus. Integer mattis velit et nunc sollicitudin, non tempus lorem hendrerit. textclick"
    And I click the "Header" button
    And I wait for "2000" millsecond
    And I set the parameter "HeaderText" with value "<text> header" in word report
    And I click the "Footer" button
    And I wait for "2000" millsecond
    And I set the parameter "FooterText" with value "<text> footer" in word report
    And I wait for "2000" millsecond

    And I select all text in "TextArea" element
    And I wait for "2000" millsecond
    And I click the "<button>" button
    And I will see the element "TextAreaLocator" style contains "font-size: 48px;"
    And I will see the element "HeaderTextStyle" style contains "font-size: 48px;"
    And I will see the element "FooterTextStyle" style contains "font-size: 48px;"

    And I set the parameter "ChartListInput" with value "报表测试"
    And I click the button with text "报表测试"
    And I wait for "2000" millsecond
    When I click the "FinishButton" button under some element
    And I wait for "EnsureButton" will be visible
    Then I will see the success message "保存成功"
    And I click the "EnsureButton" button

  Examples:
    |   button        |   name          |      text              |
    | TextFontSize48  | FontSize        | 48 FONT SIZE 字号:     |


  Scenario Outline: text_style
    When I set the parameter "Name" with value "<name>"
    And I click the "NextButton" button under some element
    Then I wait for "ChartListButtonWord" will be visible
    And I wait for "5000" millsecond

    And I wait for "TextArea" will be visible
    And I set the parameter "TextArea" with value "<text> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi quis aliquet nisl. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras tempor nisi urna, sed pulvinar sem molestie in. Fusce scelerisque eleifend accumsan. Phasellus laoreet ligula id orci congue rhoncus non rutrum quam. Donec hendrerit faucibus consequat. Etiam tellus tortor, ultrices et tellus eget, sollicitudin scelerisque risus. Integer mattis velit et nunc sollicitudin, non tempus lorem hendrerit. textclick"
    And I click the "Header" button
    And I wait for "2000" millsecond
    And I set the parameter "HeaderText" with value "<text> header" in word report
    And I click the "Footer" button
    And I wait for "2000" millsecond
    And I set the parameter "FooterText" with value "<text> footer" in word report
    And I wait for "2000" millsecond

    And I select all text in "TextArea" element
    And I wait for "2000" millsecond
    And I click the "<button>" button
    And I wait for "<button>Element" will be visible

    And I click the "TextAreaLocator" button
    And I set the parameter "ChartListInput" with value "报表测试"
    And I click the button with text "报表测试"
    And I wait for "2000" millsecond
    When I click the "FinishButton" button under some element
    And I wait for "EnsureButton" will be visible
    Then I will see the success message "保存成功"
    And I click the "EnsureButton" button

    Examples:
      |   button        |   name          |      text              |
      | Bold            | BoldText        | BOLD TEXT 粗体:        |
      | Italics         | ItalicsText     | ITALICS TEXT 斜体:     |
      | Underline       | UnderlinedText  | UNDERLINED TEXT 下划线:|

  Scenario Outline: text_alignment
    When I set the parameter "Name" with value "<button>"
    And I click the "NextButton" button under some element
    Then I wait for "ChartListButtonWord" will be visible
    And I wait for "5000" millsecond

    And I wait for "TextArea" will be visible
    And I set the parameter "TextArea" with value "<text> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi quis aliquet nisl. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras tempor nisi urna, sed pulvinar sem molestie in. Fusce scelerisque eleifend accumsan. Phasellus laoreet ligula id orci congue rhoncus non rutrum quam. Donec hendrerit faucibus consequat. Etiam tellus tortor, ultrices et tellus eget, sollicitudin scelerisque risus. Integer mattis velit et nunc sollicitudin, non tempus lorem hendrerit. textclick"
    And I click the "Header" button
    And I wait for "2000" millsecond
    And I set the parameter "HeaderText" with value "<text> header" in word report
    And I click the "Footer" button
    And I wait for "2000" millsecond
    And I set the parameter "FooterText" with value "<text> footer" in word report
    And I wait for "2000" millsecond

    And I select all text in "TextArea" element
    And I wait for "2000" millsecond
    And I click the "Alignment" button
    And I click the "Alignment" button
    And I wait for "2000" millsecond
    And I click the "<button>" button
    And I will see the element "TextAlignment" style contains "<alignment>"
    And I will see the element "HeaderText" style contains "<alignment>"
    And I will see the element "FooterText" style contains "<alignment>"

    And I click the "TextAreaLocator" button
    And I set the parameter "ChartListInput" with value "报表测试"
    And I click the button with text "报表测试"
    And I wait for "2000" millsecond
    When I click the "FinishButton" button under some element
    And I wait for "EnsureButton" will be visible
    Then I will see the success message "保存成功"
    And I click the "EnsureButton" button

   Examples:
    |   button        |      text                   | alignment           |
    | RightAlignment  | RIGHT ALIGNMENT 左对齐:     | text-align: right;  |
    | LeftAlignment   | LEFT ALIGNMENT 右对齐:      | text-align: left;   |
    | CenterAlignment | CENTER ALIGNMENT 居中:      | text-align: center; |
    | JustifyAlignment| JUSTIFY ALIGNMENT 对齐文本: | text-align: justify;|

  Scenario: dividing_line
    When I set the parameter "Name" with value "DividingLine"
    And I click the "NextButton" button under some element
    Then I wait for "ChartListButtonWord" will be visible
    And I wait for "5000" millsecond

    And I wait for "TextArea" will be visible
    And I set the parameter "TextArea" with value "DIVIDING LINE 分线: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi quis aliquet nisl. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras tempor nisi urna, sed pulvinar sem molestie in. Fusce scelerisque eleifend accumsan. Phasellus laoreet ligula id orci congue rhoncus non rutrum quam. Donec hendrerit faucibus consequat. Etiam tellus tortor, ultrices et tellus eget, sollicitudin scelerisque risus. Integer mattis velit et nunc sollicitudin, non tempus lorem hendrerit. textclick"
    And I click the "DividingLine" button
    And I wait for "2000" millsecond
    And I wait for "DividingLineElement" will be visible

    And I set the parameter "ChartListInput" with value "报表测试"
    And I click the button with text "报表测试"
    And I wait for "2000" millsecond
    When I click the "FinishButton" button under some element
    And I wait for "EnsureButton" will be visible
    Then I will see the success message "保存成功"
    And I click the "EnsureButton" button

  Scenario: image
    When I set the parameter "Name" with value "Image"
    And I click the "NextButton" button under some element
    Then I wait for "ChartListButtonWord" will be visible
    And I wait for "5000" millsecond

    When I upload a file "UploadImage" with name "/src/test/resources/testdata/image/smallRobbot.png"
    And I wait for "2000" millsecond
    And I wait for "ImageElement" will be visible

    And I set the parameter "ChartListInput" with value "报表测试"
    And I click the button with text "报表测试"
    And I wait for "2000" millsecond
    When I click the "FinishButton" button under some element
    And I wait for "EnsureButton" will be visible
    Then I will see the success message "保存成功"
    And I click the "EnsureButton" button

  Scenario: image_20kb
    When I set the parameter "Name" with value "Image"
    And I click the "NextButton" button under some element
    Then I wait for "ChartListButtonWord" will be visible
    And I wait for "5000" millsecond

    When I upload a file "UploadImage" with name "/src/test/resources/testdata/image/pikachu.jpeg"
    And I wait for "EnsureButton" will be visible
    Then I will see the message "内嵌图片最大支持20kb"

  Scenario: table
    When I set the parameter "Name" with value "Table3x2"
    And I click the "NextButton" button under some element
    Then I wait for "ChartListButtonWord" will be visible
    And I wait for "5000" millsecond

    And I click the "AddTable" button
    And I click the "AddTable3x2" button
    And I wait for "2000" millsecond
    And I wait for "Cell11" will be visible
    And I set the parameter "Cell11" with value "hello" in word report
    And I wait for "5000" millsecond

    And I set the parameter "ChartListInput" with value "报表测试"
    And I click the button with text "报表测试"
    And I wait for "2000" millsecond
    When I click the "FinishButton" button under some element
    And I wait for "EnsureButton" will be visible
    Then I will see the success message "保存成功"
    And I click the "EnsureButton" button


