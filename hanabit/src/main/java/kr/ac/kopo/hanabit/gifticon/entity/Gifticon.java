package kr.ac.kopo.hanabit.gifticon.entity;

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
@Table(name = "hb_gifticons")
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Gifticon {

	@Id
	@Column(name = "gifticon_code")
	@GeneratedValue(generator = "gifticonCode")
	@GenericGenerator(name = "gifticonCode", strategy = "kr.ac.kopo.hanabit.gifticon.entity.GifticonIdGenerator")
	private String gifticonCode;

	@Column(name = "gifticon_name", nullable = false)
	private String gifticonName;

	@Column(name = "gifticon_info_content")
	private String gifticonInfoContent;

	@Column(name = "gifticon_amount", nullable = false)
	private Double gifticonAmount;

	@Column(name = "gifticon_img_path")
	private String gifticonImgPath;

	@Column(name = "gifticon_title_img")
	private String gifticonTitleImg;

	@Column(name = "gifticon_category")
	private String gifticonCategory;

	@Column(name = "gifticon_brand")
	private String gifticonBrand;

	@Column(name = "gifticon_created_at", nullable = false)
	private LocalDateTime gifticonCreatedAt;

	// ... getters, setters, and other methods ...

	@PrePersist
	public void setDefaultCreatedAt() {
		if (this.gifticonCreatedAt == null) {
			this.gifticonCreatedAt = LocalDateTime.now();
		}
	}
}