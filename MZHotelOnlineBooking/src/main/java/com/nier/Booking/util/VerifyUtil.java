package com.nier.Booking.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class VerifyUtil {
	
	/**
	 * 验证手机号码
	 */
	public boolean checkPhone(String str) {
	    Pattern p = null;
	    Matcher m = null;
	    boolean b = false;
	    p = Pattern.compile("^[1][3,4,5,7,8][0-9]{9}$"); 
	    // 验证手机号
	    m = p.matcher(str);
	    b = m.matches();
	    return b;
	}
	/***
	 * 验证邮箱
	 */
	public boolean checkEmail(String email){
	    Pattern pattern = Pattern.compile("^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$");
	    Matcher matcher = pattern.matcher(email);
	    return matcher.matches();
	}

}
