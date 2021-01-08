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
    And I click the "Color" button
    And I click the button with title "#6AA84F"
    And I will see the element "TextAreaLocator" style contains "font-size: 48px;"
    And I will see the element "HeaderTextStyle" style contains "font-size: 48px;"
    And I will see the element "FooterTextStyle" style contains "font-size: 48px;"
    And I will see the element "TextAreaLocator" style contains "color: rgb(106, 168, 79);"
    And I will see the element "HeaderTextStyle" style contains "color: rgb(106, 168, 79);"
    And I will see the element "FooterTextStyle" style contains "color: rgb(106, 168, 79);"

    And I set the parameter "ChartListInput" with value "报表测试"
    And I click the button with text "报表测试"
    And I wait for "2000" millsecond
    When I click the "FinishButton" button under some element
    And I wait for "EnsureButton" will be visible
    Then I will see the success message "保存成功"
    And I click the "EnsureButton" button

  Examples:
    |   button        |   name   |      text          |
    | TextFontSize48  | FontSize | 48 FONT SIZE 字号: |


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
    And I click the "Color" button
    And I click the button with title "<color>"
    And I click the "<button>" button
    And I wait for "<button>Element" will be visible

    And I will see the element "HeaderTextStyle" style contains "<colorstyle>"
    And I will see the element "FooterTextStyle" style contains "<colorstyle>"

    And I click the "TextAreaLocator" button
    And I set the parameter "ChartListInput" with value "报表测试"
    And I click the button with text "报表测试"
    And I wait for "2000" millsecond
    When I click the "FinishButton" button under some element
    And I wait for "EnsureButton" will be visible
    Then I will see the success message "保存成功"
    And I click the "EnsureButton" button

    Examples:
      |   button        |   name          |      text              |   color   |  colorstyle     |
      | Bold            | BoldText        | BOLD TEXT 粗体:        | #9900FF   | color: rgb(153, 0, 255);|
      | Italics         | ItalicsText     | ITALICS TEXT 斜体:     | #990000   | color: rgb(153, 0, 0);  |
      | Underline       | UnderlinedText  | UNDERLINED TEXT 下划线:| #E69138   | color: rgb(230, 145, 56);|

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
    And I click the "Color" button
    And I click the button with title "<color>"
    And I click the "Alignment" button
    And I click the "Alignment" button
    And I wait for "2000" millsecond
    And I click the "<button>" button
    And I will see the element "TextAlignment" style contains "<alignment>"
    And I will see the element "HeaderText" style contains "<alignment>"
    And I will see the element "FooterText" style contains "<alignment>"
    And I will see the element "TextAreaLocator" style contains "<colorstyle>"
    And I will see the element "HeaderTextStyle" style contains "<colorstyle>"
    And I will see the element "FooterTextStyle" style contains "<colorstyle>"

    And I click the "TextAreaLocator" button
    And I set the parameter "ChartListInput" with value "报表测试"
    And I click the button with text "报表测试"
    And I wait for "2000" millsecond
    When I click the "FinishButton" button under some element
    And I wait for "EnsureButton" will be visible
    Then I will see the success message "保存成功"
    And I click the "EnsureButton" button

   Examples:
    |   button        |      text                   | alignment           |  color    | colorstyle              |
    | RightAlignment  | RIGHT ALIGNMENT 左对齐:     | text-align: right;  | #00F0F0   | color: rgb(0, 240, 240);|
    | LeftAlignment   | LEFT ALIGNMENT 右对齐:      | text-align: left;   | #6D9EEB   | color: rgb(109, 158, 235);|
    | CenterAlignment | CENTER ALIGNMENT 居中:      | text-align: center; | #CC4125   | color: rgb(204, 65, 37); |
    | JustifyAlignment| JUSTIFY ALIGNMENT 对齐文本: | text-align: justify;| #783F04   | color: rgb(120, 63, 4);    |

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

  Scenario: table_color
    When I set the parameter "Name" with value "Table3x2_Color"
    And I click the "NextButton" button under some element
    Then I wait for "ChartListButtonWord" will be visible
    And I wait for "5000" millsecond

    And I click the "AddTable" button
    And I click the "AddTable3x2" button
    And I wait for "2000" millsecond
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

    And I set the parameter "ChartListInput" with value "报表测试"
    And I click the button with text "报表测试"
    And I wait for "2000" millsecond
    When I click the "FinishButton" button under some element
    And I wait for "EnsureButton" will be visible
    Then I will see the success message "保存成功"
    And I click the "EnsureButton" button

  Scenario: content
    When I set the parameter "Name" with value "Content"
    And I click the "NextButton" button under some element
    Then I wait for "ChartListButtonWord" will be visible
    And I wait for "5000" millsecond
    And I wait for "TextArea" will be visible

    And I wait for "2000" millsecond
    And I set the parameter "TextArea" with value "text" and press enter in word report
    And I will see the "NewLine" is display
    And I click the "Heading" button
    And I click the "Heading_1" button
    And I wait for "2000" millsecond
    And I set the parameter "NewLine" with value "Header 1" and press enter in word report
    And I set the parameter "NewLine" with value "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam porta eget magna in luctus. Suspendisse gravida turpis ut ligula maximus, at finibus elit molestie. Vivamus a dictum ligula, ac bibendum dui. Etiam maximus varius eros, ut posuere libero consequat ac. Proin a viverra arcu, eget condimentum lorem. Vivamus cursus elit eget metus iaculis sollicitudin. Morbi metus sem, tempus quis diam ac, pulvinar ullamcorper ex." and press enter in word report
    And I will see the "NewLine" is display
    And I click the "Heading" button
    And I click the "Heading_2" button
    And I wait for "2000" millsecond
    And I set the parameter "NewLine" with value "Header 1-2" and press enter in word report
    And I set the parameter "NewLine" with value "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam porta eget magna in luctus. Suspendisse gravida turpis ut ligula maximus, at finibus elit molestie. Vivamus a dictum ligula, ac bibendum dui. Etiam maximus varius eros, ut posuere libero consequat ac. Proin a viverra arcu, eget condimentum lorem. Vivamus cursus elit eget metus iaculis sollicitudin. Morbi metus sem, tempus quis diam ac, pulvinar ullamcorper ex." and press enter in word report
    And I will see the "NewLine" is display
    And I click the "Heading" button
    And I click the "Heading_3" button
    And I wait for "2000" millsecond
    And I set the parameter "NewLine" with value "Header 1-2-3" and press enter in word report
    And I set the parameter "NewLine" with value "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam porta eget magna in luctus. Suspendisse gravida turpis ut ligula maximus, at finibus elit molestie. Vivamus a dictum ligula, ac bibendum dui. Etiam maximus varius eros, ut posuere libero consequat ac. Proin a viverra arcu, eget condimentum lorem. Vivamus cursus elit eget metus iaculis sollicitudin. Morbi metus sem, tempus quis diam ac, pulvinar ullamcorper ex." and press enter in word report
    And I will see the "NewLine" is display
    And I click the "Heading" button
    And I click the "Heading_4" button
    And I wait for "2000" millsecond
    And I set the parameter "NewLine" with value "Header 1-2-3-4" and press enter in word report
    And I set the parameter "NewLine" with value "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam porta eget magna in luctus. Suspendisse gravida turpis ut ligula maximus, at finibus elit molestie. Vivamus a dictum ligula, ac bibendum dui. Etiam maximus varius eros, ut posuere libero consequat ac. Proin a viverra arcu, eget condimentum lorem. Vivamus cursus elit eget metus iaculis sollicitudin. Morbi metus sem, tempus quis diam ac, pulvinar ullamcorper ex." and press enter in word report
    And I will see the "NewLine" is display
    And I click the "Heading" button
    And I click the "Heading_1" button
    And I wait for "2000" millsecond
    And I set the parameter "NewLine" with value "Header 2" and press enter in word report
    And I set the parameter "NewLine" with value "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam porta eget magna in luctus. Suspendisse gravida turpis ut ligula maximus, at finibus elit molestie. Vivamus a dictum ligula, ac bibendum dui. Etiam maximus varius eros, ut posuere libero consequat ac. Proin a viverra arcu, eget condimentum lorem. Vivamus cursus elit eget metus iaculis sollicitudin. Morbi metus sem, tempus quis diam ac, pulvinar ullamcorper ex." and press enter in word report
    And I will see the "NewLine" is display
    And I click the "Heading" button
    And I click the "Heading_1" button
    And I wait for "2000" millsecond
    And I set the parameter "NewLine" with value "Header 3" and press enter in word report
    And I set the parameter "NewLine" with value "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam porta eget magna in luctus. Suspendisse gravida turpis ut ligula maximus, at finibus elit molestie. Vivamus a dictum ligula, ac bibendum dui. Etiam maximus varius eros, ut posuere libero consequat ac. Proin a viverra arcu, eget condimentum lorem. Vivamus cursus elit eget metus iaculis sollicitudin. Morbi metus sem, tempus quis diam ac, pulvinar ullamcorper ex." and press enter in word report
    And I will see the "NewLine" is display
    And I click the "Heading" button
    And I click the "Heading_2" button
    And I wait for "2000" millsecond
    And I set the parameter "NewLine" with value "Header 3-1" and press enter in word report
    And I set the parameter "NewLine" with value "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam porta eget magna in luctus. Suspendisse gravida turpis ut ligula maximus, at finibus elit molestie. Vivamus a dictum ligula, ac bibendum dui. Etiam maximus varius eros, ut posuere libero consequat ac. Proin a viverra arcu, eget condimentum lorem. Vivamus cursus elit eget metus iaculis sollicitudin. Morbi metus sem, tempus quis diam ac, pulvinar ullamcorper ex." and press enter in word report
    And I will see the "NewLine" is display
    And I click the "Heading" button
    And I click the "Heading_2" button
    And I wait for "2000" millsecond
    And I set the parameter "NewLine" with value "Header 3-2" and press enter in word report
    And I set the parameter "NewLine" with value "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam porta eget magna in luctus. Suspendisse gravida turpis ut ligula maximus, at finibus elit molestie. Vivamus a dictum ligula, ac bibendum dui. Etiam maximus varius eros, ut posuere libero consequat ac. Proin a viverra arcu, eget condimentum lorem. Vivamus cursus elit eget metus iaculis sollicitudin. Morbi metus sem, tempus quis diam ac, pulvinar ullamcorper ex." and press enter in word report


    And I set the parameter "ChartListInput" with value "报表测试"
    And I click the button with text "报表测试"
    And I wait for "2000" millsecond
    And I click the "Header" button
    And I click the "Header" button
    And I click the "Content" button
    And I wait for "2000" millsecond
    And I will see the "ContentMenu" is display
    When I click the "FinishButton" button under some element
    And I wait for "EnsureButton" will be visible
    Then I will see the success message "保存成功"
    And I click the "EnsureButton" button

  Scenario Outline: text_undo
    When I set the parameter "Name" with value "Default_<name>"
    And I click the "NextButton" button under some element
    Then I wait for "ChartListButtonWord" will be visible
    And I wait for "5000" millsecond

    And I wait for "TextArea" will be visible
    And I set the parameter "TextArea" with value "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi quis aliquet nisl.  Cras tempor nisi urna, sed pulvinar sem molestie in. Fusce scelerisque eleifend accumsan. textclick"
    And I wait for "2000" millsecond

    And I select all text in "TextArea" element
    And I wait for "2000" millsecond
    And I click the "<button1>" button
    And I click the "<button1>" button
    And I click the "<button2>" button
    And I wait for "2000" millsecond
    And I will see the "<text_area>" is display
    And I click the "Undo" button
    And I wait for "2000" millsecond
    And I will see the "<text_area>" doesn't exist
    And I click the "Redo" button
    And I will see the "<text_area>" is display


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

