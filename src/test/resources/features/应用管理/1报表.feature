@app @appSmoke
Feature: 应用报表（RZY-2127）

  Scenario Outline: 新建单个资源app
    Given open the "app.ListPage" page for uri "/app/list/"
    And I click the "CreateButton" button
    Then I will see the "app.CreatePage" page
    Given delete file "/target/download-files/<name>.tar"
    And I set the parameter "NameInput" with value "<name>"
    And I click the "AddResource" button
    And I set the parameter "SearchResourceInput" with value "app所选资源"
    And I wait for "SearchLoading" will be invisible
    And I "check" the checkbox which name is "app所选资源" in tiny table
    And I click the "SaveMenuButton" button
    And I click the "AddMenuButton" button under some element
    And I wait for "MenuName" will be visible
    And I set the parameter "MenuName" with value "<menuName>"
    And I set the parameter "Url" with value "<url>"
    And I click the "SaveMenuButton" button
    And I choose the "<menuName>" from the "DefaultPage"
    And I click the "CurrentApp" button
    And I click the "ColorPicker" button
    And I set the parameter "ColorValue" with value "<color>"
    And I click the "CreateButton" button under some element
    And I will see the "app.ListPage" page
    Then I wait for "CreateButton" will be visible

    Examples:
      | name      | menuName | url       | color   |
      | ReportApp | 报表       | /reports/ | #84460B |

  Scenario Outline: 安装资源成功
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for "CreateButton" will be visible
    And I click the "InstallButton" button
    Then I will see the "app.InstallPage" page
    And I wait for "AddDataset" will be visible
    When I upload a file "Upload" with name "/target/download-files/<appName>.tar"
    And I will see the element "VerifyText" name is "上传完成"
    And I wait for "2000" millsecond
    And I choose the "__admin__" from the "Role"
    And I click the "AddDataset" button
    And I set the parameter "SearchInput" with value "AutoTestApp"
#    And I click the "SearchIcon" button
    And I wait for "500" millsecond
    And I drag the scroll bar to the element "ResultDataset"
    And I click the "ResultDataset" button
    And I click the "Ensure" button
    And I click the "NextButton" button under some element
    And I wait for "1500" millsecond
    And I click the "Done" button under some element
    And I wait for "ImportSuccess" will be visible
    And I will see the element "ImportSuccess" name is "添加成功"

    Examples:
      | appName   |
      | ReportApp |

  Scenario Outline: 验证单个资源的app资源范围是否正确
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When  I click the detail which name is "<name>"
    And I will see the "app.AppPage" page
    And I wait for loading invisible
    And I wait for "EmptyText" will be visible
    And I will see the element "Title" name is "<name>"

    Examples:
      | name      |
      | ReportApp |

  Scenario: 新建趋势图
    Given open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading invisible
    And I click the "NewTrendButton" button
#    And I click the "Create" button
    Then I will see the "trend.CreatePage" page
    And I set the parameter "SearchInput" with value "tag:*display | stats count() by apache.clientip,apache.resp_len | limit 10 "
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I wait for loading invisible
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    When I set the parameter "NameInput" with value "AutoTestForReport"
    And I choose the "ReportApp" from the "AppDropdown"
    And I wait for "500" millsecond
    And I click the "Complete" button
    And I wait for "SuccessCreate" will be visible

  Scenario: 新建报表
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When  I click the detail which name is "ReportApp"
    Then I will see the "app.AppPage" page
    And I will see the element "Title" name is "ReportApp"
    Then I will see the "report.ListPage" page
    When I click the "Create" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "ReportApp"
    Then I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "AutoAppReport"
    And I choose the "PDF" from the "ReportType"
    And I set the parameter "Subject" with value "AutoTest"
    And I set the parameter "Hour" with value "1"
    And I set the parameter "Minute" with value "1"
    And I click the "NextButton" button
