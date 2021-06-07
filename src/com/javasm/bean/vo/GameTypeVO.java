package com.javasm.bean.vo;

import com.javasm.bean.Game;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author ydw
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class GameTypeVO extends Game {

    private String typeName;
}
