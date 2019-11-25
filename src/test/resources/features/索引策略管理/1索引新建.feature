@indexSetting
Feature: 索引信息新建

  Background:
    Given open the "index.ListPage" page for uri "/indexsettings/indexinfo/"

  @second @indexSettingSmoke
  Scenario Outline: RZY-1474:新建
    Given I click the "AddButton" button
    Then I will see the "index.CreatePage" page
    When I set the parameter "Name" with value "<name>"
    And I set the parameter "Desc" with value "<desc>"
    And I set the parameter "SavedTime" with value "<savedTime>"
    And I set the parameter "DivideTime" with value "<divideTime>"
    And I set the parameter "SavedSize" with value "<savedSize>"
    And I choose the "<savedSizeDropDown>" from the "SavedSizeDropDown"
    And I click the "CreateButton" button
    Then I will see the <message>
    Given open the "index.ListPage" page for uri "/indexsettings/indexmatchrule/"
    When I click the "AddButton" button
    Then I will see the "index.MatchRuleCreatePage" page
    When I choose the "<name>" from the "IndexName"
    And I set the parameter "Desc" with value "AutoTest"
    And I set the parameter "Tag" with value "AutoTest"
    And I set the parameter "AppName" with value "AutoTest"
    And I click the "CreateButton" button
    Then I will see the <message>

    Examples: 新建成功
      | name       | desc     | savedTime | divideTime | savedSize | savedSizeDropDown | message                |
      | indexerror | AutoTest | 2         | 1          | 100       | MB                | success message "保存成功" |

  @second @indexSettingSmoke
  Scenario: 上传日志
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "AutoTest"
    And I set the parameter "Tag" with value "AutoTest"
    And I upload a file with name "/src/test/resources/testdata/log/apache_10.dms"
    And I click the "UploadButton" button
    And I wait for element "VerifyText" change text to "上传完成"

  @second @indexSettingSmoke
  Scenario: RZY-1474:新建索引
    Given I click the "AddButton" button
    Then I will see the "index.CreatePage" page
    When I set the parameter "Name" with value "error"
    And I set the parameter "Desc" with value "AutoTest"
    And I set the parameter "SavedTime" with value "2"
    And I set the parameter "DivideTime" with value "1"
    And I set the parameter "SavedSize" with value "100"
    And I choose the "MB" from the "SavedSizeDropDown"
    And I click the "CreateButton" button
    Then I will see the success message "保存成功"

  @second @indexSettingSmoke
  Scenario Outline: 验证1474搜索结果
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I will see the element "EventNumber" name is "(10)"

    Examples:
      | spl                                     |
      | index=indexerror * AND 'logtype':apache |

  @second @indexSettingSmoke
  Scenario Outline: RZY-1478:保存时间
    Given I click the "AddButton" button
    Then I will see the "index.CreatePage" page
    When I set the parameter "Name" with value "<name>"
    And I set the parameter "Desc" with value "<desc>"
    And I set the parameter "SavedTime" with value "<savedTime>"
    And I set the parameter "DivideTime" with value "<divideTime>"
    And I choose the "小时" from the "DivideTimeDropDown"
    And I click the "CreateButton" button
    Then I will see the success message "<message>"
    Given open the "index.ListPage" page for uri "/indexsettings/indexmatchrule/"
    When I click the "AddButton" button
    Then I will see the "index.MatchRuleCreatePage" page
    When I choose the "<name>" from the "IndexName"
    And I set the parameter "Desc" with value "<desc>"
    And I set the parameter "Tag" with value "sunxctime"
    And I set the parameter "AppName" with value "sunxctime"
    And I click the "CreateButton" button
    Then I will see the success message "<message>"
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "sunxctime"
    And I set the parameter "Tag" with value "sunxctime"
    And I upload a file with name "/src/test/resources/testdata/log/apache_10.dms"
    And I click the "UploadButton" button
    And I wait for element "VerifyText" change text to "上传完成"

    Examples: 新建成功
      | name      | desc           | savedTime | divideTime | message |
      | sunxctime | AutoTestForsxc | 1         | 12         | 保存成功    |

  @second @indexSettingSmoke
  Scenario Outline: RZY-1479:保存大小
    Given I click the "AddButton" button
    Then I will see the "index.CreatePage" page
    When I set the parameter "Name" with value "<name>"
    And I set the parameter "Desc" with value "<desc>"
    And I set the parameter "SavedTime" with value "<savedTime>"
    And I set the parameter "DivideTime" with value "<divideTime>"
    And I set the parameter "SavedSize" with value "1"
    And I choose the "MB" from the "SavedSizeDropDown"
    And I click the "CreateButton" button
    Then I will see the success message "<message>"
    Given open the "index.ListPage" page for uri "/indexsettings/indexmatchrule/"
    When I click the "AddButton" button
    Then I will see the "index.MatchRuleCreatePage" page
    When I choose the "<name>" from the "IndexName"
    And I set the parameter "Desc" with value "<desc>"
    And I set the parameter "Tag" with value "<name>"
    And I set the parameter "AppName" with value "<name>"
    And I click the "CreateButton" button
    Then I will see the success message "<message>"
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "<name>"
    And I set the parameter "Tag" with value "<name>"
    And I upload a file with name "/src/test/resources/testdata/log/h3c.txt"
    And I click the "UploadButton" button
    And I wait for element "VerifyText" change text to "上传完成"

    Examples: 新建成功
      | name      | desc               | savedTime | divideTime | message |
      | sunxcsize | AutoTestForsxcSize | 2         | 1          | 保存成功    |

  @second @indexSettingSmoke
  Scenario: RZY-1481:新建-路由规则(前提)
    Given I click the "AddButton" button
    Then I will see the "index.CreatePage" page
    When I set the parameter "Name" with value "iisidx"
    And I set the parameter "Desc" with value "AutoCreate"
    And I set the parameter "SavedTime" with value "10"
    And I set the parameter "DivideTime" with value "1"
    And I click the "CreateButton" button
    Then I will see the success message "保存成功"

  Scenario Outline: 新建失败
    Given I click the "AddButton" button
    Then I will see the "index.CreatePage" page
    When I set the parameter "Name" with value "<name>"
    And I set the parameter "Desc" with value "<desc>"
    And I set the parameter "SavedTime" with value "<savedTime>"
    And I set the parameter "DivideTime" with value "<divideTime>"
    And I set the parameter "SavedSize" with value "<savedSize>"
    And I choose the "<savedSizeDropDown>" from the "SavedSizeDropDown"
    And I click the "CreateButton" button
    Then I will see the <message>

    Examples:
      | name     | desc | savedTime | divideTime | savedSize | message                                            |
      |          |      |           |            |           | error message "名称 不能为空"                            |
      | Test     |      |           |            |           | error message "索引名应为小写字母开头，小写字母及下划线组成的长度小于32位的字符串" |
      | test     |      |           |            |           | error message "保存时间 不能为空"                          |
      | test     |      | 1         |            |           | error message "切分时间 不能为空"                          |
      | test     |      | 1         | 1          |           | error message "切分时间应小于保存时间"                        |
      | test     |      | -1        | 1          |           | error message "保存时间应为正整数"                          |
      | test     |      | 1         | 0.5        |           | error message "切分时间应为正整数"                          |
      | test     |      | 2         | 1          | 0.1       | error message "保存大小应为正整数"                          |
      | test     |      | 2         | 1          | 0         | error message "保存大小 不能为零"                          |
      | Temptest |      | 2         | 1          | -1        | error message "保存大小应为正整数"                          |

