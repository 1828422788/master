#@third @timedTaskSmoke
Feature: 定时任务补采

  Background:
    Given open the "timedTask.ListPage" page for uri "/schedule/complement/"

  Scenario Outline:
    When I click the "CreateComplement" button
    And I choose the "<name>" from the "SelectName"
    And I set the time input "DateEditor" to a range in recent "<day>"
    And I display the element "DatePicker"
    And I click the "Save" button
    Then I will see the message "成功创建补采任务"

    Examples:
      | name                            | day |
      | RZY-404:执行计划-定时1天               | 2m  |
      | RZY-2698:执行计划-定时_2天             | 30d |
      | RZY-2699:执行计划-crontab_每个月第15天开始 | 1y  |

  Scenario Outline: RZY-396、2696
    When I click the "CreateComplement" button
    And I choose the "<name>" from the "SelectName"
    And I set the time input "DateEditor" between "<start>" and "<end>" at someday
    And I display the element "DatePicker"
    And I click the "Save" button
    Then I will see the message "成功创建补采任务"

    Examples:
      | name                       | start       | end      |
      | RZY-396:定时任务_sample_表格_近一天 | 00:00:00    | 18:30:00 |
      | RZY-2696:执行计划-定时_7小时       | 8d 12:00:00 | 00:00:00 |
