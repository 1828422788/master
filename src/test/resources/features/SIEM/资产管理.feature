@siem
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
    Then I will see the element value in json "{'Message':'host already exists, [192.168.1.200]'}"

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

  Scenario: 完全创建资产缺少名称-新建失败
    And I click the "AddAsset" button
    And I click the "Completeadd" button
    And I will see the url contains "/app/siem/assets/edit"
    When I set the parameter "IpComplete" with value "192.168.1.203"
    When I set the parameter "Appname" with value "ssh"
    When I set the parameter "Version" with value "2.2"
    When I set the parameter "Port" with value "22"
    When I set the parameter "Protocol" with value "TCP"
    And I click the "Save" button
    And I will see the element "FailureMessage" name is "请检查输入项，确保正确后再提交。"

  Scenario: 完全创建资产缺少ip-新建失败
    And I click the "AddAsset" button
    And I click the "Completeadd" button
    And I will see the url contains "/app/siem/assets/edit"
    When I set the parameter "AssetNameComplete" with value "AutotestCompleteadd"
    When I set the parameter "Appname" with value "ssh"
    When I set the parameter "Version" with value "2.2"
    When I set the parameter "Port" with value "22"
    When I set the parameter "Protocol" with value "TCP"
    And I click the "Save" button
    Then I will see the element value in json "{'FailureMessage':'请检查输入项，确保正确后再提交。'}"

  Scenario: 完全创建资产缺少应用-新建失败
    And I click the "AddAsset" button
    And I click the "Completeadd" button
    And I will see the url contains "/app/siem/assets/edit"
    When I set the parameter "AssetNameComplete" with value "AutotestCompleteadd"
    When I set the parameter "IpComplete" with value "192.168.1.203"
    And I click the "Save" button
    Then I will see the element value in json "{'FailureMessage':'请检查输入项，确保正确后再提交。'}"

  Scenario: 编辑资产-修改资产名称
    When the data name is "{'column':'1','name':'AutotestCompleteadd'}" then i click the "编辑" button in siem page
    And I will see the url contains "/app/siem/assets/edit"
    When I set the parameter "AssetNameComplete" with value "AutotestCompleteadd2"
#    When I set the parameter "IpComplete" with value "192.168.1.203"
    And I click the "Save" button
    And I will see the element "CompletaMessage" name is "修改资产成功，即将返回上一页"

  Scenario Outline: 编辑资产-修改资产类型
    When the data name is "{'column':'1','name':'AutotestCompleteadd2'}" then i click the "编辑" button in siem page
    And I will see the url contains "/app/siem/assets/edit"
    And I wait for loading invisible
    And I choose the "<assetkind>" from the "AssetKind" in config
    And I click the "Save" button
    When the data name is "{'column':'1','name':'AutotestCompleteadd2'}" then i click the "编辑" button in siem page
    Then I will see the element value in json "{'Message':'修改资产成功，即将返回上一页'}"
    And I wait for element "AssetKindValue" value change text to "<assetkind>"
    Then I will see the element "AssetKindValue" attribute "value" is "<assetkind>" in siem

    Examples:
      | assetkind   |
      | 服务器         |
      | 交换机         |
      | 路由器         |
      | 防火墙         |
      | 路由器         |
      | VPN         |
      | Web防火墙      |
      | 入侵防御系统(IPS) |
      | 入侵检测系统(IDS) |
      | 网络准入系统      |
      | 防病毒网关       |
      | 流量检测设备      |
      | 数据防泄密系统     |
      | 堡垒机         |
      | 数据库审计系统     |
      | 其他          |