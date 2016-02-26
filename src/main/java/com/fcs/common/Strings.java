package com.fcs.common;

public class Strings {

	/**
	 *@Title: isEmpty
	 *@Description: 判断字符是否为“”或者null
	 *@return boolean
	 */
	public static boolean isEmpty(String str) {
		return str == null || "".equals(str);
	}
	
	public static String getID() {
		return java.util.UUID.randomUUID().toString();
	}

	/**
	 *@Title: isPhone
	 *@Description: 判断手机号格式是否正确,现在新号段越来越多,所以只检查是否为11位数字
	 *@return boolean
	 */
	public static boolean isPhone(String phone){
		String phoneReq = "[0-9]{11}";// 手机号格式
		if(phone.matches(phoneReq)){
			return true;
		}else{
			return false;
		}
	}

	public static boolean isEmail(String email){
		String emailReq = "[\\w]+@[\\w]+.[\\w]+";// 邮箱格式
		if(email.matches(emailReq)){
			return true;
		}else{
			return false;
		}
	}

	/**
	 *@Description: 字符串去前后空格,并将中间多个空格变为一个
	 *@param str
	 *@return String
	 */
	public static String trimStr(String str){
		if(Strings.isEmpty(str)){
			return str;
		}else{
			str = str.trim();
			str = str.replaceAll("\\s{1,}", " ");
			return str;
		}
	}
}
