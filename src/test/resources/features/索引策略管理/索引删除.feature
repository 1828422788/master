@indexSetting @all @smoke
Feature: 删除索引信息

  Background:
    Given I insert into table "IndexInfo" with "{'name':'autotest','expired_time':'2m','rotation_period':'1m','domain_id':'1','description':'0'}"
    Then open the "index.ListPage" page for uri "/indexsettings/indexinfo/"

  Scenario:
    Given the data name is "autotest" then i click the "删除" button
    When I click the "EnsureDeleteButton" button
    Then I will see the success message "删除成功"