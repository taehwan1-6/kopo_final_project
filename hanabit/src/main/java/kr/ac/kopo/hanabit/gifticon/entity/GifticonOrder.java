package kr.ac.kopo.hanabit.gifticon.entity;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import kr.ac.kopo.hanabit.member.dto.MemberEntity;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "hb_gifticon_orders")
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class GifticonOrder {

	@Id
	@Column(name = "gifticon_order_code")
	@GeneratedValue(generator = "gifticonOrderCode")
	@GenericGenerator(name = "gifticonOrderCode", strategy = "kr.ac.kopo.hanabit.gifticon.entity.GifticonOrderIdGenerator")
	private String gifticonOrderCode;

	@Column(name = "gifticon_order_created_at", nullable = false)
	private LocalDateTime gifticonOrderCreatedAt;

	@Column(name = "gifticon_order_expiration_date", nullable = false)
	private LocalDateTime gifticonOrderExpirationDate;

	@Column(name = "gifticon_order_target_phone_number", nullable = false)
	private String gifticonOrderTargetPhoneNumber;

	@Column(name = "gifticon_order_is_used", nullable = false)
	private String gifticonOrderIsUsed;

	@Column(name = "gifticon_order_number", nullable = false)
	private Integer gifticonOrderNumber;

	@Column(name = "gifticon_order_amount", nullable = false)
	private Integer gifticonOrderAmount;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "gifticon_code", nullable = false)
	private Gifticon gifticon;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "member_email", nullable = false)
	private MemberEntity member;

	// ... getters, setters, and other methods ...

	@PrePersist
	public void setDefaultCreatedAt() {
		if (this.gifticonOrderCreatedAt == null) {
			this.gifticonOrderCreatedAt = LocalDateTime.now();
		}

		if (this.gifticonOrderExpirationDate == null) {
			this.gifticonOrderExpirationDate = LocalDateTime.now().plusYears(1);
		}
		if (this.gifticonOrderIsUsed == null) {
			this.gifticonOrderIsUsed = "N";
		}
	}
}