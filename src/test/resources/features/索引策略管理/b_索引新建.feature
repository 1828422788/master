@indexSetting
Feature: 索引信息新建

  Background:
    Given open the "index.ListPage" page for uri "/indexsettings/"
    And I wait for loading invisible

  @indexSettingSmoke
  Scenario Outline: RZY-1474:自定义模式新建
    Given I click the "AddButton" button
    Then I will see the "index.CreatePage" page
    And I click the "CustomModel" button
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
    And I set the parameter "Desc" with value "AutoTest"
    And I set the parameter "Tag" with value "AutoTest"
    And I set the parameter "AppName" with value "AutoTest"
    And I click the "CreateButton" button
    And I will see the element "Message" name is "保存成功"

    Examples: 新建成功
      | name       | desc     | savedTime | divideTime | savedSize | savedSizeDropDown | divideNumber |
      | indexerror | AutoTest | 2         | 1          | 100       | MB                | 2            |

  @indexSettingSmoke
  Scenario: RZY-1474:新建索引
    Given I click the "AddButton" button
    Then I will see the "index.CreatePage" page
    And I click the "CustomModel" button
    And I click the "Next" button
    When I set the parameter "Name" with value "error"
    And I set the parameter "Desc" with value "AutoTest"
    And I set the parameter "SavedTime" with value "2"
    And I set the parameter "DivideTime" with value "1"
    And I set the parameter "DivideNumber" with value "1"
    And I click the "Next" button
    And I wait for "1000" millsecond
    And I click the "Next" button
    And I click the "Finish" button
    And I will see the element "Message" name is "索引配置完成!"

  Scenario Outline: RZY-1478:新建索引（保存时间）
    Given I click the "AddButton" button
    Then I will see the "index.CreatePage" page
    And I click the "CustomModel" button
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
    When I choose the "<name>" from the "IndexName"
    And I wait for "Desc" will be visible
    And I set the parameter "Desc" with value "<desc>"
    And I set the parameter "AppName" with value "sunxctime"
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

  Scenario Outline: RZY-1479:新建索引（保存大小）
    Given I click the "AddButton" button
    Then I will see the "index.CreatePage" page
    And I click the "CustomModel" button
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
    When I choose the "<name>" from the "IndexName"
    And I wait for "Desc" will be visible
    And I set the parameter "Desc" with value "<desc>"
    And I set the parameter "Tag" with value "<name>"
    And I set the parameter "AppName" with value "<name>"
    And I click the "CreateButton" button
    And I will see the success message "保存成功"
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "<name>"
    And I set the parameter "Tag" with value "<name>"
    And I upload a file with name "/src/test/resources/testdata/log/h3c.txt"
    And I click the "UploadButton" button
    And I wait for element "VerifyText" change text to "上传完成"

    Examples: 新建成功
      | name      | desc               | savedTime | divideTime |
      | sunxcsize | AutoTestForsxcSize | 2         | 1          |

  @indexSettingSmoke
  Scenario: RZY-1481:新建索引-用于路由测试
    Given I click the "AddButton" button
    Then I will see the "index.CreatePage" page
    And I click the "CustomModel" button
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

  Scenario Outline: 验证sunxctime搜索结果
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I set the parameter "SearchInput" with value "<spl>"
    And I wait for "1000" millsecond
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for element "EventsTitle" change text to "事件列表"
    And I wait for element "EventNumbers" change text to "事件(10)"

    Examples:
      | spl                                          |
      | index=sunxctime * appname:sunxctime          |

  Scenario Outline: 新建失败
    Given I click the "AddButton" button
    Then I will see the "index.CreatePage" page
    And I click the "CustomModel" button
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

  Scenario: 新建索引(索引数据和副本存留)
    Given I click the "AddButton" button
    Then I will see the "index.CreatePage" page
    And I click the "CustomModel" button
    And I click the "Next" button
    When I set the parameter "Name" with value "index_data"
    And I set the parameter "Desc" with value "AutoTestIndexData"
    And I set the parameter "SavedTime" with value "150"
    And I set the parameter "DivideTime" with value "10"
    And I switch the "SavedSizeButton" button to "checked"
    And I set the parameter "SavedSize" with value "2"
    And I choose the "TB" from the "SavedSizeDropDown"
    And I set the parameter "DivideNumber" with value "1"
    And I choose the "1份" from the "IndexDataDropDown"
    And I click the "Next" button
    And I wait for "1000" millsecond
    And I click the "Next" button
    And I click the "Finish" button
    And I will see the element "Message" name is "索引配置完成!"

  Scenario: 新建索引(索引冻结)
    Given I click the "AddButton" button
    Then I will see the "index.CreatePage" page
    And I click the "CustomModel" button
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
    And I click the "Next" button
    And I wait for "1000" millsecond
    And I click the "Finish" button
    And I will see the element "Message" name is "索引配置完成!"

  Scenario Outline: 新建索引(索引冻结新建失败)
    Given I click the "AddButton" button
    Then I will see the "index.CreatePage" page
    And I click the "CustomModel" button
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
    And I click the "Next" button
    And I will see the element "HelpMessage" name is "<HelpMessage>"

    Examples:
    |Freezetime| HelpMessage          |
    |          | 索引冻结时间不能为空   |
    |    ^&*   | 索引冻结时间应为正整数  |
    |    中文   | 索引冻结时间应为正整数 |
    |    nishi | 索引冻结时间应为正整数 |
    |     -2   | 索引冻结时间应为正整数 |
    |    0.1   | 索引冻结时间应为正整数 |
    |    0     | 索引冻结时间应为正整数 |

  Scenario: 新建索引(索引下沉)
    Given I click the "AddButton" button
    Then I will see the "index.CreatePage" page
    And I click the "CustomModel" button
    And I click the "Next" button
    When I set the parameter "Name" with value "index_sink"
    And I set the parameter "Desc" with value "AutoTestIndexSink"
    And I set the parameter "SavedTime" with value "20"
    And I set the parameter "DivideTime" with value "8"
    And I set the parameter "DivideNumber" with value "2"
    And I click the "Next" button
    And I switch the "Sinkswitch" button to "checked"
    And I set the parameter "SinkNAS" with value "50"
    And I set the parameter "SinkHDD" with value "40"
    And I click the "Next" button
    And I wait for "1000" millsecond
    And I click the "Finish" button
    And I will see the element "Message" name is "索引配置完成!"

  Scenario Outline: 新建索引(索引下沉失败)
    Given I click the "AddButton" button
    Then I will see the "index.CreatePage" page
    And I click the "CustomModel" button
    And I click the "Next" button
    When I set the parameter "Name" with value "index_sink"
    And I set the parameter "Desc" with value "AutoTestIndexSink"
    And I set the parameter "SavedTime" with value "130"
    And I set the parameter "DivideTime" with value "8"
    And I set the parameter "DivideNumber" with value "2"
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

  Scenario Outline: 新建索引(开启索引冻结)失败
    Given I click the "AddButton" button
    Then I will see the "index.CreatePage" page
    And I click the "CustomModel" button
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

  Scenario Outline: 新建索引(开启索引下沉)失败
    Given I click the "AddButton" button
    Then I will see the "index.CreatePage" page
    And I click the "CustomModel" button
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

  @indexSettingSmoke
  Scenario Outline: 压缩模式新建
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

  Scenario Outline: 压缩模式新建高级配置成功
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
    And I click the "AdvanceSetting" button
    And I switch the "Sinkswitch" button to "checked"
    And I set the parameter "SinkNAS" with value "50"
    And I set the parameter "SinkHDD" with value "40"
    And I click the "Next" button
    And I click the "Finish" button
    And I will see the element "Message" name is "索引配置完成!"

    Examples: 新建成功
      | name       | desc     | savedTime | divideTime | savedSize | savedSizeDropDown | divideNumber |
      | indexcompact1 | AutoTest | 2         | 1          | 100       | MB                | 2          |

  Scenario Outline: 压缩模式新建高级配置失败
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

  @indexSettingSmoke
  Scenario Outline: 数值模式新建
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

  Scenario Outline:数值模式新建高级配置成功
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
    And I click the "AdvanceSetting" button
    And I wait for "1000" millsecond
    And I switch the "Sinkswitch" button to "checked"
    And I set the parameter "SinkNAS" with value "50"
    And I set the parameter "SinkHDD" with value "40"
    And I click the "Next" button
    And I click the "Finish" button
    And I will see the element "Message" name is "索引配置完成!"

    Examples: 新建成功
      | name       | desc     | savedTime | divideTime | savedSize | savedSizeDropDown | divideNumber |
      | indexnumber1 | AutoTest | 2         | 1          | 100       | MB                | 2          |

  Scenario Outline: 数值模式新建高级配置失败
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
    And I click the "AdvanceSetting" button
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

  Scenario Outline: 丢弃部分内置字段
    Given I click the "AddButton" button
    Then I will see the "index.CreatePage" page
    And I click the "CustomModel" button
    And I click the "Next" button
    When I set the parameter "Name" with value "<name>"
    And I set the parameter "Desc" with value "<desc>"
    And I set the parameter "SavedTime" with value "<savedTime>"
    And I set the parameter "DivideTime" with value "<divideTime>"
    And I set the parameter "DivideNumber" with value "<divideNumber>"
    And I click the "Next" button
    And I switch the "ReduceInnerFieldsSwitch" button to "checked"
    And I wait for "1000" millsecond
    And I click the "Next" button
    And I wait for element "ReduceInnerFields" change text to "丢弃部分内置字段: 已启用"
    And I click the "Finish" button
    And I will see the element "Message" name is "索引配置完成!"

    Examples: 新建成功
      | name                   | desc                   | savedTime | divideTime | divideNumber |
      | ln_reduce_inner_fields | ln_reduce_inner_fields | 2         | 1          |  2           |

  Scenario Outline: 字段删减配置_简易模式
    Given I click the "AddButton" button
    Then I will see the "index.CreatePage" page
    And I click the "CustomModel" button
    And I click the "Next" button
    When I set the parameter "Name" with value "<name>"
    And I set the parameter "Desc" with value "<desc>"
    And I set the parameter "SavedTime" with value "<savedTime>"
    And I set the parameter "DivideTime" with value "<divideTime>"
    And I wait for "1000" millsecond
    And I choose the "小时" from the "DivideTimeDropDown"
    And I click the "Next" button
    And I switch the "DataReduceSwitch" button to "checked"
    And I set the parameter "ReduceAfterInput" with value "5"
    When I choose the "<SimpleStrategyData>" from the "SimpleStrategyList"
    And I wait for "1000" millsecond
    And I click the "Next" button
    And I wait for element "DataReduceMessage" change text to "<dataReduceMessage>"
    And I click the "Finish" button
    And I will see the element "Message" name is "索引配置完成!"

    Examples: 新建成功
      | name                          | desc                            | savedTime | divideTime| SimpleStrategyData              | dataReduceMessage|
      | ln_data_reduce_keep_all_inner | ln_data_reduce_keep_all_inner   | 10        | 6         | 只保留内部字段的倒排、正排和docvalue | 字段删减配置: 已启用 (5天后只保留内部字段的倒排、正排和docvalue; 无高级模式)|
      | ln_data_reduce_search_only     | ln_data_reduce_search_only  | 10        | 6         | 只保留内部字段的倒排和正排，丢弃docvalue| 字段删减配置: 已启用 (5天后只保留内部字段的倒排和正排，丢弃docvalue; 无高级模式)|
      | ln_data_reduce_without_docvalue | ln_data_reduce_without_docvalue | 10        | 6         |丢弃所有的docvalue                    | 字段删减配置: 已启用 (5天后丢弃所有的docvalue; 无高级模式)            |

  Scenario Outline: 字段删减配置_简易模式执行计划校验
    Given I click the "AddButton" button
    Then I will see the "index.CreatePage" page
    And I click the "CustomModel" button
    And I click the "Next" button
    When I set the parameter "Name" with value "<name>"
    And I set the parameter "Desc" with value "<desc>"
    And I set the parameter "SavedTime" with value "<savedTime>"
    And I set the parameter "DivideTime" with value "<divideTime>"
    And I wait for "1000" millsecond
    And I choose the "小时" from the "DivideTimeDropDown"
    And I click the "Next" button
    And I switch the "DataReduceSwitch" button to "checked"
    And I set the parameter "ReduceAfterInput" with value "5"
    When I choose the "<SimpleStrategyData>" from the "SimpleStrategyList"
    And I wait for "1000" millsecond
    And I click the "Next" button
    And I wait for element "DialogMessage" change text to "字段配置由于执行代价大，优先级低，不建议配置执行计划小于切分时间*15，是否确定下一步？"
    And I click the "Ensure" button
    And I wait for element "DataReduceMessage" change text to "<dataReduceMessage>"
    And I click the "Finish" button
    And I will see the element "Message" name is "索引配置完成!"

    Examples: 新建成功
      | name                   | desc                   | savedTime | divideTime| SimpleStrategyData              | dataReduceMessage|
      | ln_data_reduce_sample_dialog | ln_data_reduce_sample_dialog | 10        | 12         | 只保留内部字段的倒排、正排和docvalue | 字段删减配置: 已启用 (5天后只保留内部字段的倒排、正排和docvalue; 无高级模式)|

  Scenario Outline: 字段删减配置_高级模式_保留
    Given I click the "AddButton" button
    Then I will see the "index.CreatePage" page
    And I click the "CustomModel" button
    And I click the "Next" button
    When I set the parameter "Name" with value "<name>"
    And I set the parameter "Desc" with value "<desc>"
    And I set the parameter "SavedTime" with value "<savedTime>"
    And I set the parameter "DivideTime" with value "<divideTime>"
    And I wait for "1000" millsecond
    And I choose the "小时" from the "DivideTimeDropDown"
    And I click the "Next" button
    And I switch the "DataReduceSwitch" button to "checked"
    And I set the parameter "ReduceAfterInput" with value "5"

    And I click the "AddAdvancedStrategy" button
    When I choose the "保留倒排索引的字段" from the "AdvancedStrategyList"
    And I set the parameter "StrategyFieldsInput" with value "apache.status,apache.clientip,appname,tag,hostname"

    And I click the "AddAdvancedStrategy" button
    When I choose the "保留正排索引的字段" from the "AdvancedStrategyList"
    And I set the parameter "StrategyFieldsInput" with value "raw_message,appname,hostname,logtype,tag,apache.status,apache.clientip,apache.geo.city"

    And I click the "AddAdvancedStrategy" button
    When I choose the "保留docvalue的字段" from the "AdvancedStrategyList"
    And I set the parameter "StrategyFieldsInput" with value "apache.status"

    And I wait for "1000" millsecond
    And I click the "Next" button
    And I wait for element "DataReduceMessage" change text to "字段删减配置: 已启用 (5天后无简易模式; 保留倒排索引的字段为apache.status,apache.clientip,appname,tag,hostname;保留正排索引的字段为raw_message,appname,hostname,logtype,tag,apache.status,apache.clientip,apache.geo.city;保留docvalue的字段为apache.status;)"
    And I click the "Finish" button
    And I will see the element "Message" name is "索引配置完成!"

    Examples: 新建成功
      | name                      | desc                      | savedTime | divideTime |
      | ln_data_reduce_senior_keep | ln_data_reduce_senior_keep | 10         | 6          |

  Scenario Outline: 字段删减配置_高级模式_丢弃
    Given I click the "AddButton" button
    Then I will see the "index.CreatePage" page
    And I click the "CustomModel" button
    And I click the "Next" button
    When I set the parameter "Name" with value "<name>"
    And I set the parameter "Desc" with value "<desc>"
    And I set the parameter "SavedTime" with value "<savedTime>"
    And I set the parameter "DivideTime" with value "<divideTime>"
    And I wait for "1000" millsecond
    And I choose the "小时" from the "DivideTimeDropDown"
    And I click the "Next" button
    And I switch the "DataReduceSwitch" button to "checked"
    And I set the parameter "ReduceAfterInput" with value "5"

    And I click the "AddAdvancedStrategy" button
    When I choose the "丢弃倒排索引的字段" from the "AdvancedStrategyList"
    And I set the parameter "StrategyFieldsInput" with value "apache.status"

    And I click the "AddAdvancedStrategy" button
    When I choose the "丢弃正排索引的字段" from the "AdvancedStrategyList"
    And I set the parameter "StrategyFieldsInput" with value "apache.clientip"

    And I click the "AddAdvancedStrategy" button
    When I choose the "丢弃docvalue的字段" from the "AdvancedStrategyList"
    And I set the parameter "StrategyFieldsInput" with value "apache.geo.city"

    And I wait for "1000" millsecond
    And I click the "Next" button
    And I wait for element "DataReduceMessage" change text to "字段删减配置: 已启用 (5天后无简易模式; 丢弃倒排索引的字段为apache.status;丢弃正排索引的字段为apache.clientip;丢弃docvalue的字段为apache.geo.city;)"
    And I click the "Finish" button
    And I will see the element "Message" name is "索引配置完成!"

    Examples: 新建成功
      | name                   | desc                  | savedTime | divideTime |
      | ln_data_reduce_senior_abandon | ln_data_reduce_senior_abandon | 10         | 6          |

  Scenario Outline: 字段删减配置_高级模式_为空失败
    Given I click the "AddButton" button
    Then I will see the "index.CreatePage" page
    And I click the "CustomModel" button
    And I click the "Next" button
    When I set the parameter "Name" with value "<name>"
    And I set the parameter "Desc" with value "<desc>"
    And I set the parameter "SavedTime" with value "<savedTime>"
    And I set the parameter "DivideTime" with value "<divideTime>"
    And I wait for "1000" millsecond
    And I choose the "小时" from the "DivideTimeDropDown"

    And I click the "Next" button
    And I switch the "DataReduceSwitch" button to "checked"
    And I set the parameter "ReduceAfterInput" with value "5"

    And I click the "AddAdvancedStrategy" button
    When I choose the "丢弃倒排索引的字段" from the "AdvancedStrategyList"

    And I wait for "1000" millsecond
    And I click the "Next" button

    And I wait for element "DialogMessage" change text to "高级模式 字段 不能为空"
    And I click the "Ensure" button

    Examples: 新建成功
      | name                   | desc                  | savedTime | divideTime |
      | ln_data_reduce_senior_abandon | ln_data_reduce_senior_abandon | 10         | 6          |

  Scenario Outline: 字段删减配置_高级模式_执行计划校验失败
    Given I click the "AddButton" button
    Then I will see the "index.CreatePage" page
    And I click the "CustomModel" button
    And I click the "Next" button
    When I set the parameter "Name" with value "<name>"
    And I set the parameter "Desc" with value "<desc>"
    And I set the parameter "SavedTime" with value "<savedTime>"
    And I set the parameter "DivideTime" with value "<divideTime>"
    And I click the "Next" button
    And I switch the "DataReduceSwitch" button to "checked"
    And I set the parameter "ReduceAfterInput" with value "<ReduceAfterInput>"

    And I click the "AddAdvancedStrategy" button
    When I choose the "丢弃倒排索引的字段" from the "AdvancedStrategyList"
    And I set the parameter "StrategyFieldsInput" with value "apache.status"

    And I wait for "1000" millsecond
    And I click the "Next" button
    And I will see the element "HelpMessage" name is "<helpmessage>"

    Examples: 新建成功
      | name                          | desc                          | savedTime  | divideTime | ReduceAfterInput|  helpmessage|
      | ln_data_reduce_senior_abandon | ln_data_reduce_senior_abandon | 10         | 1          |1                |执行计划时间至少为5天 |
      | ln_data_reduce_senior_abandon | ln_data_reduce_senior_abandon | 10         | 1          |5                |执行计划时间应大于等于7倍的切分时间，小于保存时间。建议配置执行计划=切分时间*30 |

  Scenario Outline: 字段删减配置_组合
    Given I click the "AddButton" button
    Then I will see the "index.CreatePage" page
    And I click the "CustomModel" button
    And I click the "Next" button
    When I set the parameter "Name" with value "<name>"
    And I set the parameter "Desc" with value "<desc>"
    And I set the parameter "SavedTime" with value "<savedTime>"
    And I set the parameter "DivideTime" with value "<divideTime>"
    And I wait for "1000" millsecond
    And I choose the "小时" from the "DivideTimeDropDown"

    And I click the "Next" button
    And I switch the "DataReduceSwitch" button to "checked"
    And I set the parameter "ReduceAfterInput" with value "5"

    When I choose the "只保留内部字段的倒排、正排和docvalue" from the "SimpleStrategyList"
    And I wait for "1000" millsecond

    And I click the "AddAdvancedStrategy" button
    When I choose the "丢弃docvalue的字段" from the "AdvancedStrategyList"
    And I set the parameter "StrategyFieldsInput" with value "apache.geo.city"

    And I wait for "1000" millsecond
    And I click the "Next" button
    And I wait for element "DataReduceMessage" change text to "字段删减配置: 已启用 (5天后只保留内部字段的倒排、正排和docvalue; 丢弃docvalue的字段为apache.geo.city;)"
    And I click the "Finish" button
    And I will see the element "Message" name is "索引配置完成!"

    Examples: 新建成功
      | name                   | desc                  | savedTime | divideTime |
      | ln_data_reduce_collocation | ln_data_reduce_collocation | 10         | 6          |




