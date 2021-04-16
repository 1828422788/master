@app @appSmoke
Feature: 应用编辑

  Scenario: 编辑应用
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "EventApp" then i click the "编辑" button
    And I wait for loading invisible
    Then I will see the "app.CreatePage" page
    And I set the parameter "DescribeInput" with value "test"
    And I click the "Event" button
    And I click the "AddSubmenu" button
    And I set the parameter "MenuName" with value "新建"
    And I set the parameter "Url" with value "/event/action/new/"
    And I click the "SaveMenuButton" button
    And I click the "AddMenuButton" button under some element
    And I set the parameter "MenuName" with value "百度"
    And I set the parameter "Url" with value "https://www.baidu.com/"
    And I click the "SaveMenuButton" button
    And I click the "AddMenuButton" button under some element
    And I set the parameter "MenuName" with value "知识"
    And I set the parameter "Url" with value "/knowledge/"
    And I click the "SaveMenuButton" button
    And I wait for "SaveMenuButton" will be invisible
    And I choose the "知识" from the "DefaultPage"
    And I click the "SaveButton" button

  Scenario: 跳转外部链接
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "EventApp" then i click the "打开" button in more menu
    Then I will see the "app.AppPage" page
    And I click the "Baidu" button
    Then the page's title will be "百度一下，你就知道"