#    Then I will see the "app.AppPage" page
#    And I will see the element "Title" name is "ReportApp"
#    Then I will see the "report.CreatePage" page
    And I wait for "1500" millsecond
    And I choose the "AutoTestForReport" from the "ChartList"
    And I wait for "TopoTitle" will be visible
    And I click the "Save" button
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" value contains "新建成功"
    And I will see the "app.AppPage" page
    Then I will see the element "Title" name is "ReportApp"

  Scenario: 禁用报表
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When  I click the detail which name is "ReportApp"
    Then I will see the "app.AppPage" page
    And I will see the element "Title" name is "ReportApp"
    Then I will see the "report.ListPage" page
    And I wait for "1500" millsecond
    When the data name is "{'column':'1','name':'AutoAppReport'}" then I "close" the switch
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "禁用成功"
    And I will see the "app.AppPage" page
    Then I will see the element "Title" name is "ReportApp"

  Scenario: 编辑报表
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When  I click the detail which name is "ReportApp"
    Then I will see the "app.AppPage" page
    And I will see the element "Title" name is "ReportApp"
    Then I will see the "report.ListPage" page
    And I wait for "2000" millsecond
    When the data name is "{'column':'1','name':'AutoAppReport'}" then i click the "编辑" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "ReportApp"
    Then I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "AutoAppForReport"
    And I click the "NextButton" button
    And I click the "SaveInApp" button
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" value contains "更新成功"

  Scenario Outline: 报表标签
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When  I click the detail which name is "ReportApp"
    Then I will see the "app.AppPage" page
    And I will see the element "Title" name is "ReportApp"
    Then I will see the "report.ListPage" page
    And I wait for "2000" millsecond
    When the data name is "{'column':'1','name':'<name>'}" then i click the "标签" button in more menu
    And I click the Element with text "请选择或输入"
    And I wait for "Tag" will be visible
    And I set the parameter "Tag" with value "测试标签"
    And I wait for "1500" millsecond
    And I choose the "测试标签" from the "LastDropdownList"
    And I wait for "500" millsecond
    And I click the "Ensure" button
    And I wait for "Message" will be visible
    Then I will see the message "修改成功"

    Examples:
      | name             |
      | AutoAppForReport |

  Scenario: 根据标签查找
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When  I click the detail which name is "ReportApp"
    Then I will see the "app.AppPage" page
    And I will see the element "Title" name is "ReportApp"
    Then I will see the "report.ListPage" page
    And I wait for "1500" millsecond
    And I choose the "测试标签" from the "ResourceDropdown"
    And I wait for loading invisible
    Then I will see the search result "{'column':'1','name':'AutoAppForReport'}"
    And I will see the "app.AppPage" page
    Then I will see the element "Title" name is "ReportApp"

  Scenario: 已生成报表
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When  I click the detail which name is "ReportApp"
    Then I will see the "app.AppPage" page
    And I will see the element "Title" name is "ReportApp"
    Then I will see the "report.ListPage" page
    And I click the "Report" button
    Then I will see the "app.AppPage" page
    And I will see the element "Title" name is "ReportApp"
    Then I will see the "report.ListPage" page
    And I click the "ReturnList" button
    Then I will see the "app.AppPage" page
    And I will see the element "Title" name is "ReportApp"

  Scenario: 新建无所属应用的报表
    Given open the "report.ListPage" page for uri "/reports/"
    And I click the "Create" button
    Then I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "无app"
    And I choose the "PDF" from the "ReportType"
    And I set the parameter "Subject" with value "test"
    And I set the parameter "Hour" with value "11"
    And I set the parameter "Minute" with value "11"
    And I click the "NextButton" button
    And I choose the "AutoTestForReport" from the "ChartList"
    And I wait for "TopoTitle" will be visible
    And I click the "Save" button
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" value contains "新建成功"


  Scenario: 验证应用搜索
    Given open the "report.ListPage" page for uri "/reports/"
    And I wait for loading invisible
    And I choose the "ReportApp" from the "AppDropdown"
    And I wait for loading invisible
    Then I will see the search result "{'column':'1','name':'无app','contains':'no'}"
    And I wait for "2000" millsecond
    Then I will see the search result contains "{'column':'1','name':'AutoAppForReport'}"

  Scenario Outline: 修改app资源范围
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "编辑" button
    Then I will see the "app.CreatePage" page
    And I wait for loading invisible
    And I click the "OverallSituation" button
    And I click the "SaveButton" button

    Examples:
      | name      |
      | ReportApp |

  Scenario Outline: 删除报表
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When  I click the detail which name is "ReportApp"
    Then I will see the "app.AppPage" page
    And I will see the element "Title" name is "ReportApp"
    Then I will see the "report.ListPage" page
    Given open the "report.ListPage" page for uri "/reports/"
    And I wait for "2000" millsecond
    When the data name is "{'column':'1','name':'<name>'}" then i click the "删除" button in more menu
    And I click the "Ensure" button

    Examples:
      | name             |
      | AutoAppForReport |
      | 无app             |

  Scenario: 删除趋势图
    Given open the "trend.ListPage" page for uri "/trend/"
    And I wait for "2000" millsecond
    When the data name is "AutoTestForReport" then i click the "删除" button in more menu
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "删除成功"