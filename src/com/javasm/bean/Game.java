package com.javasm.bean;

public class Game {

    private Integer gid; //游戏编号

    private String  name; //游戏名称

    private Integer typeId; //游戏类型id

    private String  title; //游戏标题

    private Integer downLoadCount; //下载量

    private Double size; //大小

    private String state; //上线状态

    private String gameIcon; //游戏图标链接地址

    private String iosUrl; //ios端下载链接

    private String androidUrl; //安卓下载链接

    private String platform; //运行平台

    private String rank; //推荐等级(普通,推荐首页)

    private String des; //详细内容

    private String pictures; //图片



    public Game() {
    }

    public Game(String name,Integer typeId,String title,Double size,String state,String platform,String rank) {
        this.gid = gid;
        this.name = name;
        this.typeId = typeId;
        this.title = title;
        this.downLoadCount = downLoadCount;
        this.size = size;
        this.state = state;
        this.gameIcon = gameIcon;
        this.iosUrl = iosUrl;
        this.androidUrl = androidUrl;
        this.platform = platform;
        this.rank = rank;
        this.des = des;
        this.pictures = pictures;
    }

    public Integer getGid() {
        return gid;
    }

    public void setGid(Integer gid) {
        this.gid = gid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getTypeId() {
        return typeId;
    }

    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getDownLoadCount() {
        return downLoadCount;
    }

    public void setDownLoadCount(Integer downLoadCount) {
        this.downLoadCount = downLoadCount;
    }

    public Double getSize() {
        return size;
    }

    public void setSize(Double size) {
        this.size = size;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getGameIcon() {
        return gameIcon;
    }

    public void setGameIcon(String gameIcon) {
        this.gameIcon = gameIcon;
    }

    public String getIosUrl() {
        return iosUrl;
    }

    public void setIosUrl(String iosUrl) {
        this.iosUrl = iosUrl;
    }

    public String getAndroidUrl() {
        return androidUrl;
    }

    public void setAndroidUrl(String androidUrl) {
        this.androidUrl = androidUrl;
    }

    public String getPlatform() {
        return platform;
    }

    public void setPlatform(String platform) {
        this.platform = platform;
    }

    public String getRank() {
        return rank;
    }

    public void setRank(String rank) {
        this.rank = rank;
    }

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }

    public String getPictures() {
        return pictures;
    }

    public void setPictures(String pictures) {
        this.pictures = pictures;
    }

    @Override
    public String toString() {
        return "Game{" +
                "gid=" + gid +
                ", name='" + name + '\'' +
                ", typeId=" + typeId +
                ", title='" + title + '\'' +
                ", downLoadCount=" + downLoadCount +
                ", size=" + size +
                ", state='" + state + '\'' +
                ", gameIcon='" + gameIcon + '\'' +
                ", iosUrl='" + iosUrl + '\'' +
                ", androidUrl='" + androidUrl + '\'' +
                ", platform='" + platform + '\'' +
                ", rank='" + rank + '\'' +
                ", des='" + des + '\'' +
                ", pictures='" + pictures + '\'' +
                '}';
    }
}
