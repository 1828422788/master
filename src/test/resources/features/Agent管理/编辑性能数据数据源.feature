Feature: 编辑性能数据类型数据源

  Background:
    Given open the "agent.ListPage" page for uri "/sources/input/agent/"
    And I wait for loading invisible
    When I click the detail which column is "1" in agent page
    And switch to another window
    And I will see the "agent.CreatePage" page

  Scenario: 新建性能数据数据源
#    When I click the detail which name is "<ip>"
    And I click the "Create" button
    And I click the "FuctionType" button
    And I set the parameter "SpecialPort" with value "23"
    And I set the parameter "Frequency" with value "500"
    And I click the "Next" button
    And I wait for loading invisible
    And I set the parameter "PreAppname" with value "autotop_info"
    And I set the parameter "Tag" with value "autotop_info"
    And I click the "Next" button
    And I click the "Finish" button
    And I will see the element "Addsuccessmsg" name is "添加成功"

  Scenario: 性能数据源禁用
    Given the data name "500s" in agent table "FuctionTypeTable" then i click the "close" switch
    Then I wait for loading invisible
    Then I will see the element "FuctionTypeSwitchStatus" name is "已禁用"

  Scenario: 性能数据源启用
    Given the data name "500s" in agent table "FuctionTypeTable" then i click the "open" switch
    Then I wait for loading invisible
    Then I will see the element "FuctionTypeSwitchStatus" name is "已启用"

  Scenario Outline: 性能数据源修改appname成功
    Given the data name "500s" in agent table "FuctionTypeTable" then i click the "编辑" switch
    And I set the parameter "Appname" with value "<appnamekind>"
    And I click the "Ensure" button
    Then I will see the element "ChangeMemo" name is "修改 Agent 配置成功。"

    Examples:
      | appnamekind |
      |   changefunctionappname    |
      |   changefunctionappname2    |
      |   change_functionappname    |


  Scenario Outline: 性能数据源修改appname失败
    Given the data name "500s" in agent table "FuctionTypeTable" then i click the "编辑" switch
    And I set the parameter "Appname" with value "<appnamekind>"
    And I click the "Ensure" button
    Then I will see the element "PreviewMessage" name is "请以字母或数字下划线为元素"

    Examples:
      | appnamekind |
      |   中文    |
      |   #.。，   |
  Scenario Outline: 性能数据源修改tag成功
    Given the data name "500s" in table "FuctionTypeTable" then i click the "编辑" button
    And I set the parameter "Tag" with value "<tagkind>"
    And I click the "Ensure" button
    Then I will see the element "ChangeMemo" name is "修改 Agent 配置成功。"

    Examples:
      | tagkind |
      |   changefunctiontag    |
      |   changefunctiontag,changefunctiontag2    |
      |   change_functiontag                    |

  Scenario Outline: 性能数据源修改tag失败
    Given the data name "500s" in table "FuctionTypeTable" then i click the "编辑" button
    And I set the parameter "Tag" with value "<tagkind>"
    And I click the "Ensure" button
    Then I will see the element "PreviewMessage" name is "请以字母、数字、中文或下划线为元素,tags 之间可用 "," 分隔。"

    Examples:
      | tagkind |
      |   s，s    |
      |   #￥%…&*   |

  Scenario Outline: 性能数据源修改采集频率成功
    Given the data name "500s" in table "FuctionTypeTable" then i click the "编辑" button
    When I choose the "<frequencykind>" from the "Frequency"
    And I click the "Ensure" button
    Then I will see the element "ChangeMemo" name is "修改 Agent 配置成功。"

    Examples:
      | frequencykind |
      |   天    |
      |   小时    |
      |   分钟 |
      |   秒  |


