@reportTextEditor @report
Feature:报表_富文本编辑_5_目录

  Background:
    Given open the "report.ListPage" page for uri "/reports/"
    And I click the "NewReportButton" button
    Then I will see the "report.CreatePage" page
    And I wait for element "SelectedUser" change text to username
    And I set the parameter "Describe" with value "AutoCreate"
    And I set the parameters "Hour" and "Minute" as "3" minutes later from now
    And I choose the "WORD" from the "ReportType"

  Scenario: 添加目录
    When I set the parameter "Name" with value "Content"
    And I click the "NextButton" button
    And I will see the "report.CreatePageWORD" page
    Then I wait for "ChartListButtonWord" will be visible
    And I wait for "5000" millsecond
    And I wait for "TextArea" will be visible

    And I wait for "2000" millsecond
    And I set the parameter "TextArea" with value "text" and press enter in word report
    And I will see the "NewLine" is display
    And I click the element "Heading" in word report
    And I click the element "Heading_1" in word report
    And I wait for "2000" millsecond
    And I set the parameter "NewLine" with value "Header 1" and press enter in word report
    And I set the parameter "NewLine" with value "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam porta eget magna in luctus. Suspendisse gravida turpis ut ligula maximus, at finibus elit molestie. Vivamus a dictum ligula, ac bibendum dui. Etiam maximus varius eros, ut posuere libero consequat ac. Proin a viverra arcu, eget condimentum lorem. Vivamus cursus elit eget metus iaculis sollicitudin. Morbi metus sem, tempus quis diam ac, pulvinar ullamcorper ex." and press enter in word report
    And I will see the "NewLine" is display
    And I click the element "Heading" in word report
    And I click the element "Heading_2" in word report
    And I wait for "2000" millsecond
    And I set the parameter "NewLine" with value "Header 1-2" and press enter in word report
    And I set the parameter "NewLine" with value "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam porta eget magna in luctus. Suspendisse gravida turpis ut ligula maximus, at finibus elit molestie. Vivamus a dictum ligula, ac bibendum dui. Etiam maximus varius eros, ut posuere libero consequat ac. Proin a viverra arcu, eget condimentum lorem. Vivamus cursus elit eget metus iaculis sollicitudin. Morbi metus sem, tempus quis diam ac, pulvinar ullamcorper ex." and press enter in word report
    And I will see the "NewLine" is display
    And I click the element "Heading" in word report
    And I click the element "Heading_3" in word report
    And I wait for "2000" millsecond
    And I set the parameter "NewLine" with value "Header 1-2-3" and press enter in word report
    And I set the parameter "NewLine" with value "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam porta eget magna in luctus. Suspendisse gravida turpis ut ligula maximus, at finibus elit molestie. Vivamus a dictum ligula, ac bibendum dui. Etiam maximus varius eros, ut posuere libero consequat ac. Proin a viverra arcu, eget condimentum lorem. Vivamus cursus elit eget metus iaculis sollicitudin. Morbi metus sem, tempus quis diam ac, pulvinar ullamcorper ex." and press enter in word report
    And I will see the "NewLine" is display
    And I click the element "Heading" in word report
    And I click the element "Heading_4" in word report
    And I wait for "2000" millsecond
    And I set the parameter "NewLine" with value "Header 1-2-3-4" and press enter in word report
    And I set the parameter "NewLine" with value "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam porta eget magna in luctus. Suspendisse gravida turpis ut ligula maximus, at finibus elit molestie. Vivamus a dictum ligula, ac bibendum dui. Etiam maximus varius eros, ut posuere libero consequat ac. Proin a viverra arcu, eget condimentum lorem. Vivamus cursus elit eget metus iaculis sollicitudin. Morbi metus sem, tempus quis diam ac, pulvinar ullamcorper ex." and press enter in word report
    And I will see the "NewLine" is display
    And I click the element "Heading" in word report
    And I click the element "Heading_1" in word report
    And I wait for "2000" millsecond
    And I set the parameter "NewLine" with value "Header 2" and press enter in word report
    And I set the parameter "NewLine" with value "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam porta eget magna in luctus. Suspendisse gravida turpis ut ligula maximus, at finibus elit molestie. Vivamus a dictum ligula, ac bibendum dui. Etiam maximus varius eros, ut posuere libero consequat ac. Proin a viverra arcu, eget condimentum lorem. Vivamus cursus elit eget metus iaculis sollicitudin. Morbi metus sem, tempus quis diam ac, pulvinar ullamcorper ex." and press enter in word report
    And I will see the "NewLine" is display
    And I click the element "Heading" in word report
    And I click the element "Heading_1" in word report
    And I wait for "2000" millsecond
    And I set the parameter "NewLine" with value "Header 3" and press enter in word report
    And I set the parameter "NewLine" with value "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam porta eget magna in luctus. Suspendisse gravida turpis ut ligula maximus, at finibus elit molestie. Vivamus a dictum ligula, ac bibendum dui. Etiam maximus varius eros, ut posuere libero consequat ac. Proin a viverra arcu, eget condimentum lorem. Vivamus cursus elit eget metus iaculis sollicitudin. Morbi metus sem, tempus quis diam ac, pulvinar ullamcorper ex." and press enter in word report
    And I will see the "NewLine" is display
    And I click the element "Heading" in word report
    And I click the element "Heading_2" in word report
    And I wait for "2000" millsecond
    And I set the parameter "NewLine" with value "Header 3-1" and press enter in word report
    And I set the parameter "NewLine" with value "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam porta eget magna in luctus. Suspendisse gravida turpis ut ligula maximus, at finibus elit molestie. Vivamus a dictum ligula, ac bibendum dui. Etiam maximus varius eros, ut posuere libero consequat ac. Proin a viverra arcu, eget condimentum lorem. Vivamus cursus elit eget metus iaculis sollicitudin. Morbi metus sem, tempus quis diam ac, pulvinar ullamcorper ex." and press enter in word report
    And I will see the "NewLine" is display
    And I click the element "Heading" in word report
    And I click the element "Heading_2" in word report
    And I wait for "2000" millsecond
    And I set the parameter "NewLine" with value "Header 3-2" and press enter in word report
    And I set the parameter "NewLine" with value "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam porta eget magna in luctus. Suspendisse gravida turpis ut ligula maximus, at finibus elit molestie. Vivamus a dictum ligula, ac bibendum dui. Etiam maximus varius eros, ut posuere libero consequat ac. Proin a viverra arcu, eget condimentum lorem. Vivamus cursus elit eget metus iaculis sollicitudin. Morbi metus sem, tempus quis diam ac, pulvinar ullamcorper ex." and press enter in word report


    And I set the parameter "ChartListInput" with value "报表测试"
    And I click the button with text "报表测试"
    And I wait for "2000" millsecond
    And I click the element "Header" in word report
    And I click the element "Header" in word report
    And I click the element "Content" in word report
    And I wait for "2000" millsecond
    And I will see the "ContentMenu" is display
    When I click the "FinishButton" button
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "新建成功"

  Scenario: content_place
    When I set the parameter "Name" with value "Content_Place"
    And I click the "NextButton" button
    And I will see the "report.CreatePageWORD" page
    Then I wait for "ChartListButtonWord" will be visible
    And I wait for "5000" millsecond
    And I wait for "TextArea" will be visible

    And I wait for "2000" millsecond
    And I set the parameter "TextArea" with value "text" and press enter in word report
    And I will see the "NewLine" is display
    And I click the element "Heading" in word report
    And I click the element "Heading_1" in word report
    And I wait for "2000" millsecond
    And I set the parameter "NewLine" with value "Header 1 Hidden in content list" and press enter in word report
    And I set the parameter "NewLine" with value "1  Lorem ipsum dolor amet. Aliquam in luctus. Proin condimentum lorem. textclick" and press enter in word report

    And I click the element "TextAreaLocator" in word report
    
    And I click the element "Content" in word report
    And I wait for "2000" millsecond
    And I will see the "ContentMenu" is display
    And I will see the "NewLine" is display
    And I click the element "NewLine" in word report
    And I click the element "Heading" in word report
    And I click the element "Heading_1" in word report
    And I wait for "2000" millsecond
    And I set the parameter "NewLine" with value "Heading 1-1 display" and press enter in word report
    And I set the parameter "NewLine" with value "2  Lorem ipsum dolor sit amet. Aliquam in luctus. Proin condimentum lorem." and press enter in word report
    And I will see the "NewLine" is display
    And I click the element "Heading" in word report
    And I click the element "Heading_1" in word report
    And I wait for "2000" millsecond
    And I set the parameter "NewLine" with value "Heading 1-2 display" and press enter in word report
    And I set the parameter "NewLine" with value "2  Lorem ipsum dolor sit amet. Aliquam in luctus. Proin condimentum lorem." and press enter in word report

    And I set the parameter "ChartListInput" with value "报表测试"
    And I click the button with text "报表测试"
    And I wait for "2000" millsecond
    When I click the "FinishButton" button
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "新建成功"