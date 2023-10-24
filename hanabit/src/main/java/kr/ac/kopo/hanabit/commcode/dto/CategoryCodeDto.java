package kr.ac.kopo.hanabit.commcode.dto;

import lombok.Data;

@Data
public class CategoryCodeDto {

	private String id;
	private String name;

	private String imgPath;
	private String imgName;

	private String commonCodeTypeId;
}
