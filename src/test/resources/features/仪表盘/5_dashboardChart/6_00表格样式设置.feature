@dashboard6_00 @dashboardChart
Feature: 仪表盘_6_00_表格

  Background:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "仪表盘表格"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘表格"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
  
  Scenario: 编辑图表样式-颜色-值-默认 RZY-4846
    And I wait for "Table" will be visible
    And I choose the "列样式设置" from the "TableEditor2"
    And I choose the "值" from the "ChartEditorColor"
    And I wait for "500" millsecond
    And I click the "ColorValueDefault" button
    And I wait for "500" millsecond
    And I click the "ChartEditorEnsure" button
    Then I will see the element "ValueOfNanjingDefault" style contains "background-color: rgb(230, 247, 255);"

  @dashboardChartSmoke
  Scenario: 编辑图表样式-颜色-值-随机 RZY-4847
    And I wait for "Table" will be visible
    And I choose the "列样式设置" from the "TableEditor2"
    And I choose the "值" from the "ChartEditorColor"
    And I wait for "500" millsecond
    And I click the "ColorValueRandom" button
    And I wait for "500" millsecond
    And I click the "ChartEditorEnsure" button
    Then I will see the "ValueOfNanjing" doesn't exist
    Then I will see the element "ValueOfNanjing" style contains "background-color: rgb(3, 169, 244);"

  
  Scenario: 编辑图表样式-颜色-值-自定义 RZY-4848
    And I wait for "Table" will be visible
    And I choose the "列样式设置" from the "TableEditor2"
    And I choose the "值" from the "ChartEditorColor"
    And I wait for "500" millsecond
    And I click the "ColorValueCustom" button
    And I wait for "500" millsecond
    And I click the "AddValueColor" button
    And I set the parameter "FirstValueColor" with value "43"
    And I wait for "500" millsecond
    And I click the "ChartEditorEnsure" button
    Then I will see the "ValueOfNanjing" doesn't exist
    Then I will see the element "ValueOfNanjing" style contains "background-color: rgb(3, 169, 244)"

  @dashboardChartSmoke
  Scenario: 编辑图表样式-颜色-范围 RZY-4849
    And I wait for "Table" will be visible
    And I choose the "列样式设置" from the "TableEditor2"
    And I choose the "范围" from the "ChartEditorColor"
    And I wait for "500" millsecond
    And I click the "AddRangeColor" button
    And I wait for "500" millsecond
    And I click the "AddRangeColor" button
    And I wait for "500" millsecond
    And I click the "AddRangeColor" button
    And I wait for "500" millsecond
    And I click the "ChartEditorEnsure" button
    Then I will see the "ValueOfNanjing" doesn't exist
    Then I will see the element "ValueOfNanjing" style contains "background-color: rgb(37, 155, 36)"
    Then I will see the element "ValueOfShenzhenTd" style contains "background-color: rgb(0, 188, 212)"

  @dashboardChartSmoke
  Scenario: 编辑图表样式-颜色-梯度 RZY-4850
    And I wait for "Table" will be visible
    And I choose the "列样式设置" from the "TableEditor2"
    And I choose the "梯度" from the "ChartEditorColor"
    And I wait for "500" millsecond
    And I will see the element "LowerLimitValue" value is "0"
    And I set the parameter "MedianValue" with value "50"
    And I set the parameter "UpperLimitValue" with value "100"
    And I wait for "500" millsecond
    And I click the "ChartEditorEnsure" button
    Then I will see the "ValueOfNanjing" doesn't exist
    Then I will see the element "ValueOfNanjing" style contains "background-color: rgb(142, 217, 251)"
    Then I will see the element "ValueOfShenzhenTd" style contains "background-color: rgb(189, 232, 252)"

  Scenario: 编辑图表样式-字体颜色-#fa3a76 RZY-4852
    And I wait for "Table" will be visible
    And I choose the "列样式设置" from the "TableEditor2"
    And I wait for "ChartFontColor" will be visible
    And I click the "ChartFontColor" button
    And I wait for "ChartFontColorValue" will be visible
    And I set the parameter "ChartFontColorValue" with value "FA3A76FF"
    And I click the "ChartEditorEnsure" button
    Then I will see the element "ValueOfNanjingTdText" style contains "color: rgb(250, 58, 118)"

  @dashboardChartSmoke
  Scenario: 编辑图表样式-字体样式-粗体 RZY-4851
    And I wait for "Table" will be visible
    And I choose the "列样式设置" from the "TableEditor2"
    And I wait for "1000" millsecond
    And I choose the "粗体" from the "ChartFontStyle"
    And I wait for "500" millsecond
    And I click the "ChartEditorEnsure" button
    Then I will see the element "ValueOfNanjing" style contains "font-weight: bold"

  Scenario: 编辑图表样式-字体样式-斜体 RZY-4851
    And I wait for "Table" will be visible
    And I choose the "列样式设置" from the "TableEditor2"
    And I wait for "1000" millsecond
    And I choose the "斜体" from the "ChartFontStyle"
    And I wait for "500" millsecond
    And I click the "ChartEditorEnsure" button
    Then I will see the element "ValueOfNanjing" style contains "font-style: italic"

  Scenario: 编辑图表样式-字体样式-下划线 RZY-4851
    And I wait for "Table" will be visible
    And I choose the "列样式设置" from the "TableEditor2"
    And I wait for "1000" millsecond
    And I choose the "下划线" from the "ChartFontStyle"
    And I wait for "500" millsecond
    And I click the "ChartEditorEnsure" button
    Then I will see the element "ValueOfNanjing" style contains "text-decoration: underline"

  Scenario Outline: 编辑图表样式-列宽度 RZY-4853
    And I wait for "Table" will be visible
    And I choose the "列样式设置" from the "TableEditor2"
    And I wait for "1000" millsecond
    And I set the parameter "ChartColumnWidth" with value "<Width>"
    And I wait for "500" millsecond
    And I click the "ChartEditorEnsure" button
    And I wait for "2000" millsecond
    Then take part of "ChartStyleTable" with name "actual/<image>"
    # And I compare source image "actual/<image>" with target image "expect/<image>"

    Examples:
      | Width   |   image        |
      | 20      | 表格样式_列宽度   |

  Scenario: 编辑图表样式-对齐方式-居中 RZY-4854
    And I wait for "Table" will be visible
    And I choose the "列样式设置" from the "TableEditor2"
    And I wait for "1000" millsecond
    And I choose the "居中" from the "ChartAlignment"
    And I wait for "500" millsecond
    And I click the "ChartEditorEnsure" button
    Then I will see the element "ValueOfNanjing" style contains "justify-content: center"

  Scenario: 编辑图表样式-对齐方式-居右 RZY-4854
    And I wait for "Table" will be visible
    And I choose the "列样式设置" from the "TableEditor2"
    And I wait for "1000" millsecond
    And I choose the "居右" from the "ChartAlignment"
    And I wait for "500" millsecond
    And I click the "ChartEditorEnsure" button
    Then I will see the element "ValueOfNanjing" style contains "justify-content: right"

  Scenario: 编辑图表样式-对齐方式-居左 RZY-4854
    And I wait for "Table" will be visible
    And I choose the "列样式设置" from the "TableEditor2"
    And I wait for "1000" millsecond
    And I choose the "居左" from the "ChartAlignment"
    And I wait for "500" millsecond
    And I click the "ChartEditorEnsure" button
    Then I will see the element "ValueOfNanjing" style contains "justify-content: left"

  Scenario: 文件名称校验 RZY-4878
    And I move the mouse pointer to the "DownloadTableIcon"
    And I click the "DownloadTableIcon" button
    And I wait for "1000" millsecond
    And I set the parameter "DownloadFileName" with value " "
    And I click the "Ensure" button
    Then I will see the error message "请填写有效文件名"
    And I wait for "3000" millsecond
    And I set the parameter "DownloadFileName" with value "汉字Abc！@#¥123"
    And I wait for "3000" millsecond
    And I click the "Ensure" button
    Then I will see the success message "成功提交下载任务"
    And I wait for "10000" millsecond

  Scenario: 再次添加同名下载任务 RZY-4879
    And I move the mouse pointer to the "DownloadTableIcon"
    And I click the "DownloadTableIcon" button
    And I wait for "1000" millsecond
    And I set the parameter "DownloadFileName" with value "汉字Abc！@#¥123"
    And I click the "Ensure" button
    And I will see the message contains "下载错误: Duplicate file name"

  Scenario Outline: 编辑图表列位置-左移-右移
    And I wait for "Table" will be visible
    And I will see the element "FirstColumnFirstValue" contains "<value1>"
    And I will see the element "SecondColumnFirstValue" contains "<value2>"
    And I choose the "<action>" from the "<button>"
    And I will see the element "FirstColumnFirstValue" contains "<value2>"
    And I will see the element "SecondColumnFirstValue" contains "<value1>"
    And I wait for "10000" millsecond

  Examples:
    | action  | button       | value1  | value2  |
    | 左移    | TableEditor2 | 南京市  | 43      |
    | 右移    | TableEditor1 | 43      | 南京市  |

  @dashboardChartSmoke
  Scenario: 编辑图表列位置-隐藏
    And I wait for "Table" will be visible
    And I choose the "隐藏" from the "TableEditor2"
    And I will see the "TableEditor2" doesn't exist
    And I will see the "SecondColumnFirstValue" doesn't exist
    And I wait for "5000" millsecond

  @dashboardChartSmoke
  Scenario: 编辑图表列位置-隐藏-显示
    And I wait for "Table" will be visible
    And I click the "HiddenColumns" button
    And I click the Element with text "显示"
    And I will see the "TableEditor2" is display
    And I will see the "SecondColumnFirstValue" is display
    And I wait for "5000" millsecond


  Scenario: 编辑图表列位置-隐藏-显示全部
    And I wait for "Table" will be visible
    And I choose the "隐藏" from the "TableEditor1"
    And I will see the "TableEditor2" doesn't exist
    And I will see the "SecondColumnFirstValue" doesn't exist
    And I wait for "5000" millsecond
    And I click the "HiddenColumns" button
    And I click the Element with text "显示全部"
    And I will see the "TableEditor2" is display
    And I will see the "SecondColumnFirstValue" is display
    And I wait for "5000" millsecond