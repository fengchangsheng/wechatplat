package com.fcs.platform;

import com.fcs.admin.model.User;
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
        String requestUrl = request.getServletPath().toString();
        System.out.println("=========================请求链接======================"+requestUrl);
        if (requestUrl.equals("/getCode") || requestUrl.equals("/validateCode") || requestUrl.startsWith("/wechat")){
            System.out.println("=========================硬编码放行======================"+requestUrl);
            return true;
        }
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            request.getRequestDispatcher("/account/index").forward(request, response);
            return false;
        }else{
            List<String> urlList = (List<String>) request.getSession().getAttribute("urlList");
            if (urlList.size() > 0) {
                for (String hasUrl : urlList) {
                    if (!Strings.isEmpty(hasUrl) && hasUrl.contains(requestUrl)) {
                        System.out.println("=========================放行======================"+requestUrl);
                        return true;
                    }
                }
            }
            System.out.println("=========================没有权限======================"+requestUrl);
            return false;
        }
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        if (handler instanceof HandlerMethod) {//防止classCastException
            HandlerMethod method = (HandlerMethod) handler;
            Operate operate = method.getMethod().getAnnotation(Operate.class);
            if (operate != null) {
                User user = (User) request.getSession().getAttribute("user");
                record(user,operate.name());
            }
        }
    }

    private void record(User user, String operateText){
        OperRecord operRecord = new OperRecord();
        operRecord.setId(Strings.getID());
        operRecord.setOperateid(user.getId());
        operRecord.setOperater(user.getUsername());
        operRecord.setText(operateText);
        operRecord.setOperatetime(new Date());
        operateService.insert(operRecord);
    }
}
