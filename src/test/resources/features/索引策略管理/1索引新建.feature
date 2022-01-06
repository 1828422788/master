@indexSetting
Feature: 索引信息新建

  Background:
    Given open the "index.ListPage" page for uri "/indexsettings/"
    And I wait for loading invisible

  @second @indexSettingSmoke
  Scenario Outline: RZY-1474:自定义模式新建
    Given I click the "AddButton" button
    Then I will see the "index.CreatePage" page
    And I click the "Next" button
    When I set the parameter "Name" with value "<name>"
    And I set the parameter "Desc" with value "<desc>"
    And I set the parameter "SavedTime" with value "<savedTime>"
    And I set the parameter "DivideTime" with value "<divideTime>"
    And I switch the "SavedSizeButton" button to "checked"
    And I choose the "<savedSizeDropDown>" from the "SavedSizeDropDown"
    And I set the parameter "SavedSize" with value "<savedSize>"
    And I set the parameter "DivideNumber" with value "<divideNumber>"
    And I click the "Next" button
    And I wait for "1000" millsecond
    And I click the "Next" button
    And I click the "Finish" button
    And I will see the element "Message" name is "索引配置完成!"
    Given open the "index.ListPage" page for uri "/indexmatchrules/"
    When I click the "AddButton" button
    Then I will see the "index.MatchRuleCreatePage" page
    And I wait for "2000" millsecond
#    When I choose the "<name>" from the "IndexName"
    And I set the parameter "Desc" with value "AutoTest"
    And I set the parameter "Tag" with value "AutoTest"
    And I set the parameter "AppName" with value "AutoTest"
    And I click the "CreateButton" button
    And I wait for "2000" millsecond
    And I will see the element "Message" name is "保存成功"

    Examples: 新建成功
      | name       | desc     | savedTime | divideTime | savedSize | savedSizeDropDown | divideNumber |
      | indexerror | AutoTest | 2         | 1          | 100       | MB                | 2            |

  @second @indexSettingSmoke
  Scenario: RZY-1474:新建索引
    Given I click the "AddButton" button
    Then I will see the "index.CreatePage" page
    And I click the "Next" button
    When I set the parameter "Name" with value "error"
    And I set the parameter "Desc" with value "AutoTest"
    And I set the parameter "SavedTime" with value "2"
    And I set the parameter "DivideTime" with value "1"
    And I set the parameter "DivideNumber" with value "1"
#    And I set the parameter "SavedSize" with value "100"
#    And I choose the "MB" from the "SavedSizeDropDown"
    And I click the "Next" button
    And I wait for "1000" millsecond
    And I click the "Next" button
    And I click the "Finish" button
    And I will see the element "Message" name is "索引配置完成!"

  @second @indexSettingSmoke @rzy1478
  Scenario Outline: RZY-1478:保存时间
    Given I click the "AddButton" button
    Then I will see the "index.CreatePage" page
    And I click the "Next" button
    When I set the parameter "Name" with value "<name>"
    And I set the parameter "Desc" with value "<desc>"
    And I set the parameter "SavedTime" with value "<savedTime>"
    And I set the parameter "DivideTime" with value "<divideTime>"
    And I choose the "小时" from the "DivideTimeDropDown"
    And I set the parameter "DivideNumber" with value "1"
    And I click the "Next" button
    And I wait for "1000" millsecond
    And I click the "Next" button
    And I click the "Finish" button
    And I will see the element "Message" name is "索引配置完成!"

    Examples: 新建成功
      | name      | desc           | savedTime | divideTime |
      | sunxctime | AutoTestForsxc | 1         | 12         |

  Scenario Outline: 创建sunxctime的路由
    Given open the "index.ListPage" page for uri "/indexmatchrules/"
    When I click the "AddButton" button
    Then I will see the "index.MatchRuleCreatePage" page
     And I wait for "2000" millsecond
    When I choose the "<name>" from the "IndexName"
    And I wait for "Desc" will be visible
    And I set the parameter "Desc" with value "<desc>"
