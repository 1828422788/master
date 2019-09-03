Feature: 字段提取删除

  Scenario Outline:
    Given open the "configs.ListPage" page for uri "/configs/"
    When the data name is "<name>" then i click the "删除" button
    And I click the "EnsureButton" button

  @configs @cleanConfigs @configsSmoke
    Examples:
      | name         |
      | AutoTest(副本) |

  @configs @cleanConfigs
    Examples:
      | name            |
      | return          |
      | message         |
      | workflow        |
      | RZY-2866搜索页结果验证 |
      | RZY-2861新建字段提取  |

  @cleanEssentialData
    Examples:
      | name             |
      | dapper           |
      | AutoTestForTrend |

  @clean @cleanSecond @configs @cleanConfigs
    Examples:
      | name               |
      | 脱敏                 |
      | RZY2883unicode解析   |
      | RZY2877base64解析    |
      | RZY2875script解析    |
      | RZY2872正则片段解析      |
      | RZY2870创建dissect解析 |
      | redirect主规则        |
      | redirect副规则        |
      | RZY2864在搜索页验证严格解析  |

  @cleanFirst @clean @configs @cleanConfigs
    Examples:
      | name     |
      | AutoTest |

  Scenario Outline: 删除字典管理
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    When the data name is "<name>" then i click the "删除" button
    And I click the "EnsureButton" button

    Examples:
      | name                   |
      | win_sys_sourcename.csv |