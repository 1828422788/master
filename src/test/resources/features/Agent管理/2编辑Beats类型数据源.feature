@agent_beats
Feature: Agent编辑Beats类型数据源

  Background:
    Given open the "agent.ListPage" page for uri "/sources/input/agent/"
    And I wait for loading invisible
    When I click the detail which column is "1" in agent page
    And switch to another window
    And I close all tabs except main tab
    And I wait for loading invisible
    And I will see the "agent.CreatePage" page

  Scenario: 新增Beats类型数据源
    And I click the "Create" button
    And I click the "BeatsType" button
    And I set the parameter "Listenaddress" with value "192.168.1.139:299"
    And I set the parameter "BeatsAppname" with value "autoBeatstest"
    And I set the parameter "BeatsTag" with value "autoBeatstest"
    And I click the "Next" button
    And I click the "Next" button
    And I wait for loading invisible
    And I will see the element "Addsuccessmsg" name is "添加成功"

  Scenario: 修改beats数据源禁用
    Given the data name "192.168.1.139:299" in agent table "BeatsTable" then i click the "close" switch
    Then I wait for loading invisible
    And I wait for "5000" millsecond
    Then I will see the element "getBeatsSwitchStatus" name is "已禁用"

  Scenario: Beats数据源启用
    Given the data name "192.168.1.139:299" in agent table "BeatsTable" then i click the "open" switch
    Then I wait for loading invisible
    And I wait for "5000" millsecond
    Then I will see the element "getBeatsSwitchStatus" name is "已启用"

  Scenario Outline: Beats数据源修改appname成功
    Given the data name "192.168.1.139:299" in table "BeatsTable" then i click the "编辑" button
    And I wait for loading invisible
    And I set the parameter "Appname" with value "<appnamekind>"
    And I click the "Ensure" button
    And I wait for "ChangeMemo" will be visible
    Then I will see the element value in json "{'ChangeMemo':'修改 Agent 配置成功。'}"

    Examples:
      | appnamekind         |
      | changebeatsappname  |
      | changebeatsappname2 |
      | change_beatsappname |


  Scenario Outline: Beats数据源修改appname失败
    Given the data name "192.168.1.139:299" in table "BeatsTable" then i click the "编辑" button
    And I wait for loading invisible
    And I set the parameter "Appname" with value "<appnamekind>"
    And I click the "Ensure" button
    Then I will see the element "PreviewMessage" name is "请以字母或数字下划线为元素"


    Examples:
      | appnamekind |
      | 中文          |
      | #.。，        |

  Scenario Outline: Beats数据源修改tag成功
    Given the data name "192.168.1.139:299" in table "BeatsTable" then i click the "编辑" button
    And I wait for loading invisible
    And I set the parameter "Tag" with value "<tagkind>"
    And I click the "Ensure" button
    And I wait for "ChangeMemo" will be visible
    Then I will see the element value in json "{'ChangeMemo':'修改 Agent 配置成功。'}"


    Examples:
      | tagkind                         |
      | changebeatstag                  |
      | changebeatstag,changesyslogtag2 |
      | change_beatstag                 |

  Scenario Outline: Beats数据源修改tag失败
    Given the data name "192.168.1.139:299" in table "BeatsTable" then i click the "编辑" button
    And I wait for loading invisible
    And I set the parameter "Tag" with value "<tagkind>"
    And I click the "Ensure" button
    Then I will see the element value in json "{'PreviewMessage':'请以字母、数字、中文或下划线为元素,tags 之间可用 "," 分隔。'}"

    Examples:
      | tagkind |
      | s，s     |
      | #￥%…&*  |


  Scenario: Beats数据源删除
    Given the data name "192.168.1.139:299" in table "BeatsTable" then i click the "删除" button
    And I wait for loading invisible
    And I click the "Ensure" button
    And I wait for "ChangeMemo" will be visible
    Then I will see the element "ChangeMemo" name is "删除 Agent 配置成功。"

