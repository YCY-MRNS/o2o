package com.changyue.o2o.emums;

public enum LocalAuthStateEnum {
    /**
     * 平台账号状态
     */
    LOCAL_AUTH_NULL(-4000, "平台信息为空"),
    ;
    private int state;
    private String stateInfo;

    LocalAuthStateEnum(int state, String stateInfo) {
        this.state = state;
        this.stateInfo = stateInfo;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getStateInfo() {
        return stateInfo;
    }

    public void setStateInfo(String stateInfo) {
        this.stateInfo = stateInfo;
    }

    public static LocalAuthStateEnum stateOf(int index) {
        for (LocalAuthStateEnum sta : values()) {
            if (sta.getState() == index) {
                return sta;
            }
        }
        return null;
    }
}
