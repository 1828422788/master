Feature: 拓扑图钻取跳转

  Background:
    Given open the "topology.ListPage" page for uri "/topology/"

  Scenario Outline: 新建拓扑图
    When I click the "Create" button
    And I set the parameter "NameInput" with value "<name>"
    And I click the "Ensure" button

    Examples:
      | name |
      | 钻取跳转 |

  Scenario: 增加钻取节点
    When I click the detail which name is "钻取跳转"
    Then I will see the "topology.DetailPage" page
    And I wait for "AddInputButton" will be visible
    And I set the parameter "NodeName" with value "n1"
    And I set the parameter "NodeGroup" with value "g1"
    And I click the "AddNodeButton" button
    And I click the "AddValue" button
    And I click the "ValueHeader" button
    And I set the parameter "TextArea" with value "*|stats dc('apache.request_query')"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I will see the message "搜索成功"
    And I choose the "跳转到自定义URL" from the "Drilldown"
    And I set the parameter "URL" with value "/app/list/"
    And I click the "Apply" button
    And I click the "Save" button
    And I wait for "Message" will be invisible
    And I refresh the website
    And I accept alert window
    And open the "topology.ListPage" page for uri "/topology/"

  Scenario: 验证在当前窗口跳转
    When I click the detail which name is "钻取跳转"
    Then I will see the "topology.DetailPage" page
    And I wait for "Message" will be invisible
    And I click the "NodeValue" button
    And I accept alert window
    Then I wait for title change text to "应用管理"

  Scenario: 修改跳转方式
    When I click the detail which name is "钻取跳转"
    Then I will see the "topology.DetailPage" page
    And I wait for "Message" will be invisible
    And I click the "NodeTitle" button
    And I click the "AddNode" button
    And I click the "ValueHeader" button
    And I "checked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "Apply" button
    And I click the "UpdateNode" button
    And I click the "Save" button
    And I refresh the website
    And I accept alert window
    And open the "topology.ListPage" page for uri "/topology/"

  Scenario: 验证在新标签页跳转
    When I click the detail which name is "钻取跳转"
    Then I will see the "topology.DetailPage" page
    And I wait for "Message" will be invisible
    And I click the "NodeValue" button
    And I accept alert window
    And switch to another window
    And I close all tabs except main tab
    Then I wait for title change text to "应用管理"

  Scenario: 修改跳转URL
    When I click the detail which name is "钻取跳转"
    Then I will see the "topology.DetailPage" page
    And I wait for "Message" will be invisible
    And I click the "AddNode" button
    And I click the "ValueHeader" button
    And I set the parameter "URL" with value "https://www.baidu.com/"
    And I click the "Apply" button
    And I click the "UpdateNode" button
    And I click the "Save" button
    And I refresh the website
    And I accept alert window
    And open the "topology.ListPage" page for uri "/topology/"

  Scenario: 验证在新标签页跳转外部网站
    When I click the detail which name is "钻取跳转"
    Then I will see the "topology.DetailPage" page
    And I wait for "Message" will be invisible
    And I click the "NodeValue" button
    And I accept alert window
    And switch to another window
    And I close all tabs except main tab
    Then I wait for title change text to "百度一下，你就知道"

  Scenario: 修改为当前标签页跳转
    When I click the detail which name is "钻取跳转"
    Then I will see the "topology.DetailPage" page
    And I wait for "Message" will be invisible
    And I click the "NodeTitle" button
    And I click the "AddNode" button
    And I click the "ValueHeader" button
    And I "unchecked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "Apply" button
    And I click the "UpdateNode" button
    And I click the "Save" button
    And I refresh the website
    And I accept alert window
    And open the "topology.ListPage" page for uri "/topology/"

  Scenario: 验证在当前窗口跳转外部网站
    When I click the detail which name is "钻取跳转"
    Then I will see the "topology.DetailPage" page
    And I wait for "Message" will be invisible
    And I click the "NodeValue" button
    And I accept alert window
    And I accept alert window
    Then I wait for title change text to "百度一下，你就知道"
    And open the "topology.ListPage" page for uri "/topology/"

  Scenario Outline: 删除拓扑图
    Given the data name is "<name>" then i click the "删除" button
    And I click the "Ensure" button

    Examples:
      | name |
      | 钻取跳转 |