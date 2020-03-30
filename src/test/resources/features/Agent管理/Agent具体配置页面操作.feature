Feature: 编辑数据库数据类型数据源

  Background:
    Given open the "agent.ListPage" page for uri "/sources/input/agent/"
    And I wait for loading invisible
    When I click the detail which column is "1" in agent page
    And switch to another window
    And I will see the "agent.CreatePage" page

  Scenario: 新建性能数据库类型数据源
    And I click the "Create" button
    And I click the "FuctionType" button
    And I set the parameter "SpecialPort" with value "23"
    And I click the "Next" button
    And I wait for loading invisible
    And I set the parameter "PreAppname" with value "autotop_info"
    And I set the parameter "Tag" with value "autotop_info"
    And I click the "Next" button
    And I click the "Finish" button
    And I will see the element "Addsuccessmsg" name is "添加成功"

  Scenario: 清理输入源缓存
    And I click the "CleanCache" button
    And I click the "CleanInputCache" button
    And I click the "CleanCache" button