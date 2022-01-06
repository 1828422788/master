@remoteindex_creat @remoteindex @indexSettingSmoke @indexSetting
Feature: 索引信息过滤
  Scenario Outline: 远端集群过滤
    Given open the "remoteIndex.ListPage" page for uri "/remoteindex/"
    Given I click the "RemoteCusterTab" button
    Then I will see the "remoteIndex.CreatePage" page

    When I set the parameter "SearchInput" with value "<clusterName>"

    And I wait for "3000" millsecond
    And I will see the "Tbody" result will contain "0"


    Examples: 新建成功
      | clusterName |
      | 134         |
      | beaver      |

  Scenario Outline: 过滤远端索引
    Given open the "remoteIndex.ListPage" page for uri "/remoteindex/"

    When I set the parameter "SearchInput" with value "<clusterName>"

    And I wait for "3000" millsecond
#    And I will see the "Tbody" result will contain "0"

    Examples: 新建成功
      | clusterName | function|
      | beaver134:yotta       |编辑\n更多|
      | beaver134:testnyt   |编辑\n更多  |




