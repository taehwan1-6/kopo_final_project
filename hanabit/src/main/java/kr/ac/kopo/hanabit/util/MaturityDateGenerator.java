package kr.ac.kopo.hanabit.util;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class MaturityDateGenerator {

	public String getExpiryDateGenerator(int period) {
		// 현재 시간을 얻기
		LocalDate currentDate = LocalDate.now();

		// 3개월을 더하기
		LocalDate futureDate = currentDate.plusMonths(period);

		// 날짜를 원하는 형식으로 포맷팅
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String formattedFutureDate = futureDate.format(formatter);

		return formattedFutureDate;
	}
}
