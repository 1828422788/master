Feature: api密钥页面操作

  Background:
    Given open the "ingestPriority.ListPage" page for uri "/apikey/"

  Scenario:新建api密钥
    And I click the "EnsureButton" button
    And I will see the element "Message" name is "<message>
    When I click the "CreateButton" button
    And I set the parameter "Name" with value "<name>"
    And I set the parameter "Describe" with value "<describe>"
    And I click the "EnsureButton" button
    And I will see the element "Message" name is "<message>"