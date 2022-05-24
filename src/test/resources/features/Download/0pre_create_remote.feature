@pre00 @remote_index
Feature: 新建远端索引

  @new_remote_cluster
  Scenario Outline: 新建远端集群
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
      | beaver184   | ops        | 192.168.1.184:50060 |

  @new_remote_index
  Scenario Outline: 新建远端索引
    Given open the "remoteIndex.ListPage" page for uri "/remoteindex/"
    And I click the "CreateButton" button

    Then I choose the "<clusterName>" from the "RemoteClusterList"
    Then I choose the "<remoteIndexName>" from the "RemoteIndexList"
    And I set the parameter "DescribeTextarea" with value "<describeTextarea>"

    And I wait for "1000" millsecond
    And I click the "EnsureButton" button

    Examples: 新建成功
      | clusterName | remoteIndexName  | describeTextarea |
      | beaver184   | yotta            | UI自动测试_新建远端索引    |
      | beaver184   | collectone       | UI自动测试_新建远端索引    |
      | beaver184   | collecttocollect | UI自动测试_新建远端索引    |
      | beaver184   | collecttwo       | UI自动测试_新建远端索引    |
      | beaver184   | collectmodefalse | UI自动测试_新建远端索引    |
      | beaver184   | collectmodetrue  | UI自动测试_新建远端索引    |
      | beaver184   | collectmulti     | UI自动测试_新建远端索引    |
      | beaver184   | collectdelete    | UI自动测试_新建远端索引    |
      | beaver184   | iflink1          | UI自动测试_新建远端索引    |
      | beaver184   | iflink2          | UI自动测试_新建远端索引    |
