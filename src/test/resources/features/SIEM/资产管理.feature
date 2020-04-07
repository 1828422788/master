Feature: 新建资产管理

  Background:
    Given open the "agent.ListPage" page for uri "/app/siem/assets/"
    And switch to another window
    And I will see the "SIEM.CreatePage" page

  Scenario: 快速创建资产成功
    And I click the "AddAsset" button
    And I click the "Quickadd" button
    When I set the parameter "AssetName" with value "AutotestQuickadd"
    When I set the parameter "IpName" with value "192.168.1.200"
    And I click the "Save" button
    And I will see the element "Message" name is "快速新增资产成功"

  Scenario: 快速创建资产无名称失败
    And I click the "AddAsset" button
    And I click the "Quickadd" button
    And I click the "Save" button
    And I will see the element "Message" name is "请务必填写资产名称"

  Scenario: 快速创建资产无地址失败
    And I click the "AddAsset" button
    And I click the "Quickadd" button
    When I set the parameter "AssetName" with value "AutotestQuickadd"
    And I click the "Save" button
    And I will see the element "Message" name is "请务必输入资产IP"

  Scenario: 快速创建资产地址重复失败
    And I click the "AddAsset" button
    And I click the "Quickadd" button
    When I set the parameter "AssetName" with value "AutotestQuickadd"
    When I set the parameter "IpName" with value "192.168.1.200"
    And I click the "Save" button
    Then I will see the element value in json "{'Message':'{0} host already exists, [192.168.1.200]'}"



