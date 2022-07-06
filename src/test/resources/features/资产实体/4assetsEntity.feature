@assetsModel
Feature: 资产实体

  Background:
    Given open the "assets.EntityPage" page for uri "/assets/entity/"
    And I wait for loading invisible
    And I click the Element with text "主机"
    And I wait for loading invisible

  Scenario:RZY-6342:批量部署提示信息
    And I will see the text "一次最多选择10个实体进行批量部署，且需要有新版本Agent时方可实施" exist in page
    And I click the Element with text "不再提示"
    And I refresh the website
    Then I will see the text "一次最多选择10个实体进行批量部署，且需要有新版本Agent时方可实施" is not existed in page

  Scenario:新建资产时必填选项不输入时提示
    And I click the Element with text "新建资产"
    And I click the Element with text "确定"
    Then I will see the "ErrorInputPromptForAssetName" result will be "该选项为必填项不能为空"
    Then I will see the "ErrorInputPromptForAgentPlatform" result will be "该选项为必填项不能为空"

  @assetsModelSmoke
  Scenario Outline:新建资产实体
    And I click the Element with text "新建资产"
    And I set the parameter "InputForName" with value "<name>"
    And I set the parameter "InputForAgentPlatform" with value "linux-x64"
    And I click the Element with text "确定"
    Then I will see the success message "创建成功"

  Examples:
    |name             |status     |
    |192.168.1.253    |已安装      |
    |192.168.1.4      |未安装      |

  Scenario:RZY-5673 编辑资产实体
    And I set the parameter "InputForSearchAssets" with value "253"
    Then the data name is "192.168.1.253" then i click the "编辑" button
    And I set the parameter "InputForName" with value "192.168.1.1"
    And I set the parameter "InputForAgentPlatform" with value "win-386"
    And I click the Element with text "确定"
    Then I will see the success message "更新成功"

  Scenario:RZY-5533:删除资产实体
    And I set the parameter "InputForSearchAssets" with value "192.168.1.1"
    Then the data name is "192.168.1.1" then i click the "删除" button
    And I click the Element with text "确定"
    Then I will see the success message "删除成功"

  @assetsModelSmoke
  Scenario:RZY-5470单个实体部署agent
    And I set the parameter "InputForSearchAssets" with value "4"
    And I wait for "1000" millsecond
    And I click the "SecondOperation" button
    And I click the Element with text "部署Agent"
    And I wait for loading invisible
    And I set the parameter "InputForPort" with value "22"
    And I set the parameter "InputForUsername" with value "root"
    And I set the parameter "InputForPassword" with value "1qa@WS4"
    And I click the Element with text "认证"
    Then I will see the text "认证成功" exist in page
    And I click the Element with text "确定"
    Then I wait the text "部署成功" occur in "20000" millsecond

  Scenario:RZY-5497 已部署agent的资产点击批量部署后无勾选框
    And I set the parameter "InputForSearchAssets" with value "192.168.1.4"
    And I wait for loading invisible
    And I click the Element with text "批量部署Agent"
    Then I will see the "checkbox" is not exist