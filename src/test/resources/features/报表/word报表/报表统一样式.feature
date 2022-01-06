@reportTextEditor @report @reportUnifiedStyle
Feature: 报表_富文本编辑_统一样式

  Scenario: 添加文件
    Given open the "system.CustomConfigs" page for uri "/system/"
    And I wait for "2000" millsecond
    And I drag the scroll bar to the element "UnifiedStyleReport"
    And I upload a file "UnifiedStyleReport" with name "/src/test/resources/testdata/reportStyle/unifiedStyle.docx"
    And I wait for "StyleUploadSuccess" will be visible
    When I choose the "WORD" from the "ReportType"
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "更新成功"
    
  Scenario: 新建报表
    Given open the "report.ListPage" page for uri "/reports/"
    And I click the "NewReportButton" button under some element
    Then I will see the "report.CreatePage" page
    And I wait for element "SelectedUser" change text to username
    When I set the parameter "Name" with value "with_unifiedStyle"
    And I will see the element "DefaultReportType" contains "WORD"
    And I will see the text "检测到报表统一样式已启用，自定义报表生成时均会采用系统配置中的统一样式。" exist in page
    And I set the parameters "Hour" and "Minute" as "10" minutes later from now
    And I click the "NextButton" button under some element
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
    And I set the parameter "NewLine" with value "Heading 1 (Black,center,bold,26)" and press enter in word report
    And I set the parameter "NewLine" with value "(Gray, justify, 14, spacing 2)Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam porta eget magna in luctus. Suspendisse gravida turpis ut ligula maximus, at finibus elit molestie. Vivamus a dictum ligula, ac bibendum dui. Etiam maximus varius eros, ut posuere libero consequat ac. Proin a viverra arcu, eget condimentum lorem. Vivamus cursus elit eget metus iaculis sollicitudin. Morbi metus sem, tempus quis diam ac, pulvinar ullamcorper ex." and press enter in word report
    And I will see the "NewLine" is display
    And I click the element "Heading" in word report
    And I click the element "Heading_2" in word report
    And I wait for "2000" millsecond
    And I set the parameter "NewLine" with value "Heading 1-2 (Blue,right,underlined,24)" and press enter in word report
    And I set the parameter "NewLine" with value "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam porta eget magna in luctus. Suspendisse gravida turpis ut ligula maximus, at finibus elit molestie. Vivamus a dictum ligula, ac bibendum dui. Etiam maximus varius eros, ut posuere libero consequat ac. Proin a viverra arcu, eget condimentum lorem. Vivamus cursus elit eget metus iaculis sollicitudin. Morbi metus sem, tempus quis diam ac, pulvinar ullamcorper ex." and press enter in word report
    And I will see the "NewLine" is display
    And I click the element "Heading" in word report
    And I click the element "Heading_3" in word report
    And I wait for "2000" millsecond
    And I set the parameter "NewLine" with value "Heading 1-2-3 (Green,center,bold-italics,20)" and press enter in word report
    And I set the parameter "NewLine" with value "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam porta eget magna in luctus. Suspendisse gravida turpis ut ligula maximus, at finibus elit molestie. Vivamus a dictum ligula, ac bibendum dui. Etiam maximus varius eros, ut posuere libero consequat ac. Proin a viverra arcu, eget condimentum lorem. Vivamus cursus elit eget metus iaculis sollicitudin. Morbi metus sem, tempus quis diam ac, pulvinar ullamcorper ex." and press enter in word report
    And I will see the "NewLine" is display
    And I click the element "Heading" in word report
    And I click the element "Heading_4" in word report
    And I wait for "2000" millsecond
    And I set the parameter "NewLine" with value "Heading 1-2-3-4 (Red,left,underlined-italics,18)" and press enter in word report
    And I set the parameter "NewLine" with value "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam porta eget magna in luctus. Suspendisse gravida turpis ut ligula maximus, at finibus elit molestie. Vivamus a dictum ligula, ac bibendum dui. Etiam maximus varius eros, ut posuere libero consequat ac. Proin a viverra arcu, eget condimentum lorem. Vivamus cursus elit eget metus iaculis sollicitudin. Morbi metus sem, tempus quis diam ac, pulvinar ullamcorper ex." and press enter in word report
    And I will see the "NewLine" is display
    And I click the element "Heading" in word report
    And I click the element "Heading_1" in word report
    And I wait for "2000" millsecond
    And I set the parameter "NewLine" with value "Heading 2" and press enter in word report
    And I set the parameter "NewLine" with value "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam porta eget magna in luctus. Suspendisse gravida turpis ut ligula maximus, at finibus elit molestie. Vivamus a dictum ligula, ac bibendum dui. Etiam maximus varius eros, ut posuere libero consequat ac. Proin a viverra arcu, eget condimentum lorem. Vivamus cursus elit eget metus iaculis sollicitudin. Morbi metus sem, tempus quis diam ac, pulvinar ullamcorper ex." and press enter in word report
    And I will see the "NewLine" is display
    And I click the element "Heading" in word report
    And I click the element "Heading_1" in word report
    And I wait for "2000" millsecond
    And I set the parameter "NewLine" with value "Heading 3" and press enter in word report
    And I set the parameter "NewLine" with value "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam porta eget magna in luctus. Suspendisse gravida turpis ut ligula maximus, at finibus elit molestie. Vivamus a dictum ligula, ac bibendum dui. Etiam maximus varius eros, ut posuere libero consequat ac. Proin a viverra arcu, eget condimentum lorem. Vivamus cursus elit eget metus iaculis sollicitudin. Morbi metus sem, tempus quis diam ac, pulvinar ullamcorper ex." and press enter in word report
    And I will see the "NewLine" is display
    And I click the element "Heading" in word report
    And I click the element "Heading_2" in word report
    And I wait for "2000" millsecond
    And I set the parameter "NewLine" with value "Heading 3-1" and press enter in word report
    And I set the parameter "NewLine" with value "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam porta eget magna in luctus. Suspendisse gravida turpis ut ligula maximus, at finibus elit molestie. Vivamus a dictum ligula, ac bibendum dui. Etiam maximus varius eros, ut posuere libero consequat ac. Proin a viverra arcu, eget condimentum lorem. Vivamus cursus elit eget metus iaculis sollicitudin. Morbi metus sem, tempus quis diam ac, pulvinar ullamcorper ex." and press enter in word report
    And I will see the "NewLine" is display
    And I click the element "Heading" in word report
    And I click the element "Heading_2" in word report
    And I wait for "2000" millsecond
    And I set the parameter "NewLine" with value "Heading 3-2" and press enter in word report
    And I set the parameter "NewLine" with value "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam porta eget magna in luctus. Suspendisse gravida turpis ut ligula maximus, at finibus elit molestie. Vivamus a dictum ligula, ac bibendum dui. Etiam maximus varius eros, ut posuere libero consequat ac. Proin a viverra arcu, eget condimentum lorem. Vivamus cursus elit eget metus iaculis sollicitudin. Morbi metus sem, tempus quis diam ac, pulvinar ullamcorper ex." and press enter in word report


    And I set the parameter "ChartListInput" with value "报表测试"
    And I click the button with text "报表测试"
    And I wait for "2000" millsecond
    And I click the element "Header" in word report
    And I click the element "Header" in word report
    And I click the element "Content" in word report
    And I wait for "2000" millsecond
    And I will see the "ContentMenu" is display
    When I click the "FinishButton" button under some element
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "新建成功"

  Scenario: 下载到本地预览
    Given open the "report.ListPage" page for uri "/reports/"
    When I set the parameter "SearchInput" with value "with_unifiedStyle"
    And I wait for "2000" millsecond
    And the data name is "{'column':'1','name':'with_unifiedStyle'}" then i click the "编辑" button
    Then I will see the "report.CreatePage" page
    And I wait for element "SelectedUser" change text to username
    And I click the "NextButton" button under some element
    And I will see the "report.CreatePageWORD" page
    And I wait for "5000" millsecond
    And I choose the "下载到本地预览" from the "Preview"
    And I wait for "SuccessMessage" will be visible
    And I will see the element "SuccessMessage" contains "正在生成测试报表，请稍后查看报表历史页"
    And I wait for "40000" millsecond
    When I click the "FinishButton" button under some element
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "更新成功"

  Scenario: 检查生成报表成功
    Given open the "report.ListPage" page for uri "/reports/"
    When I set the parameter "SearchInput" with value "with_unifiedStyle"
    And I wait for loading invisible
    And I wait for "40000" millsecond
    And the data name is "{'column':'1','name':'with_unifiedStyle'}" then i click the "with_unifiedStyle" button
    Then I will see the element "LastGeneratedReport" contains ".docx"

  Scenario: 修改报表名称
    Given open the "report.ListPage" page for uri "/reports/"
    When I set the parameter "SearchInput" with value "with_unifiedStyle"
    And I wait for "2000" millsecond
    And the data name is "{'column':'1','name':'with_unifiedStyle'}" then i click the "编辑" button
    Then I will see the "report.CreatePage" page
    When I set the parameter "Name" with value "without_unifiedStyle"
    And I wait for element "SelectedUser" change text to username
    And I click the "NextButton" button under some element
    And I will see the "report.CreatePageWORD" page
    And I wait for "5000" millsecond
    When I click the "FinishButton" button under some element
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "更新成功"

  Scenario:  删除统一样式
    Given open the "system.CustomConfigs" page for uri "/system/"
    And I wait for "2000" millsecond
    And I drag the scroll bar to the element "DeleteUnifiedStyle"
    When I click the "DeleteUnifiedStyle" button
    Then I will see the "UnifiedStyleReport" is display
    When I choose the "PDF" from the "ReportType"
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "更新成功"

  Scenario: 检查报表配置
    Given open the "report.ListPage" page for uri "/reports/"
    When I set the parameter "SearchInput" with value "without_unifiedStyle"
    And I wait for "2000" millsecond
    And the data name is "{'column':'1','name':'without_unifiedStyle'}" then i click the "编辑" button
    Then I will see the "report.CreatePage" page
    And I wait for element "SelectedUser" change text to username
    And I will see the element "DefaultReportType" contains "WORD"
    And I will see the text "检测到报表统一样式已启用，自定义报表生成时均会采用系统配置中的统一样式" is not existed in page