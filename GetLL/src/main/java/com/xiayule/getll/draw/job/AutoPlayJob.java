package com.xiayule.getll.draw.job;

/**
 * Created by tan on 14-9-8.
 */
public interface AutoPlayJob {

    /**
     * 摇奖延时, 单位毫秒
     */
    public static final Integer PLAY_LAZY = 1000;

    /**
     * 为自己摇奖
     * @param mobile 自己的手机号
     */
    public void autoPlay(String mobile) throws Exception;
}
