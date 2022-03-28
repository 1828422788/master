@indexSetting
Feature: 索引信息编辑（RZY-1477至1480）

  Background:
    Given open the "index.ListPage" page for uri "/indexsettings/"
    And I wait for loading invisible

  Scenario Outline:修改切分时间
    Given the data name is "{'column':'1','name':'sunxctime'}" then i click the "编辑" button
    Then I will see the "index.CreatePage" page
    And I click the "Next" button
    And I set the parameter "DivideTime" with value "<divideTime>"
    And I choose the "<divideTimeDropDown>" from the "DivideTimeDropDown"
    And I click the "Next" button
    And I wait for "1000" millsecond
    And I click the "Next" button
    And I click the "Finish" button
    And I will see the element "Message" name is "索引配置完成!"

    Examples:
      | divideTime | divideTimeDropDown |
      | 1          | 天                |
      | 1          | 月                 |
      | 1          | 年                  |
      | 1          | 小时                 |

  Scenario Outline:修改保存时间
    Given the data name is "{'column':'1','name':'iisidx'}" then i click the "编辑" button
    Then I will see the "index.CreatePage" page
    And I click the "Next" button
    And I set the parameter "SavedTime" with value "<savedTime>"
    And I choose the "<savedTimeDropDown>" from the "savedTimeDropDown"
    And I click the "Next" button
    And I wait for "1000" millsecond
    And I click the "Next" button
    And I click the "Finish" button
    And I will see the element "Message" name is "索引配置完成!"

    @indexSettingSmoke
    Examples:
      | savedTime | savedTimeDropDown |
      | 2         | 月                 |

    Examples:
      | savedTime | savedTimeDropDown |
      | 2         | 年                 |
      | 2         | 天                 |

  Scenario Outline:修改备注
    Given the data name is "{'column':'1','name':'sunxctime'}" then i click the "编辑" button
    Then I will see the "index.CreatePage" page
    And I click the "Next" button
    And I set the parameter "Desc" with value "<desc>"
    And I click the "Next" button
    And I wait for "1000" millsecond
    And I click the "Next" button
    And I click the "Finish" button
    And I will see the element "Message" name is "索引配置完成!"

    Examples:
      | desc                 |
      | AutoTestForsxc2      |
      | AutoTestForsxc中文test |

  Scenario Outline:修改保存大小
    Given the data name is "{'column':'1','name':'index_data'}" then i click the "编辑" button
    Then I will see the "index.CreatePage" page
    And I click the "Next" button
    And I set the parameter "SavedSize" with value "<savedSize>"
    And I choose the "<savedSizeDropDown>" from the "SavedSizeDropDown"
    And I click the "Next" button
    And I wait for "1000" millsecond
    And I click the "Next" button
    And I click the "Finish" button
    And I will see the element "Message" name is "索引配置完成!"
    Examples:
      | savedSize | savedSizeDropDown |
      | 100       | Byte              |
      | 100       | PB                |
      | 100       | TB                |
      | 100       | GB                |
      | 100       | KB                |
      | 100       | MB                |


  Scenario:修改索引冻结
    Given the data name is "{'column':'1','name':'index_freez'}" then i click the "编辑" button
    Then I will see the "index.CreatePage" page
    And I click the "Next" button
    And I set the parameter "Freeze" with value "60"
    And I click the "Next" button
    And I wait for "1000" millsecond
    And I click the "Next" button
    And I click the "Finish" button
    And I will see the element "Message" name is "索引配置完成!"

  Scenario:关闭冻结索引
    Given the data name is "{'column':'1','name':'index_freez'}" then i click the "编辑" button
    Then I will see the "index.CreatePage" page
    And I click the "Next" button
    And I switch the "IndexFrezee" button to "unchecked"
    And I click the "Next" button
    And I wait for "1000" millsecond
    And I click the "Next" button
    And I click the "Finish" button
    And I will see the element "Message" name is "索引配置完成!"

  Scenario:修改索引下沉hdd
    Given the data name is "{'column':'1','name':'index_sink'}" then i click the "编辑" button
    Then I will see the "index.CreatePage" page
    And I click the "Next" button
    And I click the "Next" button
    And I set the parameter "SinkHDD" with value "50"
    And I wait for "1000" millsecond
    And I click the "Next" button
    And I click the "Finish" button
    And I will see the element "Message" name is "索引配置完成!"

  Scenario:修改索引下沉nas
    Given the data name is "{'column':'1','name':'index_sink'}" then i click the "编辑" button
    Then I will see the "index.CreatePage" page
    And I click the "Next" button
    And I click the "Next" button
    And I set the parameter "SinkNAS" with value "40"
    And I wait for "1000" millsecond
    And I click the "Next" button
    And I click the "Finish" button
    And I will see the element "Message" name is "索引配置完成!"

  Scenario:修改索引数据、副本存留
    Given the data name is "{'column':'1','name':'index_data'}" then i click the "编辑" button
    Then I will see the "index.CreatePage" page
    And I click the "Next" button
    And I choose the "1份" from the "IndexDataDropDown"
#    And I switch the "CopySaveButton" button to "checked"
#    And I set the parameter "SavedCopy" with value "2"
#    这里要写成2份需要开启副本配置，详见testlink中
    And I click the "Next" button
    And I wait for "1000" millsecond
    And I click the "Next" button
    And I click the "Finish" button
    And I will see the element "Message" name is "索引配置完成!"

  Scenario:关闭索引下沉
    Given the data name is "{'column':'1','name':'index_sink'}" then i click the "编辑" button
    Then I will see the "index.CreatePage" page
    And I click the "Next" button
    And I click the "Next" button
    And I switch the "IndexSink" button to "unchecked"
    And I wait for "1000" millsecond
    And I click the "Next" button
    And I click the "Finish" button
    And I will see the element "Message" name is "索引配置完成!"


