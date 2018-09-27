@indexSetting @all @smoke
Feature: 搜索索引信息

  Background:
    Given I insert into table "IndexInfo" with "{'name':'autotest','expired_time':'2m','rotation_period':'1m','domain_id':'1','description':'0'}"
    Then open the "index.ListPage" page for uri "/indexsettings/indexinfo/"
