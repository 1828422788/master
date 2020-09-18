@indexSetting
Feature: 索引信息新建

  Background:
    Given open the "index.ListPage" page for uri "/indexsettings/"


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
    And I wait for "1000" millsecond
    And I will see the element "Message" name is "保存成功"
    Given open the "index.ListPage" page for uri "/indexmatchrules/"
    When I click the "AddButton" button
    Then I will see the "index.MatchRuleCreatePage" page
    And I wait for "2000" millsecond
    When I choose the "<name>" from the "IndexName"
    And I set the parameter "Desc" with value "AutoTest"
    And I set the parameter "Tag" with value "AutoTest"
    And I set the parameter "AppName" with value "AutoTest"
    And I click the "CreateButton" button
    And I wait for "2000" millsecond
    And I will see the success message "保存成功"

    Examples: 新建成功
      | name       | desc     | savedTime | divideTime | savedSize | savedSizeDropDown |
      | indexerror | AutoTest | 2         | 1          | 100       | MB                |

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
    And I will see the element "Message" name is "保存成功"

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
    And I wait for "1000" millsecond
    And I will see the element "Message" name is "保存成功"
    Given open the "index.ListPage" page for uri "/indexmatchrules/"
    When I click the "AddButton" button
    Then I will see the "index.MatchRuleCreatePage" page
    When I choose the "<name>" from the "IndexName"
    And I set the parameter "Desc" with value "<desc>"
    And I set the parameter "Tag" with value "sunxctime"
    And I set the parameter "AppName" with value "sunxctime"
    And I click the "CreateButton" button
    And I wait for "1000" millsecond
    And I will see the success message "保存成功"
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "sunxctime"
    And I set the parameter "Tag" with value "sunxctime"
    And I upload a file with name "/src/test/resources/testdata/log/apache_10.dms"
    And I click the "UploadButton" button
    And I wait for "1000" millsecond
    And I wait for element "VerifyText" change text to "上传完成"

    Examples: 新建成功
      | name      | desc           | savedTime | divideTime |
      | sunxctime | AutoTestForsxc | 1         | 12         |

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
    And I wait for "1000" millsecond
    And I will see the element "Message" name is "保存成功"
    Given open the "index.ListPage" page for uri "/indexmatchrules/"
    When I click the "AddButton" button
    Then I will see the "index.MatchRuleCreatePage" page
    And I wait for "1000" millsecond
    When I choose the "<name>" from the "IndexName"
    And I set the parameter "Desc" with value "<desc>"
    And I set the parameter "Tag" with value "<name>"
    And I set the parameter "AppName" with value "<name>"
    And I click the "CreateButton" button
    And I wait for "1000" millsecond
    And I will see the success message "保存成功"
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "<name>"
    And I set the parameter "Tag" with value "<name>"
    And I upload a file with name "/src/test/resources/testdata/log/h3c.txt"
    And I click the "UploadButton" button
    And I wait for "1000" millsecond
    And I wait for element "VerifyText" change text to "上传完成"

    Examples: 新建成功
      | name      | desc               | savedTime | divideTime |
      | sunxcsize | AutoTestForsxcSize | 2         | 1          |

  @second @indexSettingSmoke
  Scenario: RZY-1481:新建-路由规则(前提)
    Given I click the "AddButton" button
    Then I will see the "index.CreatePage" page
    When I set the parameter "Name" with value "iisidx"
    And I set the parameter "Desc" with value "AutoCreate"
    And I set the parameter "SavedTime" with value "10"
    And I set the parameter "DivideTime" with value "1"
    And I click the "CreateButton" button
    And I wait for "1000" millsecond
    And I will see the element "Message" name is "保存成功"
    
  @second @indexSettingSmoke
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
    And I will see the element "Message" name is "<message>"


    Examples:
      | name | desc | savedTime | divideTime | savedSize | message                                            |
      |      |      |           |            |           | 名称不能为空                                            |
      | Test |      |           |            |           | 索引名应为小写字母和数字开头，小写字母、数字及下划线组成的长度小于32位的字符串 |
      | test |      |           |            |           | 保存时间不能为空                         |
      | test |      | 1         |            |           | 切分时间不能为空                          |
      | test |      | 1         | 1          |           | 切分时间应小于保存时间                        |
      | test |      | -1        | 1          |           | 保存时间应为正整数                          |
      | test |      | 1         | 0.5        |           | 切分时间应为正整数                          |
      | test |      | 2         | 1          | 0.1       | 保存大小 应为正整数                         |
      | test |      | 2         | 1          | 0         | 保存大小 应为正整数                         |

  @second @indexSettingSmoke
  Scenario: 新建索引(索引数据和副本存留)
    Given I click the "AddButton" button
    Then I will see the "index.CreatePage" page
    When I set the parameter "Name" with value "index_data"
    And I set the parameter "Desc" with value "AutoTestIndexData"
    And I set the parameter "SavedTime" with value "150"
    And I set the parameter "DivideTime" with value "10"
    And I set the parameter "SavedSize" with value "2"
    And I choose the "TB" from the "SavedSizeDropDown"
    And I choose the "2份" from the "IndexDataDropDown"
    And I switch the "副本存留" button to "checked"
    And I set the parameter "SavedCopy" with value "20"
    And I click the "CreateButton" button
    And I will see the element "Message" name is "保存成功"

  @second @indexSettingSmoke
  Scenario: 新建索引(索引冻结和索引下沉)
    Given I click the "AddButton" button
    Then I will see the "index.CreatePage" page
    When I set the parameter "Name" with value "index_sink"
    And I set the parameter "Desc" with value "AutoTestIndexSink"
    And I set the parameter "SavedTime" with value "130"
    And I set the parameter "DivideTime" with value "8"
    And I set the parameter "SavedSize" with value "5"
    And I switch the "索引冻结" button to "checked"
    And I set the parameter "Freeze" with value "30"
    And I switch the "索引下沉" button to "checked"
    And I set the parameter "SinkHDD" with value "40"
    And I set the parameter "SinkNAS" with value "50"
    And I click the "CreateButton" button
    And I will see the element "Message" name is "保存成功"

  @second @indexSettingSmoke
  Scenario Outline: 新建索引(开启副本存留)失败
    Given I click the "AddButton" button
    Then I will see the "index.CreatePage" page
    When I set the parameter "Name" with value "<name>"
    And I set the parameter "Desc" with value "<desc>"
    And I set the parameter "SavedTime" with value "<savedTime>"
    And I set the parameter "DivideTime" with value "<divideTime>"
    And I choose the "2份" from the "IndexDataDropDown"
    And I switch the "副本存留" button to "checked"
    And I set the parameter "SavedCopy" with value "<savedCopy>"
    And I click the "CreateButton" button
    And I will see the element "Message" name is "<message>"


    Examples:
      | name | desc | savedTime | divideTime | savedCopy | message                    |
      | test |      | 120       | 10         |           | 副本存留时间不能为空           |
      | test |      | 120       | 10         | abc       | 副本存留时间应为正整数          |
      | test |      | 120       | 10         | 10.8      | 副本存留时间应为正整数          |

  @second @indexSettingSmoke
  Scenario Outline: 新建索引(开启索引冻结)失败
    Given I click the "AddButton" button
    Then I will see the "index.CreatePage" page
    When I set the parameter "Name" with value "<name>"
    And I set the parameter "Desc" with value "<desc>"
    And I set the parameter "SavedTime" with value "<savedTime>"
    And I set the parameter "DivideTime" with value "<divideTime>"
    And I switch the "索引冻结" button to "checked"
    And I set the parameter "Freeze" with value "<freeze>"
    And I click the "CreateButton" button
    And I will see the element "Message" name is "<message>"



    Examples:
      | name | desc | savedTime | divideTime | freeze | message                  |
      | test |      | 120       | 10         |        | 索引冻结时间不能为空         |
      | test |      | 120       | 10         | abc    | 索引冻结时间应为正整数        |
      | test |      | 120       | 10         | 10.8   | 索引冻结时间应为正整数        |

  @second @indexSettingSmoke
  Scenario Outline: 新建索引(开启索引下沉)失败
    Given I click the "AddButton" button
    Then I will see the "index.CreatePage" page
    When I set the parameter "Name" with value "<name>"
    And I set the parameter "Desc" with value "<desc>"
    And I set the parameter "SavedTime" with value "<savedTime>"
    And I set the parameter "DivideTime" with value "<divideTime>"
    And I switch the "索引下沉" button to "checked"
    And I set the parameter "SinkHDD" with value "<hdd>"
    And I set the parameter "SinkNAS" with value "<nas>"
    And I click the "CreateButton" button
    And I will see the element "Message" name is "<message>"


    Examples:
      | name | desc | savedTime | divideTime |  hdd  |  nas  |   message                                   |
      | test |      | 120       | 10         |       |       |  请填写索引下沉到HDD时间或索引下沉到NAS时间        |
      | test |      | 120       | 10         |  abc  |       |  索引下沉到HDD时间应为正整数                     |
      | test |      | 120       | 10         |       |  1.1  |  索引下沉到NAS时间应为正整数                     |
