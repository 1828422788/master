@offlineTask @offlineTaskSmoke @offlineTest
Feature: 下载列表查看并下载

  Background:
    Given open the "splSearch.OfflineTaskPage" page for uri "/download/"
  @dbl1
  Scenario:
    Given the data name is "append_status_sub_eval.csv" then i click the "下载" button
    And I download file "append_status_sub_eval.csv" to local


