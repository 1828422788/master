@app @appSmoke
Feature: 应用趋势图

  Scenario Outline: 新建单个资源app
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
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
      | name     | menuName | url     | color   |
      | TrendApp | 趋势图      | /trend/ | #E4FFE6 |

  Scenario Outline: 安装资源成功
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for "CreateButton" will be visible
    And I click the "InstallButton" button
    Then I will see the "app.InstallPage" page
    And I wait for "AddDataset" will be visible
    When I upload a file "Upload" with name "/target/download-files/<appName>.tar"
    And I will see the element "VerifyText" name is "上传完成"
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
      | appName  |
      | TrendApp |

  Scenario Outline: 验证单个资源的app资源范围是否正确
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "打开" button in more menu
    And I will see the "app.AppPage" page
    And I wait for loading invisible
    And I wait for "EmptyText" will be visible
    And I will see the element "Title" name is "<name>"

    Examples:
      | name     |
      | TrendApp |

  Scenario Outline: 新建趋势图并存为报表
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "TrendApp" then i click the "打开" button in more menu
    Then I will see the "trend.ListPage" page
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
    When I set the parameter "NameInput" with value "<name>"
    And I choose the "TrendApp" from the "AppDropdown"
    And I wait for "500" millsecond
    And I click the "Complete" button
    And I wait for "SuccessCreate" will be visible
    And I click the "Report" button
    And switch to another window
    And I close all tabs except main tab
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "TrendApp"
    And I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "<name>"
    And I choose the "PDF" from the "ReportType"
    And I set the parameter "Subject" with value "test"
    And I set the parameter "Hour" with value "11"
    And I set the parameter "Minute" with value "11"
    And I click the "NextButton" button
    And I wait for "1500" millsecond
    And I choose the "TrendApp" from the "ChartList"
    And I wait for "TopoTitle" will be visible
    And I click the "Save" button
#    And I wait for "TrendTitle" will be visible
#    And I will see the element "TrendTitle" name is "1<name>"
#    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "新建成功"

    Examples:
      | name    |
      | AutoApp |

  Scenario Outline: 复制趋势图
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "TrendApp" then i click the "打开" button in more menu
    Then I will see the "trend.ListPage" page
    When the data name is "<name>" then i click the "复制" button in more menu
    And I wait for "Message" will be visible
    Then I will see the message "复制成功"

    Examples:
      | name    |
      | AutoApp |

  Scenario: 搜索趋势图
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "TrendApp" then i click the "打开" button in more menu
    Then I will see the "trend.ListPage" page
    When I set the parameter "SearchInput" with value "AutoApp_副本"
    And I click the "Search" button
    And I wait for loading invisible
    Then I will see the search result "AutoApp_副本"
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "TrendApp"

  Scenario: 标签
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "TrendApp" then i click the "打开" button in more menu
    Then I will see the "trend.ListPage" page
    When the data name is "AutoApp_副本" then i click the "标签" button in more menu
    And I click the Element with text "请选择或输入"
    And I wait for "Tag" will be visible
    And I set the parameter "Tag" with value "testTag"
    And I choose the "testTag" from the "TagDropdown"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "更新成功"

  Scenario: 按照标签搜索
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "TrendApp" then i click the "打开" button in more menu
    Then I will see the "trend.ListPage" page
    When I choose the "testTag" from the "ResourceDropdown"
    And I wait for loading invisible
    Then I will see the search result contains "AutoApp_副本"
    Then I will see the search result "{'column':'0','name':'AutoApp','contains':'no'}"

  Scenario: 编辑趋势图
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "TrendApp" then i click the "打开" button in more menu
    Then I will see the "trend.ListPage" page
    When the data name is "AutoApp" then i click the "编辑" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "TrendApp"
    Then I will see the "trend.CreatePage" page
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I wait for loading invisible
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    When I set the parameter "NameInput" with value "AutoApp"
    And I wait for "BeforeDeleteApp" will be visible
    And I move the mouse pointer to the "BeforeDeleteApp"
    And I click the "DeleteApp" button
#    And I move the mouse pointer to the "DeleteApp"
#    And I click the "DeleteApp" button
    And I click the "Complete" button
    Then I will see the element "SuccessUpdate" name is "更新成功"

  Scenario: 按照应用搜索
    Given open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading invisible
    And I choose the "TrendApp" from the "AppDropdown"
    And I wait for loading invisible
    Then I will see the search result contains "AutoApp_副本"
    Then I will see the search result "{'column':'0','name':'AutoApp','contains':'no'}"

  Scenario: 修改app资源范围为全局
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "TrendApp" then i click the "编辑" button
    Then I will see the "app.CreatePage" page
    And I wait for loading invisible
    And I click the "OverallSituation" button
    And I click the "SaveButton" button

  Scenario Outline: 趋势图删除
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "TrendApp" then i click the "打开" button in more menu
    Then I will see the "trend.ListPage" page
    When the data name is "<name>" then i click the "删除" button in more menu
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "删除成功"

    Examples:
      | name        |
      | AutoApp_副本 |
      | AutoApp     |

  Scenario: 删除报表
    Given open the "report.ListPage" page for uri "/reports/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'AutoApp'}" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button

