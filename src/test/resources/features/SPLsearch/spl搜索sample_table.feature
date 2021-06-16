Feature: 搜索结果统计表格配置

  Scenario Outline: TABLE_CONFIG
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<tag>"
    And I upload a file with name "/src/test/resources/testdata/log/<log>"
    And I click the "UploadButton" button
    And I wait for element "VerifyText" change text to "上传完成"
    Then I wait for "40000" millsecond
    Given open the "splSearch.SearchPage" page for uri "/search/"
    Given I set the parameter "SearchInput" with value "*|stats count() by tag,appname,hostname"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "icon" will be visible
    And I click the "icon" button
    And I click the "tableAlignment" button
    And I click the "middle" button
    And I click the "confirm" button
    Then I wait for "3000" millsecond
    Then I will see the element "targetValue" style contains "center"
    And I click the "icon" button
    And I set the parameter "colWidth" with value "<width>"
    And I click the "confirm" button
    Then I will see the element "targetWidth" style contains "<width>"
    And I click the "icon" button
    And I click the "textStyle" button
    And I click the "italic" button
    And I click the "confirm" button
    Then I will see the element "targetValue" style contains "italic"
    And I click the "icon" button
    And I click the "colorPicker" button
    And I set the parameter "colorInput" with value "#000"
    And I click the "confirm" button
    Then I will see the element "targetValue" style contains "rgb(0, 0, 0)"

    Examples:
    | appName    | tag    | log   |   width   |
    | yottaweb   | track  | gf_dapper.txt   |   50  |