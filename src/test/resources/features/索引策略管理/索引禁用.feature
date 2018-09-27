@indexSetting @all @smoke
Feature: 禁用索引信息

  Background:
    Given I insert into table "IndexInfo" with "{'name':'autotest','expired_time':'2m','rotation_period':'1m','domain_id':'1','description':'0'}"
    Then open the "index.ListPage" page for uri "/indexsettings/indexinfo/"

  Scenario:
    Given I disabled the data "autotest"
    Then I will see the success message "禁用成功"
    And I disabled the data "autotest"



