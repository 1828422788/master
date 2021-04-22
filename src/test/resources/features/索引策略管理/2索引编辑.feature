@indexSetting @indexSettingSmoke @third
Feature: 索引信息编辑（RZY-1477至1480）

  Background:
    Given open the "index.ListPage" page for uri "/indexsettings/"
    And I wait for loading invisible

  Scenario Outline:修改切分时间成功
    Given the data name is "{'column':'2','name':'AutoTestForsxc'}" then i click the "编辑" button without paging
    Then I will see the "index.CreatePage" page
    And I set the parameter "DivideTime" with value "<divideTime>"
    And I choose the "<divideTimeDropDown>" from the "DivideTimeDropDown"
    And I click the "SavedButton" button
    And I will see the element "Message" name is "<message>"

    Examples:
      | divideTime | divideTimeDropDown | message     |
      | 1          | 小时                 | 保存成功        |
  Scenario Outline:修改切分时间
    Given the data name is "{'column':'2','name':'AutoTestForsxc'}" then i click the "编辑" button without paging
    Then I will see the "index.CreatePage" page
    And I set the parameter "DivideTime" with value "<divideTime>"
    And I choose the "<divideTimeDropDown>" from the "DivideTimeDropDown"
    And I click the "SavedButton" button
#    And I will see the element "Message" name is "<message>"

    Examples:
      | divideTime | divideTimeDropDown | message     |
      | 1          | 月                  | 切分时间应小于保存时间 |

  Scenario Outline:修改切分时间
    Given the data name is "{'column':'2','name':'AutoTestForsxc'}" then i click the "编辑" button without paging
    Then I will see the "index.CreatePage" page
    And I set the parameter "DivideTime" with value "<divideTime>"
    And I choose the "<divideTimeDropDown>" from the "DivideTimeDropDown"
    And I click the "SavedButton" button
