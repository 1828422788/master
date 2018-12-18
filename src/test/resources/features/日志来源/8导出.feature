@resourceGroups @all @smoke @resourceGroupsSmoke
Feature: 日志来源导入来源结构（RZY-2213）

  Background:
    Given delete file "/target/download-files/日志来源结构文件.yaml"

  Scenario:
    Given open the "sourceGroup.StructurePage" page for uri "/sources/sourcegroups/structure/"
    And I click the "ExportButton" button