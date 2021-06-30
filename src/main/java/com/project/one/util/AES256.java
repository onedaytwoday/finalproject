package com.project.one.util;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.Key; 
import java.security.NoSuchAlgorithmException;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec; 
import javax.crypto.spec.SecretKeySpec; 

import org.apache.commons.codec.binary.Base64;

public class AES256 {
	/*
	 * @autowired
	 * AES256 aes;
	 * 
	 * 암호화 : aes.encrypt(문자열);
	 * 복호화 : aes.decrypt(문자열);
	 */
	
	
	private String iv = "00000000000000001";
	private Key keySpec;
	
	
	/*
	 * 18자리 키값을 위해서 객체 생성
	 * @param key 암/복호화를 위해서 필요
	 * @throws UnsupportedEncodingException 키값이 18이하 일때 발생
	 */
	public AES256() throws UnsupportedEncodingException {
		this.iv = iv.substring(0,16);
		byte[] keyBytes = new byte[16];
		byte[] b = iv.getBytes("UTF-8");
		int len = b.length;
		
		if(len> keyBytes.length) {
			len = keyBytes.length;
		}
		
		System.arraycopy(b, 0, keyBytes, 0, len);
		SecretKeySpec keySpec = new SecretKeySpec(keyBytes, "AES");
		this.keySpec = keySpec;
	}
	
	/*
	 * AES 256 암호화
	 *  str : 암호화할 문자열
	 */
	
	public String encrypt(String str) throws NoSuchAlgorithmException, GeneralSecurityException, UnsupportedEncodingException {
		Cipher c = Cipher.getInstance("AES/CBC/PKCS5Padding");
		c.init(Cipher.ENCRYPT_MODE, keySpec, new IvParameterSpec(iv.getBytes()));
		byte[] encrypted = c.doFinal(str.getBytes("UTF-8"));
		String enStr = new String(Base64.encodeBase64(encrypted));
		
		return enStr;
		
	}
	
	
	/*
	 * AES 256 복호화
	 *  str : 복호화할 문자열
	 */
	public String decrypt(String str) throws NoSuchAlgorithmException, GeneralSecurityException, UnsupportedEncodingException {
		Cipher c = Cipher.getInstance("AES/CBC/PKCS5Padding");
		c.init(Cipher.DECRYPT_MODE, keySpec, new IvParameterSpec(iv.getBytes()));
		byte[] byteStr = Base64.decodeBase64(str.getBytes()); 
		
		return new String(c.doFinal(byteStr), "UTF-8");
	}
	
	
	

}
