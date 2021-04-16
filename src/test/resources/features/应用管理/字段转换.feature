@all @smoke @app @appSmoke
Feature: 应用字段转换

  Scenario: 添加字段转换
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "AppFieldConfig" then i click the "编辑" button
    Then I will see the "app.CreatePage" page
    And I click the "FieldConfig" button
    And I wait for "FieldConvert" will be visible
    And I click the "FieldConvert" button
    And I click the "AddFieldConvert" button
    And I set the parameter "FieldConfigName" with value "AutoTest"
    And I wait for "1000" millsecond
    And I set the parameter "FieldConfigRegex" with value "c"
    And I wait for "1000" millsecond
    And I set the parameter "FieldConfigFormat" with value "auto_test::$1"
    And I click the "SaveButton" button under some element

  Scenario: 添加字段萃取
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "AppFieldConfig" then i click the "编辑" button
    Then I will see the "app.CreatePage" page
    And I click the "FieldConfig" button
    And I wait for "FieldExtract" will be visible
    And I click the "FieldExtract" button
    And I click the "AddFieldConvertRule" button
    And I set the parameter "LastNameInput" with value "AutoTest"
    And I choose the "AutoTest" from the "FieldConvertRule"
    And I click the "SaveButton" button

  Scenario: 验证正则类型字段转换生效
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "AppFieldConfig" then i click the "打开" button in more menu
    Then I will see the "splSearch.SearchPage" page
    And I set the parameter "SearchInput" with value "appname:apache"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I move the mouse pointer to the "Result"
    And I click the "RightIcon" button
    Then I will see the field "auto_test" exist

  Scenario: 添加分隔符字段转换
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "AppFieldConfig" then i click the "编辑" button
    Then I will see the "app.CreatePage" page
    And I click the "FieldConfig" button
    And I wait for "FieldConvert" will be visible
    And I click the "FieldConvert" button
    And I click the "AddFieldConvert" button
    And I set the parameter "FieldConfigName" with value "AutoTestSplit"
    And I choose the "分隔符" from the "FieldConvertRule"
    And I set the parameter "FieldConfigDelims" with value ","
    And I set the parameter "FieldConfigFields" with value "test_timestamp"
    And I click the "SaveButton" button under some element

  Scenario: 添加分隔符字段萃取
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "AppFieldConfig" then i click the "编辑" button
    Then I will see the "app.CreatePage" page
    And I click the "FieldConfig" button
    And I wait for "FieldExtract" will be visible
    And I click the "FieldExtract" button
    And I click the "AddFieldConvertRule" button
    And I set the parameter "LastNameInput" with value "AutoTestSplit"
    And I choose the "AutoTestSplit" from the "FieldConvertRule"
    And I click the "SaveButton" button

  Scenario: 验证正则类型字段转换生效
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "AppFieldConfig" then i click the "打开" button in more menu
    Then I will see the "splSearch.SearchPage" page
    And I set the parameter "SearchInput" with value "appname:apache"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I move the mouse pointer to the "Result"
    And I click the "RightIcon" button
    Then I will see the field "test_timestamp" exist