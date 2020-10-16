@galaxeeRA   @galaxee @galaxeeR
Feature: 数据大屏-所有控件发布

  Scenario Outline: 数据大屏-所有控件发布
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    And I wait for "7000" millsecond
    When the galaxee name is "<name>" then I click the "iconfont icon-fabu" release button
    And switch to window "<name>"
    And I close all tabs except main tab
    And I wait for "Loading" will be invisible
    And I wait for "1000" millsecond
    Then take a screenshot with name "galaxee/<name>"


    Examples:
    | name |
    |散点图XY轴-布局-搜索 |
    |散点图-图例-分组-静态数据 |
    |散点图-绑定搜索|


    |柱图-图例-分组-静态数据 |
    |X轴Y轴布局设置-搜索  |
    |柱图-数值设置-添加Line-绑定搜索|


    |条形图-样式搜索    |
    |条形图-静态数据  |
    |条形图-绑定搜索 |

    |水平胶囊样式-搜索    |
    |水平胶囊数据之静态数据  |
    |水平胶囊数据之绑定搜索 |

    |滚动条形图样式-搜索    |
    |滚动条形图数据之静态数据   |
    |滚动条形图数据之绑定搜索 |

    |滚动柱形图样式-搜索    |
    |滚动柱形图数据之静态数据  |
    |滚动柱形图数据之绑定搜索 |

    |滚动列表样式-搜索    |
    |滚动列表数据之静态数据 |
    |滚动列表数据之绑定搜索 |


    |滚动列表2样式-搜索    |
    |滚动列表2数据之静态数据 |
    |滚动列表2数据之绑定搜索 |

    |滚动列表3样式-搜索    |
    |滚动列表3数据之静态数据 |
    |滚动列表3数据之绑定搜索 |


    |综合列表样式-搜索    |
    |综合列表数据之静态数据  |
    |综合列表数据之绑定搜索 |

    | 饼图-样式搜索 |
    |饼图-静态数据 |
    |饼图-绑定搜索 |

    | 玫瑰图-样式搜索  |
    |玫瑰图-静态数据 |
    |玫瑰图-绑定搜索 |


    |环形柱图样式-搜索   |
    |环形柱图数据之静态数据   |
    |环形柱图数据之绑定搜索 |

    | 环形占比图-样式搜索 |
    |环形占比图-静态数据  |
    |环形占比图-绑定搜索 |


    |占比图3D数据之样式-搜索   |
    |占比图3D数据之静态数据   |
    |占比图3D数据之绑定搜索 |


    |水球图-样式搜索 |
    |水球图-静态数据  |
    | 水球图-绑定搜索 |



















