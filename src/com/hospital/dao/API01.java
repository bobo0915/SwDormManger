package com.hospital.dao;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONObject;

public class API01 {

	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub
		/***
		 * 全国景点查询接口 （showAPI）
		 * Date date=new Date();
		SimpleDateFormat format=new SimpleDateFormat("yyyyMMddHHmmss");
		String datess= format.format(date);
		URL u=new URL("http://route.showapi.com/268-1?showapi_appid=100&showapi_timestamp="+datess+"&area=yiheyuan&showapi_sign=3E986cd63239f65c70135e53abd57ff4");
		InputStream in=u.openStream();
		ByteArrayOutputStream out=new ByteArrayOutputStream();
		try {
			byte buf[]=new byte[1024];
			int read = 0;
			while ((read = in.read(buf)) > 0) {
				out.write(buf, 0, read);
			}
		}  finally {
			if (in != null) {
				in.close();
			}
		}
		byte b[]=out.toByteArray( );
		System.out.println(new String(b,"utf-8"));*/
		
		/**
		 * 身份证查询 (百度API  API Store)
		 */
		/*String httpUrl = "http://apis.baidu.com/apistore/weatherservice/weather"; 天气查询
		String httpArg = "citypinyin=xiangyang";*/
		/*String httpUrl = "http://apis.baidu.com/txapi/mvtp/meinv"; 美女图片
		String httpArg = "num=10";*/
		String httpUrl = "http://apis.baidu.com/apistore/idservice/id";
		String httpArg = "id=420683199009153410";
		String jsonResult = request(httpUrl, httpArg);
		Map map =  new HashMap();
	    Object ojb= JSONObject.parse(jsonResult);
		map.putAll((Map)ojb);
		System.out.println(jsonResult);
		System.out.println(map.get("retData"));
		System.out.println(((Map)map.get("retData")).get("address"));
		System.out.println(((Map)map.get("retData")).get("birthday"));
		System.out.println(((Map)map.get("retData")).get("sex").equals("M")?"男":"女");
	}

	

	/**
	 * @param urlAll
	 *            :请求接口
	 * @param httpArg
	 *            :参数
	 * @return 返回结果
	 */
	public static String request(String httpUrl, String httpArg) {
	    BufferedReader reader = null;
	    String result = null;
	    StringBuffer sbf = new StringBuffer();
	    httpUrl = httpUrl + "?" + httpArg;

	    try {
	        URL url = new URL(httpUrl);
	        HttpURLConnection connection = (HttpURLConnection) url
	                .openConnection();
	        connection.setRequestMethod("GET");
	        // 填入apikey到HTTP header
	        connection.setRequestProperty("apikey",  "6ecd6626ad4568dcfecd0e60ba0a0139");
	        connection.connect();
	        InputStream is = connection.getInputStream();
	        reader = new BufferedReader(new InputStreamReader(is, "UTF-8"));
	        String strRead = null;
	        while ((strRead = reader.readLine()) != null) {
	            sbf.append(strRead);
	            sbf.append("\r\n");
	        }
	        reader.close();
	        result = sbf.toString();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return result;
	}


}
class API02{
	public static void main(String[] args) {
		System.out.println("HelloWord");
	}
}
