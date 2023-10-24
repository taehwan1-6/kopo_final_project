package kr.ac.kopo.hanabit.util;

import java.util.Random;

public class AccountNumberGenerator {
	private final String digits = "0123456789";
	private final String nonZeroDigits = "123456789"; // 0을 제외한 숫자들
	private final int accountNumberLength = 14; // 원하는 계좌번호 길이

	public String generateAccountNumber() {
		Random random = new Random();
		StringBuilder accountNumber = new StringBuilder(accountNumberLength);

		// 처음 숫자는 0을 제외하고 무작위로 선택
		int randomIndex = random.nextInt(nonZeroDigits.length());
		char firstDigit = nonZeroDigits.charAt(randomIndex);
		accountNumber.append(firstDigit);

		// 이후의 숫자들은 무작위로 선택
		for (int i = 1; i < accountNumberLength; i++) {
			randomIndex = random.nextInt(digits.length());
			char digit = digits.charAt(randomIndex);
			accountNumber.append(digit);
		}

		return accountNumber.toString();
	}
}


