package com.yottabyte.utils;

import java.util.List;

/**
 * @author sunxj
 */
public class Agent {
    private String ip;
    private List<String> ipList;

    public Agent() {
        String sql = "SELECT ip FROM AgentStatus WHERE `status`='Running' AND last_update_timestamp> SUBDATE(NOW(),interval 15 minute)";
        this.ipList = JdbcUtils.query(sql);
    }

    public String getIp() {
        if (ipList.size() != 0) {
            this.ip = ipList.get(0);
        }
        return ip;
    }
}
