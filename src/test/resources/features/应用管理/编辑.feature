#@app @appSmoke
Feature: 应用编辑

  Scenario: 编辑应用
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "EventApp" then i click the "编辑" button
    And I wait for loading invisible
    Then I will see the "app.CreatePage" page
    And I set the parameter "DescribeInput" with value "test"
    And I change the style to "" which name is "事件操作"
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
    Then I will see the success message "保存成功"

  Scenario: 查看应用
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "EventApp" then i click the "查看" button
    And I wait for loading invisible
    Then I will see the "app.DetailPage" page
    Then I will see the element "Describe" name is "test"
    Then I will see the element "DefaultPage" name is "知识"

  Scenario: 跳转外部链接
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "EventApp" then i click the "打开" button
    Then I will see the "app.AppPage" page
    And I click the "Baidu" button
    Then the page's title will be "百度一下，你就知道"
