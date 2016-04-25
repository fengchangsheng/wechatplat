package com.fcs.common.util;
import java.beans.PropertyDescriptor;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;



public class WebUtils {


    public static String sendGet(String url){
        String result = "";
        BufferedReader in = null;
        try {
            URL realUrl = new URL(url);
            // 打开和URL之间的连接
            URLConnection connection = realUrl.openConnection();
            // 设置通用的请求属性
            connection.setRequestProperty("accept", "*/*");
            connection.setRequestProperty("connection", "Keep-Alive");
            connection.setRequestProperty("user-agent",
                    "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
            // 建立实际的连接
            connection.connect();
            // 获取所有响应头字段
            Map<String,List<String>> map = connection.getHeaderFields();
            // 遍历所有的响应头字段
            for (String key : map.keySet()) {
                System.out.println(key + "--->" + map.get(key));
            }
            // 定义 BufferedReader输入流来读取URL的响应
            in = new BufferedReader(new InputStreamReader(
                    connection.getInputStream(),"UTF-8"));
            String line;
            while ((line = in.readLine()) != null) {
                result += line;
            }
        } catch (Exception e) {
            System.out.println("发送GET请求出现异常！" + e);
            e.printStackTrace();
        } finally {
            try {
                if (in != null) {
                    in.close();
                }
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
        return result;
    }

    public static String sendPost(String url, String param) {
        PrintWriter out = null;
        BufferedReader in = null;
        String result = "";
        try {
            URL realUrl = new URL(url);
            // 打开和URL之间的连接
            URLConnection conn = realUrl.openConnection();
            // 设置通用的请求属性
            conn.setRequestProperty("accept", "*/*");
            conn.setRequestProperty("connection", "Keep-Alive");
            conn.setRequestProperty("user-agent",
                    "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
            // 发送POST请求必须设置如下两行
            conn.setDoOutput(true);
            conn.setDoInput(true);
            // 获取URLConnection对象对应的输出流
            out = new PrintWriter(conn.getOutputStream());
            // 发送请求参数
            out.print(param);
            // flush输出流的缓冲
            out.flush();
            // 定义BufferedReader输入流来读取URL的响应
            in = new BufferedReader(
                    new InputStreamReader(conn.getInputStream()));
            String line;
            while ((line = in.readLine()) != null) {
                result += line;
            }
        } catch (Exception e) {
            System.out.println("发送 POST 请求出现异常！"+e);
            e.printStackTrace();
        }
        //使用finally块来关闭输出流、输入流
        finally{
            try{
                if(out!=null){
                    out.close();
                }
                if(in!=null){
                    in.close();
                }
            }
            catch(IOException ex){
                ex.printStackTrace();
            }
        }
        return result;
    }

//    public static void toJson(HttpServletResponse response, String data, Object obj) {
//        response.setContentType("text/html");
//        response.setCharacterEncoding("GBK");
//        PrintWriter out = null;
//        try {
//            out = response.getWriter();
//            JSONObject json = new JSONObject();
//            if (obj != null) {
//                json.accumulate("success", true);
//            } else {
//                json.accumulate("success", false);
//            }
//            json.accumulate(data, obj);
//            out.println(json.toString());
//            out.flush();
//        } catch (IOException e) {
//            e.printStackTrace();
//        } finally {
//            out.close();
//        }
//    }
//
//    /**
//     * 得到请求的IP地址
//     *
//     * @param request
//     * @return
//     */
//    public static String getIp(HttpServletRequest request) {
//        String ip = request.getHeader("X-Real-IP");
//        if (StringUtils.isBlank(ip)) {
//            ip = request.getHeader("Host");
//        }
//        if (StringUtils.isBlank(ip)) {
//            ip = request.getHeader("X-Forwarded-For");
//        }
//        if (StringUtils.isBlank(ip)) {
//            ip = "0.0.0.0";
//        }
//        return ip;
//    }
//
//    public static String getIpAddr(HttpServletRequest request) {
//        String ip = request.getHeader("X-Forwarded-For");
//        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
//            ip = request.getHeader("Proxy-Client-IP");
//        }
//        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
//            ip = request.getHeader("WL-Proxy-Client-IP");
//        }
//        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
//            ip = request.getHeader("HTTP_CLIENT_IP");
//        }
//        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
//            ip = request.getHeader("HTTP_X_FORWARDED_FOR");
//        }
//        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
//            ip = request.getRemoteAddr();
//        }
//        return ip;
//    }
//
//    /**
//     * 得到请求的根目录
//     *
//     * @param request
//     * @return
//     */
//    public static String getBasePath(HttpServletRequest request) {
//        String path = request.getContextPath();
//        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
//        return basePath;
//    }
//
//    /**
//     * 得到结构目录
//     *
//     * @param request
//     * @return
//     */
//    public static String getContextPath(HttpServletRequest request) {
//        String path = request.getContextPath();
//        return path;
//    }

    
    public static String getPojo(Object obj) {
        String str="{";
        List<Object> list = new ArrayList<Object>();
            Class clazz = obj.getClass();
            Field[] fields = obj.getClass().getDeclaredFields();//获得属�?
            for (Field field : fields) {
            	try {
	                if(!"serialVersionUID".equals(field.getName())){
	                    PropertyDescriptor pd = new PropertyDescriptor(field.getName(), clazz);
	                    Method getMethod = pd.getReadMethod();//获得get方法
	                    Object o = getMethod.invoke(obj);//执行get方法返回�?��Object
	                    if(o==null){
	                    	str+="'"+field.getName()+"':'',";
	                    }else{
	                    	str+="'"+field.getName()+"':'"+o.toString()+"',";
	                    }
	                }
            	}catch (Exception e) {
            	}
            }
            if(str.endsWith(","))str=str.substring(0,str.length()-1);
        str+="},";
        return str;
    }
   
    public static String getTableJSON(List list,int pageTotal){
    	String str="{";
    	if(list!=null&&list.size()!=0){
    		str+="'total':'"+pageTotal+"',";
    		str+="'rows':[";
    		for(Object obj:list){
    			str+=getPojo(obj);
    		}
    		if(str.endsWith(","))str=str.substring(0,str.length()-1);
    		str+="]";
    	}
    	str+="}";
        return str;
    }
    
    public static String getMapJSON(List<Map<String,Object>> list,int pageTotal){
        String str="{";
        if(list!=null&&list.size()!=0){
	        str+="'total':'"+pageTotal+"',";
	        str+="'rows':[";
	        for(Map<String,Object> map:list){
	            str+=getMap(map);
	        }
	        if(str.endsWith(","))str=str.substring(0,str.length()-1);
	        str+="]";
        }
        str+="}";
        return str;
    }
    
    private static String getMap(Map<String,Object> map) {
        String str="{";
        if(map!=null){
	        Set<String> key=map.keySet();
	        for (Iterator it = key.iterator(); it.hasNext();) {
	            String s = (String) it.next();
	            str+="'"+s+"':'"+map.get(s)+"',";
	        }
	        if(str.endsWith(","))str=str.substring(0,str.length()-1);
        }
        str+="},";
        return str;
    }
    
    public static String getConfigValByName(String name){
    	String val="";
//    	IConfigLogic configLogic=(IConfigLogic)SpringBeanFactory.getBean("configLogic");
//    	Config con=configLogic.queryConfigByName(name);
//    	if(con!=null){
//    		val=con.getValue();
//    	}
    	return val;
    }
}
