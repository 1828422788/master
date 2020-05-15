Feature: 新建资产管理

  Background:
    Given open the "agent.ListPage" page for uri "/app/siem/assets/"
    And switch to another window
    And I close all tabs except main tab
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

  Scenario: 快速创建多个资产成功
    And I click the "AddAsset" button
    And I click the "Quickadd" button
    When I set the parameter "AssetName" with value "AutotestQuickaddmulti"
    When I set the parameter "IpName" with value "192.168.1.201,192.168.1.202"
    And I click the "Save" button
    And I will see the element "Message" name is "快速新增资产成功"

  Scenario: 完全创建资产成功
    And I click the "AddAsset" button
    And I click the "Completeadd" button
    And I will see the url contains "/app/siem/assets/edit"
    When I set the parameter "AssetNameComplete" with value "AutotestCompleteadd"
    When I set the parameter "IpComplete" with value "192.168.1.203"
    When I set the parameter "Appname" with value "ssh"
    When I set the parameter "Version" with value "2.2"
    When I set the parameter "Port" with value "22"
    When I set the parameter "Protocol" with value "TCP"
    And I click the "Save" button
    And I will see the element "CompletaMessage" name is "新增资产成功，即将返回列表页"

  Scenario: 完全创建资产ip重复-新建失败
    And I click the "AddAsset" button
    And I click the "Completeadd" button
    And I will see the url contains "/app/siem/assets/edit"
    When I set the parameter "AssetNameComplete" with value "AutotestCompleteadd"
    When I set the parameter "IpComplete" with value "192.168.1.203"
    When I set the parameter "Appname" with value "ssh"
    When I set the parameter "Version" with value "2.2"
    When I set the parameter "Port" with value "22"
    When I set the parameter "Protocol" with value "TCP"
    And I click the "Save" button
    Then I will see the element value in json "{'CompletaMessage':'host already exists, [192.168.1.203]'}"

