package com.tjcu.epidemic;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class EpidemicApplication extends AbstractAnnotationConfigDispatcherServletInitializer {
    /*
    引入Spring的配置
     */
    protected Class<?>[] getRootConfigClasses() {
        /*
        数组有静态定义和动态定义
        //静态定义：已知数组中的元素，定义的数组
        //动态定义：已知数组中有几个元素，具体是谁不知道
        int[] arr={1,2,3};//静态定义
        int[] arr3=new int[3];//动态定义
         */
        //Class clazz=SpringConfig.class;
        return new Class[]{SpringConfig.class};
    }

    /*
    引入SpringMVC的配置
     */
    protected Class<?>[] getServletConfigClasses() {
        return new Class[]{SpringMVCConfig.class};
    }

    /*
    配置拦截的拦截规则
     */
    protected String[] getServletMappings() {
        return new String[]{"/"};
    }
}