#    And I set the parameter "Tag" with value "sunxctime"
    And I set the parameter "AppName" with value "sunxctime"
    And I wait for "3000" millsecond
    And I click the "CreateButton" button
    And I wait for "1000" millsecond
    And I will see the success message "保存成功"

    Examples: 新建成功
      | name      | desc           |
      | sunxctime | AutoTestForsxc |

  Scenario: 上传数据
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "sunxctime"
    And I set the parameter "Tag" with value "sunxctime"
    And I upload a file with name "/src/test/resources/testdata/log/apache_10.txt"
    And I click the "UploadButton" button
    And I wait for "1000" millsecond
    And I wait for element "VerifyText" change text to "上传完成"

  @second @indexSettingSmoke
  Scenario Outline: RZY-1479:保存大小
    Given I click the "AddButton" button
    Then I will see the "index.CreatePage" page
    And I click the "Next" button
    When I set the parameter "Name" with value "<name>"
    And I set the parameter "Desc" with value "<desc>"
    And I switch the "SavedSizeButton" button to "checked"
    And I set the parameter "SavedTime" with value "<savedTime>"
    And I set the parameter "DivideTime" with value "<divideTime>"
    And I set the parameter "SavedSize" with value "1"
    And I choose the "MB" from the "SavedSizeDropDown"
    And I set the parameter "DivideNumber" with value "1"
    And I click the "Next" button
    And I wait for "1000" millsecond
    And I click the "Next" button
    And I click the "Finish" button
    And I will see the element "Message" name is "索引配置完成!"
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
    And I click the "Next" button
    When I set the parameter "Name" with value "iisidx"
    And I set the parameter "Desc" with value "AutoCreate"
    And I set the parameter "SavedTime" with value "10"
    And I set the parameter "DivideTime" with value "1"
    And I set the parameter "DivideNumber" with value "1"
    And I click the "Next" button
    And I wait for "1000" millsecond
    And I click the "Next" button
    And I click the "Finish" button
    And I will see the element "Message" name is "索引配置完成!"

  @second @indexSettingSmoke
  Scenario Outline: 验证sunxctime搜索结果
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I set the parameter "SearchInput" with value "<spl>"
    And I wait for "1000" millsecond
    And I click the "DateEditor" button
    And I click the "WholeTime" button
    And I click the "SearchButton" button
    And I wait for "2000" millsecond
    And I wait for element "EventsTitle" change text to "事件列表"
    And I wait for "2000" millsecond
    And I wait for element "EventNumbers" change text to "事件(10)"

    Examples:
      | spl                                          |
      | index=sunxctime * appname:sunxctime          |

  @second @indexSettingSmoke
  Scenario Outline: 新建失败
    Given I click the "AddButton" button
    Then I will see the "index.CreatePage" page
    And I click the "Next" button
    When I set the parameter "Name" with value "<name>"
    And I set the parameter "Desc" with value "<desc>"
    And I set the parameter "SavedTime" with value "<savedTime>"
    And I set the parameter "DivideTime" with value "<divideTime>"
    And I switch the "SavedSizeButton" button to "checked"
    And I set the parameter "SavedSize" with value "<savedSize>"
    And I set the parameter "DivideNumber" with value "1"
    And I click the "Next" button
    And I will see the element "HelpMessage" name is "<HelpMessage>"


    Examples:
      | name | desc | savedTime | divideTime | savedSize | HelpMessage                                                          |
      |      |      |           |            |           | 索引名应为小写字母开头，小写字母、数字及下划线组成的长度小于32位的字符串 |
      | Test |      |           |            |           | 索引名应为小写字母开头，小写字母、数字及下划线组成的长度小于32位的字符串 |
      | ##@@ |      |           |            |           | 索引名应为小写字母开头，小写字母、数字及下划线组成的长度小于32位的字符串 |
      | 中文  |      |           |            |           | 索引名应为小写字母开头，小写字母、数字及下划线组成的长度小于32位的字符串 |
      |<name>|      |           |            |            | 索引名应为小写字母开头，小写字母、数字及下划线组成的长度小于32位的字符串 |
      | _test|      |           |            |           | 索引名应为小写字母开头，小写字母、数字及下划线组成的长度小于32位的字符串 |
      | -test|      |           |            |           | 索引名应为小写字母开头，小写字母、数字及下划线组成的长度小于32位的字符串 |
      | .    |      |           |            |           | 索引名应为小写字母开头，小写字母、数字及下划线组成的长度小于32位的字符串 |
      | ...   |      |           |            |           | 索引名应为小写字母开头，小写字母、数字及下划线组成的长度小于32位的字符串 |
      | test-index|      |       |            |           | 索引名应为小写字母开头，小写字母、数字及下划线组成的长度小于32位的字符串 |
      | test:index|      |       |            |           | 索引名应为小写字母开头，小写字母、数字及下划线组成的长度小于32位的字符串 |
      | 123_index|      |       |            |           | 索引名应为小写字母开头，小写字母、数字及下划线组成的长度小于32位的字符串 |
      | test |      | 1         |            |           | 切分时间不能为空                                  |
      | test |      |           |  1         |           | 保存时间不能为空                                  |
      | test |      | -1        | 1          |           | 保存时间应为正整数                                |
      | test |      | 1         | -1         |           | 切分时间应为正整数                                |
      | test |      | 1         | 0.5        |           | 切分时间应为正整数                                |
      | test |      | 0.5       | 1          |           | 保存时间应为正整数                                |
      | test |      | 0         | 1          |           | 保存时间不能为零                                |
      | test |      | 2         | 0          |           | 切分时间不能为零                                |
      | test |      | 2         | 1          | 0.1       | 保存大小应为正整数                                |
      | test |      | 2         | 1          | 0         | 保存大小应为正整数                                |
      | test |      | 2         | 1          | -1        | 保存大小应为正整数                                |

  @second @indexSettingSmoke
  Scenario: 新建索引(索引数据和副本存留)
    Given I click the "AddButton" button
    Then I will see the "index.CreatePage" page
    And I click the "Next" button
    When I set the parameter "Name" with value "index_data"
    And I set the parameter "Desc" with value "AutoTestIndexData"
    And I set the parameter "SavedTime" with value "150"
    And I set the parameter "DivideTime" with value "10"
    And I switch the "SavedSizeButton" button to "checked"
    And I set the parameter "SavedSize" with value "2"
    And I choose the "TB" from the "SavedSizeDropDown"
    And I set the parameter "DivideNumber" with value "1"
    And I wait for "2000" millsecond
    And I choose the "1份" from the "IndexDataDropDown"
    And I wait for "3000" millsecond
    And I click the "Next" button
    And I wait for "1000" millsecond
    And I click the "Next" button
    And I click the "Finish" button
    And I will see the element "Message" name is "索引配置完成!"

  @second @indexSettingSmoke
  Scenario: 新建索引(索引冻结)
    Given I click the "AddButton" button
    Then I will see the "index.CreatePage" page
    And I click the "Next" button
    When I set the parameter "Name" with value "index_freez"
    And I set the parameter "Desc" with value "AutoTestIndexSink"
    And I set the parameter "SavedTime" with value "130"
    And I set the parameter "DivideTime" with value "8"
    And I switch the "IndexFrezee" button to "checked"
    And I set the parameter "Freeze" with value "30"
    And I set the parameter "DivideNumber" with value "1"
    And I switch the "SavedSizeButton" button to "checked"
    And I set the parameter "SavedSize" with value "5"
    And I choose the "TB" from the "SavedSizeDropDown"
    And I click the "Next" button
    And I switch the "Sinkswitch" button to "checked"
    And I set the parameter "SinkHDD" with value "40"
    And I wait for "SinkNAS" will be visible
    And I set the parameter "SinkNAS" with value "50"
    And I wait for "3000" millsecond
    And I click the "Next" button
    And I wait for "1000" millsecond
    And I click the "Finish" button
    And I will see the element "Message" name is "索引配置完成!"

  @second @indexSettingSmoke
  Scenario Outline: 新建索引(索引冻结新建失败)
    Given I click the "AddButton" button
    Then I will see the "index.CreatePage" page
    And I click the "Next" button
    When I set the parameter "Name" with value "index_sink"
    And I set the parameter "Desc" with value "AutoTestIndexSink"
    And I set the parameter "SavedTime" with value "130"
    And I set the parameter "DivideTime" with value "8"
    And I switch the "SavedSizeButton" button to "checked"
    And I set the parameter "SavedSize" with value "5"
    And I set the parameter "DivideNumber" with value "1"
    And I switch the "IndexFrezee" button to "checked"
    And I set the parameter "Freeze" with value "<Freezetime>"
    And I choose the "TB" from the "SavedSizeDropDown"
    And I wait for "2000" millsecond
    And I click the "Next" button
    And I will see the element "HelpMessage" name is "<HelpMessage>"
    And I wait for "2000" millsecond

    Examples:
    |Freezetime| HelpMessage          |
    |          | 索引冻结时间不能为空   |
    |    ^&*   | 索引冻结时间应为正整数  |
    |    中文   | 索引冻结时间应为正整数 |
    |    nishi | 索引冻结时间应为正整数 |
    |     -2   | 索引冻结时间应为正整数 |
    |    0.1   | 索引冻结时间应为正整数 |
    |    0     | 索引冻结时间应为正整数 |


  @second @indexSettingSmoke
  Scenario: 新建索引(索引下沉)
    Given I click the "AddButton" button
    Then I will see the "index.CreatePage" page
    And I click the "Next" button
    When I set the parameter "Name" with value "index_sink"
    And I set the parameter "Desc" with value "AutoTestIndexSink"
    And I set the parameter "SavedTime" with value "20"
    And I set the parameter "DivideTime" with value "8"
    And I set the parameter "DivideNumber" with value "2"
    And I wait for "2000" millsecond
    And I click the "Next" button
    And I switch the "Sinkswitch" button to "checked"
    And I set the parameter "SinkNAS" with value "50"
    And I set the parameter "SinkHDD" with value "40"
    And I wait for "3000" millsecond
    And I click the "Next" button
    And I wait for "1000" millsecond
    And I click the "Finish" button
    And I will see the element "Message" name is "索引配置完成!"

  @second @indexSettingSmoke
  Scenario Outline: 新建索引(索引下沉失败)
    Given I click the "AddButton" button
    Then I will see the "index.CreatePage" page
    And I click the "Next" button
    When I set the parameter "Name" with value "index_sink"
    And I set the parameter "Desc" with value "AutoTestIndexSink"
    And I set the parameter "SavedTime" with value "130"
    And I set the parameter "DivideTime" with value "8"
    And I set the parameter "DivideNumber" with value "2"
    And I wait for "2000" millsecond
    And I click the "Next" button
    And I switch the "Sinkswitch" button to "checked"
    And I set the parameter "SinkHDD" with value "<SinkHDDTime>"
    And I set the parameter "SinkNAS" with value "<SinkNASTime>"
    And I click the "Next" button
    And I will see the element "HelpMessage" name is "<helpmessage>"
    Examples:
      |SinkHDDTime|SinkNASTime |  helpmessage |
      |          |             |  请填写索引下沉到HDD时间或索引下沉到NAS时间      |
      |    0     |       1     |  索引下沉到HDD时间应为正整数            |
      |    1     |       0     |  索引下沉到NAS时间应为正整数            |
      |    1     |      中文    |  索引下沉到NAS时间应为正整数           |
      |    nishi |      1      |  索引下沉到HDD时间应为正整数            |
      |     -2   |             |  索引下沉到HDD时间应为正整数            |
      |    2     |      0.1    |  索引下沉到NAS时间应为正整数            |


  @second @indexSettingSmoke
  Scenario Outline: 新建索引(开启索引冻结)失败
    Given I click the "AddButton" button
    Then I will see the "index.CreatePage" page
    And I click the "Next" button
    When I set the parameter "Name" with value "<name>"
    And I set the parameter "Desc" with value "<desc>"
    And I set the parameter "SavedTime" with value "<savedTime>"
    And I set the parameter "DivideTime" with value "<divideTime>"
    And I switch the "IndexFrezee" button to "checked"
    And I set the parameter "Freeze" with value "<freeze>"
    And I set the parameter "DivideNumber" with value "2"
    And I click the "Next" button
    And I will see the element "HelpMessage" name is "<HelpMessage>"

    Examples:
      | name | desc | savedTime | divideTime | freeze | HelpMessage     |
      | test |      | 120       | 10         |        | 索引冻结时间不能为空   |
      | test |      | 120       | 10         | abc    | 索引冻结时间应为正整数 |
      | test |      | 120       | 10         | -1     | 索引冻结时间应为正整数 |
      | test |      | 120       | 10         | 0      | 索引冻结时间应为正整数 |
      | test |      | 120       | 10         | 10.8   | 索引冻结时间应为正整数 |

  @second @indexSettingSmoke
  Scenario Outline: 新建索引(开启索引下沉)失败
    Given I click the "AddButton" button
    Then I will see the "index.CreatePage" page
    And I click the "Next" button
    When I set the parameter "Name" with value "<name>"
    And I set the parameter "Desc" with value "<desc>"
    And I set the parameter "SavedTime" with value "<savedTime>"
    And I set the parameter "DivideTime" with value "<divideTime>"
    And I set the parameter "DivideNumber" with value "2"
    And I click the "Next" button
    And I switch the "Sinkswitch" button to "checked"
    And I set the parameter "SinkHDD" with value "<hdd>"
    And I set the parameter "SinkNAS" with value "<nas>"
    And I click the "Next" button
    And I will see the element "HelpMessage" name is "<HelpMessage>"
    Examples:
      | name | desc | savedTime | divideTime | hdd | nas | HelpMessage                  |
      | test |      | 120       | 10         |     |     | 请填写索引下沉到HDD时间或索引下沉到NAS时间 |
      | test |      | 120       | 10         | abc |     | 索引下沉到HDD时间应为正整数          |
      | test |      | 120       | 10         |     | 1.1 | 索引下沉到NAS时间应为正整数          |
      | test |      | 120       | 10         |     | -1  | 索引下沉到NAS时间应为正整数          |


  @second @indexSettingSmoke
  Scenario Outline: RZY-1474:压缩模式新建
    Given I click the "AddButton" button
    Then I will see the "index.CreatePage" page
    And I click the "CompactModel" button
    And I click the "Next" button
    When I set the parameter "Name" with value "<name>"
    And I set the parameter "Desc" with value "<desc>"
    And I set the parameter "SavedTime" with value "<savedTime>"
    And I set the parameter "DivideTime" with value "<divideTime>"
    And I switch the "SavedSizeButton" button to "checked"
    And I choose the "<savedSizeDropDown>" from the "SavedSizeDropDown"
    And I set the parameter "SavedSize" with value "<savedSize>"
    And I set the parameter "DivideNumber" with value "<divideNumber>"
    And I click the "Next" button
    And I wait for "1000" millsecond
    And I click the "Next" button
    And I click the "Finish" button
    And I will see the element "Message" name is "索引配置完成!"

    Examples: 新建成功
      | name       | desc     | savedTime | divideTime | savedSize | savedSizeDropDown | divideNumber |
      | indexcompact | AutoTest | 2         | 1          | 100       | MB                | 2            |

  @second @indexSettingSmoke
  Scenario Outline: RZY-1474:压缩模式新建高级配置成功
    Given I click the "AddButton" button
    Then I will see the "index.CreatePage" page
    And I click the "CompactModel" button
    And I click the "Next" button
    When I set the parameter "Name" with value "<name>"
    And I set the parameter "Desc" with value "<desc>"
    And I set the parameter "SavedTime" with value "<savedTime>"
    And I set the parameter "DivideTime" with value "<divideTime>"
    And I switch the "SavedSizeButton" button to "checked"
    And I choose the "<savedSizeDropDown>" from the "SavedSizeDropDown"
    And I set the parameter "SavedSize" with value "<savedSize>"
    And I set the parameter "DivideNumber" with value "<divideNumber>"
    And I click the "Next" button
    And I wait for "2000" millsecond
    And I click the "AdvanceSetting" button
    And I wait for "1000" millsecond
    And I switch the "Sinkswitch" button to "checked"
    And I set the parameter "SinkNAS" with value "50"
    And I set the parameter "SinkHDD" with value "40"
    And I wait for "1000" millsecond
    And I click the "Next" button
    And I wait for "1000" millsecond
    And I click the "Finish" button
    And I will see the element "Message" name is "索引配置完成!"

    Examples: 新建成功
      | name       | desc     | savedTime | divideTime | savedSize | savedSizeDropDown | divideNumber |
      | indexcompact1 | AutoTest | 2         | 1          | 100       | MB                | 2          |

  @second @indexSettingSmoke
  Scenario Outline: RZY-1474:压缩模式新建高级配置失败
    Given I click the "AddButton" button
    Then I will see the "index.CreatePage" page
    And I click the "CompactModel" button
    And I click the "Next" button
    When I set the parameter "Name" with value "indexcompact1"
    And I set the parameter "Desc" with value "AutoTest"
    And I set the parameter "SavedTime" with value "2"
    And I set the parameter "DivideTime" with value "1"
    And I switch the "SavedSizeButton" button to "checked"
    And I set the parameter "SavedSize" with value "100"
    And I choose the "MB" from the "SavedSizeDropDown"
    And I set the parameter "DivideNumber" with value "2"
    And I click the "Next" button
    And I wait for "2000" millsecond
    And I click the "AdvanceSetting" button
    And I wait for "1000" millsecond
    And I switch the "Sinkswitch" button to "checked"
    And I set the parameter "SinkHDD" with value "<SinkHDDTime>"
    And I set the parameter "SinkNAS" with value "<SinkNASTime>"
    And I click the "Next" button
    And I will see the element "HelpMessage" name is "<helpmessage>"


    Examples: 新建失败
      |SinkHDDTime|SinkNASTime |  helpmessage |
      |          |             |  请填写索引下沉到HDD时间或索引下沉到NAS时间      |
      |    ^&*   |       1     |  索引下沉到HDD时间应为正整数            |
      |    1     |      中文    |  索引下沉到NAS时间应为正整数           |
      |    1     |      nishi  |  索引下沉到NAS时间应为正整数            |
      |     -2   |             |  索引下沉到HDD时间应为正整数            |
      |    0.1   |             |  索引下沉到HDD时间应为正整数            |

  @second @indexSettingSmoke
  Scenario Outline: RZY-1474:数值模式新建
    Given I click the "AddButton" button
    Then I will see the "index.CreatePage" page
    And I click the "NumbertModel" button
    And I click the "Next" button
    When I set the parameter "Name" with value "<name>"
    And I set the parameter "Desc" with value "<desc>"
    And I set the parameter "SavedTime" with value "<savedTime>"
    And I set the parameter "DivideTime" with value "<divideTime>"
    And I switch the "SavedSizeButton" button to "checked"
    And I choose the "<savedSizeDropDown>" from the "SavedSizeDropDown"
    And I set the parameter "SavedSize" with value "<savedSize>"
    And I set the parameter "DivideNumber" with value "<divideNumber>"
    And I click the "Next" button
    And I wait for "1000" millsecond
    And I click the "Next" button
    And I click the "Finish" button
    And I will see the element "Message" name is "索引配置完成!"

    Examples: 新建成功
      | name       | desc     | savedTime | divideTime | savedSize | savedSizeDropDown | divideNumber |
      | indexnumber | AutoTest | 2         | 1          | 100       | MB                | 2           |

  @second @indexSettingSmoke
  Scenario Outline: RZY-1474:数值模式新建高级配置成功
    Given I click the "AddButton" button
    Then I will see the "index.CreatePage" page
    And I click the "CompactModel" button
    And I click the "Next" button
    When I set the parameter "Name" with value "<name>"
    And I set the parameter "Desc" with value "<desc>"
    And I set the parameter "SavedTime" with value "<savedTime>"
    And I set the parameter "DivideTime" with value "<divideTime>"
    And I switch the "SavedSizeButton" button to "checked"
    And I choose the "<savedSizeDropDown>" from the "SavedSizeDropDown"
    And I set the parameter "SavedSize" with value "<savedSize>"
    And I set the parameter "DivideNumber" with value "<divideNumber>"
    And I click the "Next" button
    And I wait for "2000" millsecond
    And I click the "AdvanceSetting" button
    And I wait for "1000" millsecond
    And I switch the "Sinkswitch" button to "checked"
    And I set the parameter "SinkNAS" with value "50"
    And I set the parameter "SinkHDD" with value "40"
    And I wait for "1000" millsecond
    And I click the "Next" button
    And I wait for "1000" millsecond
    And I click the "Finish" button
    And I will see the element "Message" name is "索引配置完成!"

    Examples: 新建成功
      | name       | desc     | savedTime | divideTime | savedSize | savedSizeDropDown | divideNumber |
      | indexnumber1 | AutoTest | 2         | 1          | 100       | MB                | 2          |

  @second @indexSettingSmoke
  Scenario Outline: RZY-1474:数值模式新建高级配置失败
    Given I click the "AddButton" button
    Then I will see the "index.CreatePage" page
    And I click the "CompactModel" button
    And I click the "Next" button
    When I set the parameter "Name" with value "indexnumber1"
    And I set the parameter "Desc" with value "AutoTest"
    And I set the parameter "SavedTime" with value "2"
    And I set the parameter "DivideTime" with value "1"
    And I switch the "SavedSizeButton" button to "checked"
    And I set the parameter "SavedSize" with value "100"
    And I choose the "MB" from the "SavedSizeDropDown"
    And I set the parameter "DivideNumber" with value "2"
    And I click the "Next" button
    And I wait for "2000" millsecond
    And I click the "AdvanceSetting" button
    And I wait for "1000" millsecond
    And I switch the "Sinkswitch" button to "checked"
    And I set the parameter "SinkHDD" with value "<SinkHDDTime>"
    And I set the parameter "SinkNAS" with value "<SinkNASTime>"
    And I click the "Next" button
    And I will see the element "HelpMessage" name is "<helpmessage>"


    Examples: 新建失败
      |SinkHDDTime|SinkNASTime |  helpmessage |
      |          |             |  请填写索引下沉到HDD时间或索引下沉到NAS时间      |
      |    ^&*   |       1     |  索引下沉到HDD时间应为正整数            |
      |    1     |      中文    |  索引下沉到NAS时间应为正整数           |
      |    1     |      nishi  |  索引下沉到NAS时间应为正整数            |
      |     -2   |             |  索引下沉到HDD时间应为正整数            |
      |    0.1   |             |  索引下沉到HDD时间应为正整数            |


