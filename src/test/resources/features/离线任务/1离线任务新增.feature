@offlineTask
Feature: 离线任务新增

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"

  Scenario Outline: 新建离线任务失败
    Given I set the parameter "SearchInput" with value "<splQuery>"
    And I click the "DateEditor" button
    And I click the "WholeTime" button
    And I click the "SearchButton" button
    Then I click the "OfflineTask" button
    Then I click the "EnsureCreateOfflineTask" button
    Then I will see the success message "<message>"

    Examples:
      | splQuery                                  | message |
      | * \| transaction apache.status maxspan=1s | 请填写名称！  |

  @offlineTaskSmoke
  Scenario Outline: 新建离线任务
    Given I set the parameter "SearchInput" with value "<splQuery>"
    And I click the "DateEditor" button
    And I click the "<time>" button
    And I click the "SearchButton" button
    Then I click the "OfflineTask" button
    Then I set the parameter "OfflineTaskName" with value "<name>"
    Then I click the "EnsureCreateOfflineTask" button
    And I will see the success message "提交成功，请到设置-离线任务页查看离线任务状态！"
    Then open the "splSearch.OfflineTaskPage" page for uri "/offlinetask/"
    And I wait for "EmptyElement" will be visible
    Then the data name is "<name>" then i click the "暂停" button

    Examples:
      | splQuery                                                                                                                                                                                                               | time           | name                        |
      | * \| transaction apache.status maxspan=1s                                                                                                                                                                              | WholeTime      | WholeTimeOfflineAutoTest    |
      | * \| transaction apache.status maxspan=1s                                                                                                                                                                              | RecentSevenDay | transactionofflineAutoTest1 |
      | * \| transaction apache.status maxspan=1s                                                                                                                                                                              | ThisMonth      | transactionofflineAutoTest2 |
#      | apache.status:>=405                                                                                                                                                                                                    | WholeTime      | offlineAutoTest1            |
#      | * \| stats count(apache.resp_len) as count_len, max(apache.resp_len) as max_len, min(apache.resp_len) as min_len, sum(apache.status) as sum_len, avg(apache.resp_len) as avg_len by apache.geo.city \| sort by max_len | WholeTime      | offlineAutoTest2            |

  @offlineTaskSmoke
  Scenario Outline: 新建最近类型的离线任务
    Given I set the parameter "SearchInput" with value "<splQuery>"
    And I click the "DateEditor" button
    And I click the "<time>" button
    And I set the parameter "TimeInput" with value "<beginTime>"
    And I choose the "天前" from the "DaysDropDown"
    And I click the "ApplyButton" button
    And I click the "SearchButton" button
    And I click the "OfflineTask" button
    And I set the parameter "OfflineTaskName" with value "<name>"
    And I click the "EnsureCreateOfflineTask" button
    And I will see the success message "提交成功，请到设置-离线任务页查看离线任务状态！"
    Then open the "splSearch.OfflineTaskPage" page for uri "/offlinetask/"
    And I wait for "EmptyElement" will be visible
    Then the data name is "<name>" then i click the "暂停" button

    Examples:
      | splQuery                                  | time                | beginTime | name                    |
      | * \| transaction apache.status maxspan=1s | RecentlyRadioButton | 1000      | recentlyOfflineAutoTest |

  @offlineTaskSmoke
  Scenario Outline: 新建自定义时间类型的离线任务
    Given I set the parameter "SearchInput" with value "<splQuery>"
    And I click the "DateEditor" button
    And I trigger the button "CustomTime"
    And I click the "SearchButton" button
    Then I click the "OfflineTask" button
    Then I set the parameter "OfflineTaskName" with value "<name>"
    Then I click the "EnsureCreateOfflineTask" button
    And I will see the success message "提交成功，请到设置-离线任务页查看离线任务状态！"
    Then open the "splSearch.OfflineTaskPage" page for uri "/offlinetask/"
    And I wait for "EmptyElement" will be visible
    Then the data name is "<name>" then i click the "暂停" button

    Examples:
      | splQuery                                  | name     |
      | * \| transaction apache.status maxspan=1s | autotest |