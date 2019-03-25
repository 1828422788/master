@all @smoke @configs @configsSmoke
Feature: 字段提取编辑

  Background:
    Given open the "configs.ListPage" page for uri "/configs/"

  Scenario:
    When the data name is "AutoTest(副本)" then i click the "编辑" button
    Then I will see the "configs.CreatePage" page
#    And I wait for "1500" millsecond
#    And I wait for "BasicInfo" will be visible
#    And I set the parameter "Name" with value "<name>"
    And I click the "NextButton" button
    And I click the "SwitchButton" button
    And I click the "NextButton" button
    And I wait for "ConfigDone" will be visible