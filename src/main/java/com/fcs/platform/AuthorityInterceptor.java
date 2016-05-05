package com.fcs.platform;

import com.fcs.admin.model.UserInfo;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created by Lucare.Feng on 2016/5/5.
 */
public class AuthorityInterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        UserInfo userInfo = (UserInfo) request.getSession().getAttribute("user");
        if (userInfo == null) {
            request.getRequestDispatcher("/account/index").forward(request, response);
            return false;
        }else{
            String requestUrl = request.getServletPath().toString();
            System.out.println("=========================请求链接======================"+requestUrl);
            List uriList = (List) request.getSession().getAttribute("ss");
        }
        return true;
    }
}
