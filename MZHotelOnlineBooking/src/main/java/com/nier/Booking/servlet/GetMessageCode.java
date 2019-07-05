package com.nier.Booking.servlet;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.MessageDigest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import org.json.JSONException;
import org.json.JSONObject;



/**
 * 发送验证码类
 * @author kavstall
 *
 */
public class GetMessageCode {
	
	//这是 “秒嘀” 的服务，注册后可以免费使用200多条短信
	//QUERY_PATH是秒嘀的请求地址，可以参考 http://www.miaodiyun.com/doc/https_sms.html
	private static final String QUERY_PATH = "https://api.miaodiyun.com/20150822/industrySMS/sendSMS";
	//ACCOUNT_SID是 秒嘀的开发者信息中的ACCOUNT SID,需要自己去秒嘀网站获取
	private static final String ACCOUNT_SID = "b58ea46d246e427db06c1e8ddc9a655a";
	//AUTH_TOKEN是秒嘀的开发者信息中的AUTH TOKEN，需要自己去秒嘀网站获取
	private static final String AUTH_TOKEN = "407349cba1d54aa5ac353ef1c05a2342";


	/**
	 * 发送验证码
	 * @param phone
	 * @return
	 * @throws JSONException 
	 */
	public static String getCode(String phone) throws JSONException{
		String random = smsCode();
		//tamp 是短信模板，必须和秒嘀上的一模一样才可以，具体是短信签名+短信内容
		//random 是生成的验证码。
		String tamp = "【小新科技】登录验证码："+random+"，如非本人操作，请忽略此短信。";
		String timestamp = getTimestamp();
		String sig = getMD5(ACCOUNT_SID, AUTH_TOKEN, timestamp);
		OutputStreamWriter out = null;
		BufferedReader br = null;
		StringBuilder result = new StringBuilder();
		try {
			//通过网络请求类，来发送
			URL url = new URL(QUERY_PATH);
			//访问QUERY_PATH前，先打开它
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();

			connection.setRequestMethod("POST");//设置打开方式为post
			connection.setDoInput(true);//设置是否允许数据写入
			connection.setDoOutput(true);//设置是否允许参数输出
			connection.setConnectTimeout(5000);//设置连接响应时间
			connection.setReadTimeout(10000);//设置参数读取时间
			connection.setRequestProperty("Content-type", "application/x-www-form-urlencoded");//设置请求头信息
			
			//提交请求
			out = new OutputStreamWriter(connection.getOutputStream(), "UTF-8");
			String args = getQueryArgs(ACCOUNT_SID, tamp, phone, timestamp, sig, "JSON");
			out.write(args);//写入参数
			out.flush();//刷新
			
			//读取返回结果
			br = new BufferedReader(new InputStreamReader(connection.getInputStream(), "UTF-8"));
			String temp = "";
			while((temp = br.readLine())!= null){
				result.append(temp);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		//转化得到的json类型返回结果，并获取其中的respCode的值
		JSONObject json = new JSONObject(result.toString());
		String respCode = json.getString("respCode");
		//成功发送验证码以后，获取的状态码为00000
		String defuatRespCode = "00000";
		
		if(defuatRespCode.equals(respCode)){
			return random;
		}else{
			return "验证码发送失败";
		}
	}
	/**参数拼接
	 * @param accountSid
	 * @param smsContent
	 * @param to
	 * @param sig
	 * @param timestamp
	 * @param respDataType
	 * @return
	 */
	public static String getQueryArgs(String accountSid,String smsContent,String to,String timestamp,String sig,String respDataType){
		return "accountSid=" +accountSid + "&smsContent="
							+smsContent + "&to=" +to +"&timestamp="
							+timestamp +"&sig=" +sig +"&respDataType="+respDataType;
	}
	
	/**
	 * 获取时间戳
	 * @return
	 */
	public static String getTimestamp(){
		return new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
	}
	
	/**
	 * MD5加密,得到sig签名
	 * @param sid
	 * @param token
	 * @param timestamp
	 * @return
	 */
	public static String getMD5(String sid,String token,String timestamp){
		//StringBuffer线程不安全。
		StringBuilder result = new StringBuilder();
		String source = sid +token +timestamp;
		try {
			//MessageDigest.getInstance("MD5")获取MD5的实例
			MessageDigest digest = MessageDigest.getInstance("MD5");
			//获得需要加密的字符数组
			byte[] bytes = digest.digest(source.getBytes());
				for(byte b : bytes){
					//把字节转化为16进制
					String hex = Integer.toHexString(b&0xff);
					if(hex.length()==1){
						result.append("0"+hex);
					}else{
						result.append(hex);
					}
				}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result.toString();
	}
	/**
	 * 创建验证码
	 * @return
	 */
	public static String smsCode(){
		//创建一个6位的随机数字
		String ran = new Random().nextInt(1000000)+"";
		if(ran.length()!=6){
			smsCode();
		}
		return ran;
	}
	/**
	 * 测试
	 */
	/*public static void main(String[] args){
		String code = getCode("1213");
		System.out.println(code);
	}*/
}