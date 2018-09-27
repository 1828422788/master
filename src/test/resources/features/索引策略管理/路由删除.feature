@indexSetting @all @smoke
Feature:
  Background:
    Given I insert into table "IndexMatchRule" with "{'appname'}"
    Given open the "index.ListPage" page for uri "/indexsettings/indexinfo/"
    And I click the "IndexMatchRule" button