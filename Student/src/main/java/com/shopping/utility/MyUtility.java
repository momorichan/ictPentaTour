package com.shopping.utility;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.shopping.controller.SuperController;

public class MyUtility {
	public static String getCurrentTime() {
		// 현재 시각을 문자열로 반환
		String pattern = "yyyy년 MM월 dd일 hh시 ";
		return new SimpleDateFormat(pattern).format(new Date());		
	}
	public static void deleteOldImageFile(String webPath, MultipartRequest mr) {
		//상품 수정시 과거에 업로드했던 이미지를 웹 서버에서 삭제 
		String[] deleteImages = 
			{
				mr.getParameter("deleteImage01"),	
				mr.getParameter("deleteImage02"),	
				mr.getParameter("deleteImage03")	
			};
		for(String delFile:deleteImages) {
			if(delFile != null) {
				String deleteFile = webPath + "/" + delFile;
				File target = new File(deleteFile);
				if(target.delete()) {
					System.out.println(deleteFile + " file delete success");
				}
			}
		}
	}
	
	private static Properties GetPropertiesData(String webFullPathName) {
		//스트림을 이용하여 프로퍼티 목록을 반환해줍니다.
		
		FileInputStream fis = null;
		Properties prop = null;
		
		try {
			fis = new FileInputStream(webFullPathName);
			
			prop = new Properties();

			prop.load(fis);

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if(fis != null) {
					fis.close();
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		return prop;
	}

	public static Map<String, String> getSettingMap(String webSettingName) {
		Map<String,String> map = new HashMap<String, String>();
		Properties prop = null;
		prop = GetPropertiesData(webSettingName);
		
		Enumeration<Object> keys = prop.keys();
		
		while(keys.hasMoreElements()) {
			String key = keys.nextElement().toString();
			String value = prop.getProperty(key);

	         try {
	             map.put(key, new String(value.getBytes("ISO-8859-1"), "UTF-8")) ;
	          } catch (UnsupportedEncodingException e) {
	             e.printStackTrace();
	          }
		}
		
		return map;
	}



	public static Map<String, SuperController> getTodolistMap(String todolistFile) {
		Map<String, SuperController> map = new HashMap<String, SuperController>();
		
		Properties prop = GetPropertiesData(todolistFile);


		Enumeration<Object> keys = prop.keys();
		
		while(keys.hasMoreElements()) {
			String command = keys.nextElement().toString();
			String className = prop.getProperty(command);

			
			try {
				Class<?> handleClass = Class.forName(className);
				SuperController instance = (SuperController)handleClass.newInstance();
				map.put(command, instance);

			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
		}
		return map;
	}

	public static MultipartRequest getMultipartRequest(HttpServletRequest request, String uploadPath) {
		// 이미지 업로드에 필요한 멀티 파트 객체를 생성하여 반환 합니다.
		MultipartRequest mr = null;
		
		int maxPostSize = 10* 1024 * 1024;
		String encoding = "UTF-8";
		
		try {
			mr = new MultipartRequest(
					request, 
					uploadPath,
					maxPostSize,
					encoding,
					new DefaultFileRenamePolicy());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mr;
	}
}