@third
Feature: 数据大屏下载

  Background:
    Given delete file "/target/download-files/galaxeeTest.tar"
    Then open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"

  Scenario: RZY-2963:模板管理
    And I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And I click the "Test" button
    And I click the "Download" button
    And I wait for "4000" millsecond