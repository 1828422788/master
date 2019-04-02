@alert @alertSmoke @second
Feature: 监控在搜索中打开

  Background:
    Given open the "alert.ListPage" page for uri "/alerts/"

  Scenario:
    When the data name is "RZY-436：SPL统计监控步骤1" then i click the "在搜索中打开" button
    And switch to another window
    And I wait for "SplSearchInput" will be visible
    And I wait for "2000" millsecond
    And I will see the input element "SplSearchInput" value will be "* | stats count() as cnt by apache.clientip"
