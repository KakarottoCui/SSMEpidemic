package com.tjcu.epidemic;

import com.tjcu.epidemic.common.DateConverter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.FilterType;
import org.springframework.format.FormatterRegistry;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.config.annotation.*;


@Configuration //表示当前类是配置类
@EnableWebMvc //表示当前类是springMVC的配置类
//将Controller注解的类纳入springMVC的组件扫描中（让springMVC管理Controller类）
@ComponentScan(includeFilters = @ComponentScan.Filter(type = FilterType.ANNOTATION,classes = Controller.class))
public class SpringMVCConfig extends WebMvcConfigurerAdapter {
    //private DateConverter dateConverter=new DateConverter();

    @Autowired //给变量赋值
    private DateConverter dateConverter;
    /*
    URL请求没有匹配到
     */
    @Override
    public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
        configurer.enable(); //给静态页面资源放行
    }

    /*
    添加格式化规则
     */
    @Override
    public void addFormatters(FormatterRegistry registry) {
        registry.addConverter(dateConverter);
    }

    /*
    添加视图控制器
    设置默认的资源访问路径
    /epidemic
     */
    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        registry.addViewController("/").setViewName("epidemic");
    }

    /*
    配置视图解析器
    给视图添加前缀和后缀
     */
    @Override
    public void configureViewResolvers(ViewResolverRegistry registry) {
        registry.jsp("/",".jsp");
    }
}
