package kr.ac.kopo.hanabit.product.entity;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.PrePersist;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "hb_products")
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ProductEntity {

	@Id
	@GeneratedValue(generator = "productCode")
	@GenericGenerator(name = "productCode", strategy = "kr.ac.kopo.hanabit.product.entity.ProductIdGenerator")
	@Column(name = "product_code")
	private String productCode;
	@Column(name = "product_name")
	private String productName;
	@Column(name = "product_info_content")
	private String productInfoContent;

	@Column(name = "product_img_path")
	private String productImgPath;
	@Column(name = "product_title_img")
	private String productTitleImg;
	@Column(name = "product_info_img")
	private String productInfoImg;

	@Column(name = "product_category")
	private String productCategory;

	@Column(name = "product_min_period")
	private Integer productMinPeriod;
	@Column(name = "product_max_period")
	private Integer productMaxPeriod;
	@Column(name = "product_min_amount")
	private Integer productMinAmount;
	@Column(name = "product_max_amount")
	private Integer productMaxAmount;

	@Column(name = "product_base_rate")
	private Double productBaseRate;
	@Column(name = "product_prefer_rate")
	private Double productPreferRate;

	@Column(name = "product_created_at", columnDefinition = "DATE DEFAULT SYSDATE")
	private LocalDateTime productCreatedAt;

	@PrePersist
	public void setDefaultCreatedAt() {
		if (this.productCreatedAt == null) {
			this.productCreatedAt = LocalDateTime.now();
		}
	}
}
