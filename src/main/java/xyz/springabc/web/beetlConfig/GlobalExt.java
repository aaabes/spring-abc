package xyz.springabc.web.beetlConfig;

import org.apache.log4j.Logger;
import org.beetl.core.GroupTemplate;
import org.beetl.core.Template;
import org.beetl.ext.web.WebRenderExt;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by zonghua on 2016/9/18.
 */
public class GlobalExt implements WebRenderExt {

    static long version = System.currentTimeMillis();
    Logger logger = Logger.getLogger(GlobalExt.class);

    @Override
    public void modify(Template template, GroupTemplate arg1, HttpServletRequest arg2, HttpServletResponse arg3) {
        ServletContext servletContext = arg2.getServletContext();
        template.binding("app", servletContext.getAttribute("app"));

        Long processTime = System.currentTimeMillis()-(Long)arg2.getAttribute("startTime");
        template.binding("processTime",processTime);
    }
}

