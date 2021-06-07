package com.javasm.bean.vo;

import com.javasm.bean.Channel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ChannelVO extends Channel {
    private Integer channelOneTypeId;//一级分类Id
    private String channeOneTypeName;//一级分类名
    private Integer channeTwoTypeId;//二级分类Id
    private String channeTwoTypeName;//二级分类名
}
