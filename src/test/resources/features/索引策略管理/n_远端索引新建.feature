@remoteindex_creat @remoteindex
Feature: 新建远端索引

  Scenario Outline: 新建远端集群成功
    Given open the "remoteIndex.ListPage" page for uri "/remoteindex/"
    Given I click the "RemoteCusterTab" button
    Then I will see the "remoteIndex.CreatePage" page

    And I click the "CreateButton" button
    When I wait for loading complete

    When I set the parameter "ClusterName" with value "<clusterName>"
    And I set the parameter "DomainName" with value "<domainName>"
    And I set the parameter "IpPort" with value "<ipPort>"

    And I wait for "1000" millsecond
    And I click the "EnsureButton" button


  Examples: 新建成功
      | clusterName | domainName | ipPort              |
      | beaver134   | ops        | 192.168.1.134:50060 |
      | beaver116   | ops        | 192.168.40.116:50060 |


  Scenario Outline: 新建远端集群失败--IP端口错误
    Given open the "remoteIndex.ListPage" page for uri "/remoteindex/"
    Given I click the "RemoteCusterTab" button
    Then I will see the "remoteIndex.CreatePage" page

    And I click the "CreateButton" button
    When I wait for loading complete

    When I set the parameter "ClusterName" with value "<clusterName>"
    And I set the parameter "DomainName" with value "<domainName>"
    And I set the parameter "IpPort" with value "<ipPort>"

    And I wait for "1000" millsecond
    And I wait for element "HelpMessage" change text to "请输入合法IP及端口"


  Examples: 新建失败
      | clusterName | domainName | ipPort              |
      | beaver134   | ops        | 192.168.1.1109:50060 |
      | beaver134   | ops        | 192.168.1.256:1      |

  Scenario Outline: 新建远端集群失败--集群重复
    Given open the "remoteIndex.ListPage" page for uri "/remoteindex/"
    Given I click the "RemoteCusterTab" button
    Then I will see the "remoteIndex.CreatePage" page

    And I click the "CreateButton" button
    When I wait for loading complete

    When I set the parameter "ClusterName" with value "<clusterName>"
    And I set the parameter "DomainName" with value "<domainName>"
    And I set the parameter "IpPort" with value "<ipPort>"

    And I wait for "1000" millsecond
    And I click the "EnsureButton" button
    And I wait for element "HelpFailMessage" change text to "远端集群创建失败: 远程集群已经存在"


  Examples: 新建失败
      | clusterName | domainName | ipPort              |
      | beaver134   | ops        | 192.168.1.139:50060 |


  Scenario Outline: 新建远端索引成功
    Given open the "remoteIndex.ListPage" page for uri "/remoteindex/"
    And I click the "CreateButton" button

    Then I choose the "<clusterName>" from the "RemoteClusterList"
    Then I choose the "<remoteIndexName>" from the "RemoteIndexList"
    And I set the parameter "DescribeTextarea" with value "<describeTextarea>"

    And I wait for "1000" millsecond
    And I click the "EnsureButton" button

  Examples: 新建成功
      | clusterName | remoteIndexName  | describeTextarea |
      | beaver134   | yotta            | 测试远端索引    |
      | beaver116   | yotta            | 测试远端索引    |




