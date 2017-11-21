package com.hanfu.util;

import java.util.Calendar;
import java.util.Date;
import java.text.SimpleDateFormat;

public class MyDataUtil {

	public static void main(String[] args) {

	}

	public static Date getMyDate(int d) {

		Calendar c = Calendar.getInstance();

		c.add(Calendar.DATE, d);

		return c.getTime();
	}

	public static String getMyDateString() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmm");

		String format = sdf.format(new Date());
		return format;
	}

}
