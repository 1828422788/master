@all @indexSetting
Feature: 入库优先级删除

  Background:
    Given I insert into table "IngestPriority" with "{'appname':'autotest','domain_id':'1','priority':'100','tag':'[]'}"
    Then open the "ingestPriority.ListPage" page for uri "/ingestpriority/"

  Scenario:
    When the data name is "autotest" then i click the "删除" button
    And I click the "EnsureButton" button
    Then I will see the success message "删除成功"
