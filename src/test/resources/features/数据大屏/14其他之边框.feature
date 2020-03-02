@galaxee
Feature: 边框

  Scenario: 边框默认设置
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "边框默认设置"
    And I click the "Ensure" button
      #选择上方的其他
    And I click the "Other" button
      #选择边框
    And I click the "frame" button

      #保存
    And I wait for "Save" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"

  Scenario Outline: 边框默认设置发布并截图
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-fabu" button
    And switch to window "<name>"
    And I wait for loading invisible
    Then take a screenshot with name "galaxee/<name>"

    Examples:
      |name            |
      | 边框默认设置 |


 ######################################无耻的分割线################################

  Scenario: 边框样式2
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "边框样式2"
    And I click the "Ensure" button
      #选择上方的其他
    And I click the "Other" button
      #选择边框
    And I click the "frame" button
      #1 设置图表尺寸位置
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "400"
    And I set the parameter "Height" with value "300"
    And I set the parameter "ChartXaxis" with value "550"
    And I set the parameter "ChartYaxis" with value "350"
    #选择样式2
    And I click the "styleFrame" button
     And I choose the "样式2" from the "styleFrameSelect"
      #3 全局样式修改名成
    And I click the "globalStyle" button
    And I set the parameter "globalStyleName" with value "边框样式2"
      #保存
    And I wait for "Save" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"

  Scenario Outline: 边框样式2发布并截图
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-fabu" button
    And switch to window "<name>"
    And I wait for loading invisible
    Then take a screenshot with name "galaxee/<name>"

    Examples:
      |name            |
      | 边框样式2 |

######################################无耻的分割线################################

  Scenario: 边框样式3
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "边框样式2"
    And I click the "Ensure" button
      #选择上方的其他
    And I click the "Other" button
      #选择边框
    And I click the "frame" button
    #选择样式3
    And I wait for "styleFrame" will be visible
    And I click the "styleFrame" button
    And I choose the "样式3" from the "styleFrameSelect"
      #保存
    And I wait for "Save" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"

  Scenario Outline: 边框样式3发布并截图
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-fabu" button
    And switch to window "<name>"
    And I wait for loading invisible
    Then take a screenshot with name "galaxee/<name>"

    Examples:
      |name            |
      | 边框样式3 |