Feature: 日志来源删除

  Background:
    Given open the "sourceGroup.ListPage" page for uri "/sources/sourcegroups/"

  Scenario Outline:
    Given the data name is "<name>" then i click the "删除" button
    Then I click the "Ensure" button
    Then I will see the success message "删除成功"

  @logSource
    Examples:
      | name                    |
      | AutoTestEditSubSource   |
      | AutoTestEditFather      |
      | AutoTestUploadSubSource |
      | AutoTestUploadFather    |
      | AutoTestUploadTest      |
      | temptest                |
      | tempautotest            |
      | sunxjautotest           |

  @cleanLogSource @cleanEssentialData
    Examples:
      | name              |
      | AutoTestLogSource |