#    And I will see the element "Message" name is "<message>"

    Examples:
      | divideTime | divideTimeDropDown | message     |
      | 1          | 年                  | 切分时间应小于保存时间 |

  Scenario Outline:修改切分时间3
    Given the data name is "{'column':'2','name':'AutoTestForsxc'}" then i click the "编辑" button without paging
    Then I will see the "index.CreatePage" page
    And I set the parameter "DivideTime" with value "<divideTime>"
    And I choose the "<divideTimeDropDown>" from the "DivideTimeDropDown"
    And I click the "SavedButton" button
    And I will see the element "Message" name is "<message>"

    Examples:
      | divideTime | divideTimeDropDown | message     |
      | 1          | 天                  | 保存成功        |
  Scenario Outline:修改保存大小
    Given the data name is "{'column':'1','name':'index_data'}" then i click the "编辑" button without paging
    Then I will see the "index.CreatePage" page
    And I set the parameter "SavedSize" with value "<savedSize>"
    And I choose the "<savedSizeDropDown>" from the "SavedSizeDropDown"
    And I click the "SavedButton" button
    And I will see the element "Message" name is "<message>"
    Examples:
      | savedSize | savedSizeDropDown | message                |
      | 100       | Byte              | 保存成功 |
      | 100       | PB                | 保存成功|
      | 100       | TB                |  保存成功 |
      | 100       | GB                | 保存成功|
      | 100       | KB                | 保存成功 |
      | 100       | MB                | 保存成功 |

  Scenario Outline:修改保存时间
    Given the data name is "{'column':'2','name':'AutoTestForsxc'}" then i click the "编辑" button without paging
    Then I will see the "index.CreatePage" page
    And I set the parameter "SavedTime" with value "<savedTime>"
    And I choose the "<savedTimeDropDown>" from the "savedTimeDropDown"
    And I click the "SavedButton" button
    And I will see the element "Message" name is "<message>"

    Examples:
      | savedTime | savedTimeDropDown | message     |
      | 2         | 月                 | 保存成功 |
      | 2         | 年                 | 保存成功 |
      | 2         | 天                 | 保存成功        |


  Scenario Outline:修改备注
    Given the data name is "{'column':'2','name':'AutoTestForsxc'}" then i click the "编辑" button without paging
    Then I will see the "index.CreatePage" page
    And I set the parameter "Desc" with value "<desc>"
    And I click the "SavedButton" button
    And I will see the element "Message" name is "<message>"

    Examples:
      | desc                 | message |
      | AutoTestForsxc2      | 保存成功    |
      | AutoTestForsxc中文test | 保存成功    |

  Scenario:修改索引冻结
    Given the data name is "{'column':'1','name':'index_freez'}" then i click the "编辑" button without paging
    Then I will see the "index.CreatePage" page
    And I set the parameter "Freeze" with value "60"
    And I click the "SavedButton" button
    And I will see the element "Message" name is "保存成功"

  Scenario:关闭冻结索引
    Given the data name is "{'column':'1','name':'index_freez'}" then i click the "编辑" button without paging
    Then I will see the "index.CreatePage" page
    And I switch the "IndexFrezee" button to "unchecked"
    And I click the "SavedButton" button
    And I will see the element "Message" name is "保存成功"

  Scenario:修改索引下沉hdd
    Given the data name is "{'column':'1','name':'index_sink'}" then i click the "编辑" button without paging
    Then I will see the "index.CreatePage" page
    And I set the parameter "SinkHDD" with value "50"
    And I set the parameter "SinkNAS" with value "50"
    And I click the "SavedButton" button
    And I will see the element "Message" name is "保存成功"

  Scenario:修改索引下沉nas
    Given the data name is "{'column':'1','name':'index_sink'}" then i click the "编辑" button without paging
    Then I will see the "index.CreatePage" page
    And I set the parameter "SinkNAS" with value "60"
  Scenario:修改索引数据
    Given the data name is "{'column':'1','name':'index_data'}" then i click the "编辑" button without paging
    Then I will see the "index.CreatePage" page
    And I choose the "1份" from the "IndexDataDropDown"
    And I click the "SavedButton" button
    And I will see the element "Message" name is "保存成功"

  Scenario:修改索引冻结
    Given the data name is "{'column':'1','name':'index_sink'}" then i click the "编辑" button without paging
    Then I will see the "index.CreatePage" page
    And I set the parameter "Freeze" with value "60"
    And I click the "SavedButton" button
    And I will see the element "Message" name is "保存成功"

  Scenario:关闭索引下沉
    Given the data name is "{'column':'1','name':'index_sink'}" then i click the "编辑" button without paging
#    Given the data name is "{'column':'1','name':'index_sink'}" then i click the "编辑" button without paging
    Then I will see the "index.CreatePage" page
    And I switch the "IndexSink" button to "unchecked"
    And I click the "SavedButton" button
    And I will see the element "Message" name is "保存成功"
#  Scenario:修改索引数据
#    Given the data name is "{'column':'1','name':'index_data'}" then i click the "编辑" button without paging
#    Then I will see the "index.CreatePage" page
#    And I choose the "1份" from the "IndexDataDropDown"
#    And I click the "SavedButton" button
#    And I will see the element "Message" name is "保存成功"
#  Scenario:修改索引冻结
#    Given the data name is "{'column':'1','name':'index_sink'}" then i click the "编辑" button without paging
#    Then I will see the "index.CreatePage" page
#    And I set the parameter "Freeze" with value "60"
#    And I click the "SavedButton" button
#    And I will see the element "Message" name is "保存成功"
#  Scenario:关闭索引下沉
#    Given the data name is "{'column':'1','name':'index_sink'}" then i click the "编辑" button without paging
#    Then I will see the "index.CreatePage" page
#    And I switch the "索引下沉" button to "unchecked"
#    And I click the "SavedButton" button
#    And I will see the element "Message" name is "保存成功"



