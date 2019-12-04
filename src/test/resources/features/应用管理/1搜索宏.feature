@app @appSmoke
Feature: 应用搜索宏（RZY-2126）

  Scenario: 新建搜索宏
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "MacroApp" then i click the "打开" button
    And I will see the "app.AppPage" page
    Then I will see the element "Title" name is "MacroApp"
    Then I will see the "searchMacro.ListPage" page
    When I click the "Create" button
    And I will see the "app.AppPage" page
    Then I will see the element "OldTitle" name is "MacroApp"
    Then I will see the "searchMacro.CreatePage" page
    When I set the parameter "Name" with value "AutoTestApp"
    And I click the "Save" button
    Then I will see the success message "保存成功"

  Scenario: 编辑搜索宏
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "MacroApp" then i click the "打开" button
    And I will see the "app.AppPage" page
    Then I will see the element "Title" name is "MacroApp"
    Then I will see the "searchMacro.ListPage" page
    When the data name is "AutoTestApp" then i click the "编辑" button
    And I will see the "app.AppPage" page
    Then I will see the element "OldTitle" name is "MacroApp"
    Then I will see the "searchMacro.CreatePage" page
    When I set the parameter "Name" with value "AutoApp"
    And I click the "Save" button
    Then I will see the success message "保存成功"

  Scenario: 搜索宏标签
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "MacroApp" then i click the "打开" button
    And I will see the "app.AppPage" page
    Then I will see the element "Title" name is "MacroApp"
    Then I will see the "searchMacro.ListPage" page
    When the data name is "AutoApp" then i click the "标签" button
    And I set the parameter "Tag" with value "测试标签"
    And I choose the "测试标签" from the "TagDropdown"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "修改成功"

  Scenario: 根据标签查找
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "MacroApp" then i click the "打开" button
    And I will see the "app.AppPage" page
    Then I will see the element "Title" name is "MacroApp"
    Then I will see the "searchMacro.ListPage" page
    And I wait for loading invisible
    When I choose the "测试标签" from the "ResourceDropdown"
    And I wait for loading invisible
    Then I will see the search result "AutoApp"
    And I will see the "app.AppPage" page
    Then I will see the element "Title" name is "MacroApp"

  Scenario: 按名称搜索搜索宏
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "MacroApp" then i click the "打开" button
    And I will see the "app.AppPage" page
    Then I will see the element "Title" name is "MacroApp"
    Then I will see the "searchMacro.ListPage" page
    When I set the parameter "SearchInput" with value "AutoApp"
    And I click the "Search" button
    And I wait for loading invisible
    Then I will see the search result "AutoApp"
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "MacroApp"

  Scenario: 按照应用搜索
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    And I wait for loading invisible
    And I choose the "MacroApp" from the "AppDropdown"
    And I wait for loading invisible
    Then I will see the search result contains "AutoApp"

  Scenario: 取消所属应用
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "MacroApp" then i click the "打开" button
    And I will see the "app.AppPage" page
    Then I will see the element "Title" name is "MacroApp"
    Then I will see the "searchMacro.ListPage" page
    When the data name is "AutoApp" then i click the "编辑" button
    And I will see the "app.AppPage" page
    Then I will see the element "OldTitle" name is "MacroApp"
    Then I will see the "searchMacro.CreatePage" page
    And I click the "DeleteApp" button
    And I click the "Save" button
    Then I will see the success message "保存成功"
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "MacroApp" then i click the "打开" button
    And I will see the "app.AppPage" page
    Then I will see the element "Title" name is "MacroApp"
    Then I will see the "searchMacro.ListPage" page
    Then I will see the search result "{'column':'0','name':'AutoApp','contains':'no'}"

  Scenario: 验证应用搜索
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    And I wait for loading invisible
    And I choose the "MacroApp" from the "AppDropdown"
    And I wait for loading invisible
    Then I will see the search result "{'column':'0','name':'AutoApp','contains':'no'}"

  Scenario: 选择应用
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    When the data name is "AutoApp" then i click the "编辑" button
    Then I will see the "searchMacro.CreatePage" page
    And I choose the "MacroApp" from the "App"
    And I click the "Save" button
    Then I will see the success message "保存成功"

  Scenario: 搜索宏删除
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "MacroApp" then i click the "打开" button
    And I will see the "app.AppPage" page
    Then I will see the element "Title" name is "MacroApp"
    Then I will see the "searchMacro.ListPage" page
    When the data name is "AutoApp" then i click the "删除" button
    And I click the "Ensure" button
    Then I wait for element "Message" change text to "删除成功"
