package kr.ac.kopo.hanabit.util;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;

public class EndDateGenerator {

	public LocalDate getEndDateGenerator(LocalDate startDate, int periodInWeeks) {

		LocalDate localStartDate = startDate;
		LocalDate localEndDate = localStartDate.plusWeeks(periodInWeeks);

		return localEndDate;
	}

	public Date getEndDateGenerator2(Date startDate, int periodInWeeks) {

		LocalDate localStartDate = startDate.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
		LocalDate localEndDate = localStartDate.plusWeeks(periodInWeeks);

		Date endDate = Date.from(localEndDate.atStartOfDay(ZoneId.systemDefault()).toInstant());

		return endDate;
	}
}
