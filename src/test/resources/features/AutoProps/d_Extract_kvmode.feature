@autoprops @extract @autopropsSmoke
Feature: 字段萃取_kvmode
  #  详细功能参见testlink中RZY-5402隶属文件夹【kv_mode】中的配置

  Background:
    Given open the "autoProps.ListPage" page for uri "/fieldconfig/"

  Scenario: 添加字段萃取_kvmode
    When the data name is "default_search" then i click the "编辑" button
    Then I will see the "autoProps.CreatePage" page

    And I wait for "Extract" will be visible
    And I click the "Extract" button

    And I wait for "KVText" will be visible
    And I click the "KVSwitch" button
    And I choose the "auto" from the "KVMode"
    And I wait for "1000" millsecond
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"

  Scenario Outline: 上传kv_mode相关数据
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "<appname>"
    And I set the parameter "Tag" with value "<tag>"
    And I upload a file with name "<name>"
    And I click the "UploadButton" button
    And I wait for element "VerifyText" change text to "上传完成"

    Examples:
      | appname  | tag   |  name                                            |
      | autokv   | autokv    | /src/test/resources/testdata/log/autokv.txt  |
      | autojson | autojson  | /src/test/resources/testdata/log/autojson.txt|
      | autoxml  | autoxml   | /src/test/resources/testdata/log/autoxml.txt |

  Scenario: 验证kvmode_auto
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "* | stats count() by appname,KVFrom,KVTo"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for element "StatsNum" change text to "统计(1)"

  Scenario: 修改kvmode_json
    When the data name is "default_search" then i click the "编辑" button
    Then I will see the "autoProps.CreatePage" page

    And I wait for "Extract" will be visible
    And I click the "Extract" button

    And I wait for "KVText" will be visible
    And I choose the "json" from the "KVMode"
    And I wait for "1000" millsecond
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"

  Scenario: 验证kvmode_json
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "* | stats count() by appname,'programmers{}.email','musicians{}.firstName'"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for element "StatsNum" change text to "统计(6)"

  Scenario: 修改kvmode_xml
    When the data name is "default_search" then i click the "编辑" button
    Then I will see the "autoProps.CreatePage" page

    And I wait for "Extract" will be visible
    And I click the "Extract" button
    And I wait for "KVText" will be visible
    And I choose the "xml" from the "KVMode"
    And I wait for "1000" millsecond
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"

  Scenario: 验证kvmode_xml
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "appname:autoxml | stats count() by 'note.from','note.heading','note.body'"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for element "StatsNum" change text to "统计(1)"

  Scenario: 关闭kvmode
    When the data name is "default_search" then i click the "编辑" button
    Then I will see the "autoProps.CreatePage" page

    And I wait for "Extract" will be visible
    And I click the "Extract" button

    And I wait for "KVText" will be visible
    And I click the "KVSwitch" button
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"

  Scenario: 验证关闭成功
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "appname:autoxml | stats count() by 'note.from','note.heading','note.body'"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for element "StatsNum" change text to "统计(0)"











