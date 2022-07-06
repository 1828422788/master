@agent_beats @agentCollect
Feature: Agent编辑Beats类型数据源

  Background:
    Given open the "agent.ListPage" page for uri "/sources/input/agent/"
    And I wait for loading invisible
    And I zoom the browse to full screen
    When I click the detail which column is "0" in agent page
    And switch to another window
    And I close all tabs except main tab
    And I wait for loading invisible
    And I will see the "agent.CreatePage" page

  @agentCollectSmoke
  Scenario: 新增Beats类型数据源
    And I click the "Create" button
    And I click the "BeatsType" button
    And I click the "Next" button
    And I set the agent parameter "Listenaddress" with running ip and port with "299"
    And I set the parameter "Appname" with value "autoBeatstest"
    And I set the parameter "Tag" with value "autoBeatstest"
    And I click the "Next" button
    And I click the "Finish" button
    And I wait for loading invisible
    And I will see the element "Addsuccessmsg" name is "添加成功"

  @agentCollectSmoke
  Scenario: 修改beats数据源禁用
    Given the data name "autoBeatstest" in agent table "BeatsTable" then i click the "close" switch
    Then I wait for "getBeatsSwitchStatus" will be visible
    And I wait for element "getBeatsSwitchStatus" change text to "已禁用"

  @agentCollectSmoke
  Scenario: 修改beats数据源启用
    Given the data name "autoBeatstest" in agent table "BeatsTable" then i click the "open" switch
    Then I wait for "getBeatsSwitchStatus" will be visible
    And I wait for element "getBeatsSwitchStatus" change text to "已启用"

  Scenario Outline: Beats数据源修改appname成功
    Given the data name in beats table "BeatsTable" then i click the "编辑" button
    And I wait for loading invisible
    And I set the parameter "Appname" with value "<appnamekind>"
    And I click the "Ensure" button
    And I wait for "ChangeMemo" will be visible

    Examples:
      | appnamekind         |
      | changebeatsappname  |
      | changebeatsappname2 |
      | change_beatsappname |

  Scenario Outline: Beats数据源修改appname失败
    Given the data name in beats table "BeatsTable" then i click the "编辑" button
    And I wait for loading invisible
    And I set the parameter "Appname" with value "<appnamekind>"
    And I click the "Ensure" button
    Then I will see the element "PreviewMessage" name is "请以字母或数字下划线为元素"


    Examples:
      | appnamekind |
      | 中文          |
      | #.。，        |

  Scenario Outline: Beats数据源修改tag成功
    Given the data name in beats table "BeatsTable" then i click the "编辑" button
    And I wait for loading invisible
    And I set the parameter "Tag" with value "<tagkind>"
    And I click the "Ensure" button
    And I wait for "ChangeMemo" will be visible

    Examples:
      | tagkind                         |
      | changebeatstag                  |
      | changebeatstag,changesyslogtag2 |
      | change_beatstag                 |

  Scenario Outline: Beats数据源修改tag失败
    Given the data name in beats table "BeatsTable" then i click the "编辑" button
    And I wait for loading invisible
    And I set the parameter "Tag" with value "<tagkind>"
    And I click the "Ensure" button
    Then I will see the element value in json "{'PreviewMessage':'请以字母、数字、中文或下划线为元素,tags 之间可用 "," 分隔。'}"

    Examples:
      | tagkind |
      | s，s     |
      | #￥%…&*  |

  @agentCollectSmoke
  Scenario: Beats数据源删除
    Given the data name in beats table "BeatsTable" then i click the "更多" button
    And I click the "Delete" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "ChangeMemo" will be visible

