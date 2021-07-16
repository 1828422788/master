@app @appSmoke
Feature: 应用字段提取（RZY-2129）

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
    And I click the "AddMenuButton" button under some element
    And I set the parameter "MenuName" with value "字典管理"
    And I set the parameter "Url" with value "/dictionary/"
    And I click the "SaveMenuButton" button
    And I choose the "<menuName>" from the "DefaultPage"
    And I click the "CurrentApp" button
    And I click the "ColorPicker" button
    And I set the parameter "ColorValue" with value "<color>"
    And I click the "CreateButton" button under some element
    And I will see the "app.ListPage" page
    Then I wait for "CreateButton" will be visible

    Examples:
      | name       | menuName | url       | color   |
      | ConfigsApp | 字段提取     | /configs/ | #0542F9 |

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
    And I wait for "500" millsecond
#    And I click the "SearchIcon" button
    And I drag the scroll bar to the element "ResultDataset"
    And I click the "ResultDataset" button
    And I click the "Ensure" button
    And I click the "NextButton" button under some element
    And I wait for "1500" millsecond
    And I click the "Done" button under some element
    And I wait for "ImportSuccess" will be visible
    And I will see the element "ImportSuccess" name is "添加成功"

    Examples:
      | appName    |
      | ConfigsApp |

  Scenario Outline: 验证单个资源的app资源范围是否正确
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "打开" button in more menu
    And I will see the "app.AppPage" page
    And I wait for loading invisible
    And I wait for "EmptyText" will be visible
    And I will see the element "Title" name is "<name>"

    Examples:
      | name       |
      | ConfigsApp |

  Scenario: 新建字段提取
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "ConfigsApp" then i click the "打开" button in more menu
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "ConfigsApp"
    Then I will see the "configs.ListPage" page
    When I click the "Create" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "ConfigsApp"
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "test"
    And I click the "AddRule" button
    And I choose the "XML解析" from the "ParseRule"
    And I wait for "1500" millsecond
    And I choose the "raw_message" from the "SourceField"
    And I wait for "500" millsecond
    And I click the "EnsureAddParseRule" button
    And I click the "NextButton" button under some element
    When I set the parameter "Name" with value "AutoTest"
    And I wait for "500" millsecond
    And I set the parameter "Logtype" with value "other"
    And I wait for "500" millsecond
    And I set the parameter "AppName" with value "auto_test_csv"
    And I wait for "Tag" will be visible
    And I set the parameter "Tag" with value "auto_test_csv"
    And I click the "Done" button
    Then I wait for "ConfigDone" will be visible
    And I click the "Return" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "ConfigsApp"

  Scenario Outline: 复制字段提取
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "ConfigsApp" then i click the "打开" button in more menu
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "ConfigsApp"
    Then I will see the "configs.ListPage" page
    And I wait for "1000" millsecond
    When the data name is "{'column':'1','name':'<name>'}" then i click the "复制" button in more menu
    And I refresh the website
    And I wait for loading invisible
    Then I will see the search result contains "{'column':'1','name':'<name>(副本)'}"
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "ConfigsApp"

    Examples:
      | name     |
      | AutoTest |

  Scenario: 编辑字段提取
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "ConfigsApp" then i click the "打开" button in more menu
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "ConfigsApp"
    Then I will see the "configs.ListPage" page
    When the data name is "{'column':'1','name':'AutoTest(副本)'}" then i click the "编辑" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "ConfigsApp"
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "testtesttesttest"
    And I click the "NextButton" button
    And I wait for "500" millsecond
    And I set the parameter "Name" with value "AutoTestCopy"
    And I move the mouse pointer to the "DeleteAppicon"
    And I click the "DeleteApp" button
    And I click the "SwitchButton" button
    Then I click the "Done" button
    And I wait for "ConfigDone" will be visible

  Scenario: 验证所属app生效及修改标签
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "ConfigsApp" then i click the "打开" button in more menu
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "ConfigsApp"
    Then I will see the "configs.ListPage" page
    Then I will see the search result "{'column':'1','name':'AutoTestCopy','contains':'no'}"
    When the data name is "{'column':'1','name':'AutoTest'}" then i click the "复制" button in more menu
    And I refresh the website
    And I wait for loading invisible
    Then I will see the search result contains "{'column':'1','name':'AutoTest(副本)'}"
    When the data name is "{'column':'1','name':'AutoTest'}" then i click the "标签" button in more menu
    And I click the Element with text "请选择或输入"
    And I wait for "Tag" will be visible
    And I set the parameter "Tag" with value "test"
    And I wait for "1500" millsecond
    And I choose the "test" from the "TagDropdown"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "修改成功"

  Scenario: 按照标签搜索
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "ConfigsApp" then i click the "打开" button in more menu
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "ConfigsApp"
    Then I will see the "configs.ListPage" page
    And I wait for "500" millsecond
    And I choose the "test" from the "ResourceDropdown"
    And I wait for loading invisible
    Then I will see the search result contains "{'column':'1','name':'AutoTest'}"
    Then I will see the search result "{'column':'1','name':'AutoTest(副本)','contains':'no'}"

  Scenario Outline: 上传字典管理
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "ConfigsApp" then i click the "打开" button in more menu
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "ConfigsApp"
    And I click the "Dictionary" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "ConfigsApp"
    Then I will see the "dictionary.ListPage" page
    When I click the "UploadButton" button
    And I upload a file with name "/src/test/resources/testdata/dictionary/AutoTest.csv"
    And I wait for "FileName" will be visible
    Then I set the parameter "Name" with value "<name>"
    And I click the "EnsureUpload" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "创建字典成功"

    Examples:
      | name    |
      | 字典管理app |
      | app对比测试 |

  Scenario: 字典管理标签
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "ConfigsApp" then i click the "打开" button in more menu
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "ConfigsApp"
    And I click the "Dictionary" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "ConfigsApp"
    Then I will see the "dictionary.ListPage" page
    And I wait for "1500" millsecond
    Then the data name is "字典管理app.csv" then i click the "标签" button in more menu
    And I click the Element with text "请选择或输入"
    And I wait for "Tag" will be visible
    Then I set the parameter "Tag" with value "测试标签"
    And I choose the "测试标签" from the "Group"
    Then I click the "EnsureButton" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "修改成功"

  Scenario: 根据标签搜索字典
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "ConfigsApp" then i click the "打开" button in more menu
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "ConfigsApp"
    And I click the "Dictionary" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "ConfigsApp"
    Then I will see the "dictionary.ListPage" page
    And I wait for "1000" millsecond
    And I choose the "测试标签" from the "ResourceDropdown"
    And I wait for loading invisible
    Then I will see the search result "字典管理app.csv"
    Then I will see the search result "{'column':'0','name':'app对比测试.csv','contains':'no'}"
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "ConfigsApp"

  Scenario: 根据名称搜索字典
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "ConfigsApp" then i click the "打开" button in more menu
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "ConfigsApp"
    And I click the "Dictionary" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "ConfigsApp"
    Then I will see the "dictionary.ListPage" page
    And I set the parameter "SearchInput" with value "字典管理"
    And I wait for loading invisible
    Then I will see the search result "字典管理app.csv"
    Then I will see the search result "{'column':'0','name':'app对比测试.csv','contains':'no'}"
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "ConfigsApp"

  Scenario: 编辑字典
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "ConfigsApp" then i click the "打开" button in more menu
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "ConfigsApp"
    And I click the "Dictionary" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "ConfigsApp"
    Then I will see the "dictionary.ListPage" page
    When the data name is "app对比测试.csv" then i click the "编辑" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "ConfigsApp"
    Then I will see the "dictionary.CreatePage" page
    And I click the "Next" button
    Then I wait for "800" millsecond
  #  And I move the mouse pointer to the "DeleteAppName"
  #  And I click the "DeleteApp" button
    Then I click the "Done" button
   # And I wait for "Message" will be visible
    Then I will see the message "添加成功"
    And I wait for "3000" millsecond

  Scenario: 根据app搜索应用
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    And I wait for loading invisible
    And I choose the "ConfigsApp" from the "App"
    And I wait for loading invisible
    Then I will see the search result contains "字典管理app.csv"
    Then I will see the search result "{'column':'1','name':'app对比测试.csv','contains':'no'}"

  Scenario: 在app外按照应用搜索
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading invisible
    And I choose the "ConfigsApp" from the "AppDropdown"
    And I wait for loading invisible
    Then I will see the search result contains "{'column':'1','name':'AutoTest'}"
    Then I will see the search result "{'column':'1','name':'AutoTestCopy','contains':'no'}"

  Scenario Outline: 修改app资源范围
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "<name>" then i click the "编辑" button
    Then I will see the "app.CreatePage" page
    And I wait for loading invisible
    And I click the "OverallSituation" button
    And I click the "SaveButton" button

    Examples:
      | name       |
      | ConfigsApp |

  Scenario Outline: 删除字典管理
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "ConfigsApp" then i click the "打开" button in more menu
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "ConfigsApp"
    And I click the "Dictionary" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "ConfigsApp"
    And I wait for "500" millsecond
    Then I will see the "dictionary.ListPage" page
    When the data name is "<name>" then i click the "删除" button in more menu
    And I click the "EnsureButton" button
    And I refresh the website
    Then I will see the element "EmptyText" value is "暂无数据"

    Examples:
      | name        |
      | 字典管理app.csv |
      | app对比测试.csv |

  Scenario Outline: 删除字段提取
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "ConfigsApp" then i click the "打开" button in more menu
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "ConfigsApp"
    And I wait for "500" millsecond
    Then I will see the "configs.ListPage" page
    When the data name is "{'column':'1','name':'<name>'}" then i click the "删除" button in more menu
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "删除成功"

    Examples:
      | name         |
      | AutoTest(副本) |
      | AutoTestCopy |
      | AutoTest     |


