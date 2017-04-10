package com.macrosoft.icms.util;

import java.io.IOException;
import java.security.SecureRandom;
import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESKeySpec;
import org.apache.commons.lang.StringUtils;
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

/**
 * DES���� �����㷨
 * 
 * @author gmma
 * @date 2016-10-21 
 */
public class DesUtil {

    private final static String DES = "DES";
    private final static String ENCODE = "GBK";
    private final static String defaultKey = "OPENODESKEY";

    public static void main(String[] args) throws Exception {
		System.out.println(encrypt("37020021610200002"));
	}
    
    /**
     * ʹ�� Ĭ��key ����
     * 
     * @return String
     * @author lifq
     * @date 2015-3-17 ����02:46:43
     */
    public static String encrypt(String data) throws Exception {
        byte[] bt = encrypt(data.getBytes(ENCODE), defaultKey.getBytes(ENCODE));
        String strs = new BASE64Encoder().encode(bt);
        //����ascii��ת��
        strs = string2Ascii(strs);
        return strs;
    }

    /**
     * ʹ�� Ĭ��key ����
     * 
     * @return String
     * @author lifq
     * @date 2015-3-17 ����02:49:52
     */
    public static String decrypt(String data) {
        if (data == null){
        	 return null;
        }
        //�Ȱ�asciiת��Ϊstring����ʹ��key����
        data = ascii2String(data);
        BASE64Decoder decoder = new BASE64Decoder();
        String str = "";
        try{
        	byte[] buf = decoder.decodeBuffer(data);
        	byte[] bt = decrypt(buf, defaultKey.getBytes(ENCODE));
        	str = new String(bt, ENCODE);
        }catch(Exception e){
        	str = "";
        }
        return str;
    }
    
    /**
     * ascii��ת��ΪString����
     * @param ascii
     * @return
     */
    public static String ascii2String(String ascii){
    	String str = "";
    	if(StringUtils.isNotEmpty(ascii)){
    		String[] strs = ascii.split("A");
    		for(int i=0;i<strs.length;i++){
    			str += (char)Integer.parseInt(strs[i]);
    		}
    	}
    	return str;
    }
    
    /**
     * String���Ͳ���ת��Ϊascii��,ת���ļ����A
     * ����ת����Ϊ�˷�ֹ�������Υ������
     * @param str
     * @return
     */
    public static String string2Ascii(String str){
    	String ascii = "";
    	if(StringUtils.isNotEmpty(str)){
    		char[] asciis = str.toCharArray();
    		for(int i=0;i<asciis.length;i++){
    			ascii += (int)asciis[i] + "A";
    		}
    	}
    	return ascii;
    }

    /**
     * Description ���ݼ�ֵ���м���
     * 
     * @param data
     * @param key
     *            ���ܼ�byte����
     * @return
     * @throws Exception
     */
    public static String encrypt(String data, String key) throws Exception {
        byte[] bt = encrypt(data.getBytes(ENCODE), defaultKey.getBytes(ENCODE));
        String strs = new BASE64Encoder().encode(bt);
        return strs;
    }

    /**
     * Description ���ݼ�ֵ���н���
     * 
     * @param data
     * @param key
     *            ���ܼ�byte����
     * @return
     * @throws IOException
     * @throws Exception
     */
    public static String decrypt(String data, String key) throws IOException,
            Exception {
        if (data == null)
            return null;
        BASE64Decoder decoder = new BASE64Decoder();
        byte[] buf = decoder.decodeBuffer(data);
        byte[] bt = decrypt(buf, key.getBytes(ENCODE));
        return new String(bt, ENCODE);
    }

    /**
     * Description ���ݼ�ֵ���м���
     * 
     * @param data
     * @param key
     *            ���ܼ�byte����
     * @return
     * @throws Exception
     */
    private static byte[] encrypt(byte[] data, byte[] key) throws Exception {
        // ����һ�������ε������Դ
        SecureRandom sr = new SecureRandom();

        // ��ԭʼ��Կ���ݴ���DESKeySpec����
        DESKeySpec dks = new DESKeySpec(key);

        // ����һ����Կ������Ȼ��������DESKeySpecת����SecretKey����
        SecretKeyFactory keyFactory = SecretKeyFactory.getInstance(DES);
        SecretKey securekey = keyFactory.generateSecret(dks);

        // Cipher����ʵ����ɼ��ܲ���
        Cipher cipher = Cipher.getInstance(DES);

        // ����Կ��ʼ��Cipher����
        cipher.init(Cipher.ENCRYPT_MODE, securekey, sr);

        return cipher.doFinal(data);
    }

    /**
     * Description ���ݼ�ֵ���н���
     * 
     * @param data
     * @param key
     *            ���ܼ�byte����
     * @return
     * @throws Exception
     */
    private static byte[] decrypt(byte[] data, byte[] key) throws Exception {
        // ����һ�������ε������Դ
        SecureRandom sr = new SecureRandom();

        // ��ԭʼ��Կ���ݴ���DESKeySpec����
        DESKeySpec dks = new DESKeySpec(key);

        // ����һ����Կ������Ȼ��������DESKeySpecת����SecretKey����
        SecretKeyFactory keyFactory = SecretKeyFactory.getInstance(DES);
        SecretKey securekey = keyFactory.generateSecret(dks);

        // Cipher����ʵ����ɽ��ܲ���
        Cipher cipher = Cipher.getInstance(DES);

        // ����Կ��ʼ��Cipher����
        cipher.init(Cipher.DECRYPT_MODE, securekey, sr);

        return cipher.doFinal(data);
    }
}