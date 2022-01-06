@setting @autoui02
Feature: 系统配置_搜索配置

  Background:
    Given open the "system.CustomConfigs" page for uri "/system/"

  @highLightWord
  Scenario: 执行
    And I wait for loading complete
    When I click the "SearchSetHead" button
    And I wait for loading complete
    And I click the "highLightWordDiv" button
    And I wait for loading complete
    When I set the parameter "HighLightWordInput" with value "GET" with enter
    Given I wait for loading complete
#  自定义高亮字段配置项


