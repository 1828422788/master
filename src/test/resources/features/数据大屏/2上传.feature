@galaxee
Feature: 数据大屏上传

  Background:
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    And I click the "Create" button
    Then I will see the "galaxee.CreatePage" page

  Scenario:
    When I upload a file with name "/target/download-files/galaxeeTest.tar"
    Then I will see the success message "操作成功"
