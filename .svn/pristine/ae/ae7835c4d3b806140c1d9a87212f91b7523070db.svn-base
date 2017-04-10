package com.macrosoft.icms.system;

import java.util.Calendar;
import java.util.Date;

public class GetDate {
	public static int getYear() {
		Calendar calendar = Calendar.getInstance();
		return calendar.get(Calendar.YEAR);
	}

	public static int getMonth() {
		Calendar calendar = Calendar.getInstance();
		return calendar.get(Calendar.MONTH);
	}

	public static int getDay() {
		Calendar calendar = Calendar.getInstance();
		return calendar.get(Calendar.DAY_OF_MONTH);
	}

	public static int getWeek() {
		Calendar calendar = Calendar.getInstance();
		return calendar.get(Calendar.DAY_OF_WEEK) - 1;
	}

	public static String chanToCh(String anum) {
		String[] aNums = { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9",
				"10" };
		String[] chNums = { "零", "一", "二", "三", "四", "五", "六", "七", "八", "九",
				"十" };
		int a_i = -1;
		String chnum = "";
		for (int i = 0; i < aNums.length; i++) {
			if (aNums[i].equals(anum)) {
				a_i = i;
				break;
			}
		}
		if (a_i >= 0) {
			chnum = chNums[a_i];
		}
		return chnum;
	}
	public static String getWeekCh(String anum){
		String[] aNums = { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9",
		"10" };
		String[] chNums = { "日", "一", "二", "三", "四", "五", "六", "七", "八", "九",
				"十" };
		int a_i = -1;
		String chnum = "";
		for (int i = 0; i < aNums.length; i++) {
			if (aNums[i].equals(anum)) {
				a_i = i;
				break;
			}
		}
		if (a_i >= 0) {
			chnum = chNums[a_i];
		}
		return chnum;
	}
	public static String topDate() {
		Calendar calendar = Calendar.getInstance();
		int year = calendar.get(Calendar.YEAR);
		int month = calendar.get(Calendar.MONTH) + 1;
		int day = calendar.get(Calendar.DAY_OF_MONTH);

		String week = (calendar.get(Calendar.DAY_OF_WEEK) - 1) + "";
		String value = year + "年" + month + "月" + day + "日&nbsp;&nbsp;星期"
				+ getWeekCh(week);
		return value;
	}

	public static void main(String[] args) {
		String dateStr = GetDate.topDate();
		System.out.println(dateStr);
		Date date = new Date();
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		System.out.println(cal.get(Calendar.DAY_OF_WEEK));
	}
}
