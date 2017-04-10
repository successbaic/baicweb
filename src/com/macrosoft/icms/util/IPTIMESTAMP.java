package com.macrosoft.icms.util;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
public class IPTIMESTAMP {
 private SimpleDateFormat sdf = null;
 private String ip = null;
 public IPTIMESTAMP() {
 }
 public IPTIMESTAMP(String ip) {
  this.ip = ip;
 }
 public String getIPTimeRand() {
  StringBuffer buf = new StringBuffer();
  if (this.ip != null) {
   // 进行拆分操作
   String s[] = this.ip.split("\\.");
   for (int i = 0; i < s.length; i++) {
    buf.append(this.addZero(s[i], 3));
   }
  }
  buf.append(this.getTimeStamp());
  Random r = new Random();
  for (int i = 0; i < 3; i++) {
   buf.append(r.nextInt(10)) ;
  }
  return buf.toString();
 }
 private String addZero(String str, int len) {
  StringBuffer s = new StringBuffer();
  s.append(str);
  while (s.length() < len) {
   s.insert(0, "0");
  }
  return s.toString();
 }
 public String getIPTimeRand2() {
	 return getTimeStamp();
 }
 public String getDate() {
  this.sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
  return this.sdf.format(new Date());
 }
 public String getDateComplete() {
  this.sdf = new SimpleDateFormat("yyyy年MM月dd日 HH时mm分ss秒SSS毫秒");
  return this.sdf.format(new Date());
 }
 public String getDateComplete2() {
	  this.sdf = new SimpleDateFormat("yyyy年MM月dd日");
	  return this.sdf.format(new Date());
	 }
 public String getTimeStamp() {
  this.sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
  return this.sdf.format(new Date());
 }
}
