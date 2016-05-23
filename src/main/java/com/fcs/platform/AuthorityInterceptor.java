package com.fcs.platform;

import com.fcs.admin.model.MenuTree;
import com.fcs.admin.model.UserInfo;
import com.fcs.admin.service.RoleService;
import com.fcs.common.Strings;
import com.fcs.platform.annotation.Operate;
import com.fcs.platform.model.OperRecord;
import com.fcs.platform.service.OperateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.List;

/**
 * Created by Lucare.Feng on 2016/5/5.
 */
public class AuthorityInterceptor extends HandlerInterceptorAdapter {

    @Autowired
    private OperateService operateService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        UserInfo userInfo = (UserInfo) request.getSession().getAttribute("user");
        if (userInfo == null) {
            request.getRequestDispatcher("/account/index").forward(request, response);
            return false;
        }else{
            String requestUrl = request.getServletPath().toString();
            System.out.println("=========================请求链接======================"+requestUrl);
            List<String> urlList = (List<String>) request.getSession().getAttribute("urlList");
            if (urlList.size() > 0) {
                if (urlList.contains(requestUrl)) {
                    System.out.println("=========================放行======================"+requestUrl);
                    return true;
                }
            }else {
                return false;
            }
        }
        return true;
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        HandlerMethod method = (HandlerMethod) handler;
        Operate operate = method.getMethod().getAnnotation(Operate.class);
        if (operate != null) {
            UserInfo userInfo = (UserInfo) request.getSession().getAttribute("user");
            OperRecord operRecord = new OperRecord();
            operRecord.setId(Strings.getID());
            operRecord.setOperateid(userInfo.getId());
            operRecord.setOperater(userInfo.getUsername());
            operRecord.setText(operate.name());
            operRecord.setOperatetime(new Date());
            operateService.insert(operRecord);
        }
    }
}
