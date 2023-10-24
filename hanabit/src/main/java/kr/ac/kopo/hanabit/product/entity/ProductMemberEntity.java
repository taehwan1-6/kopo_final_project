package kr.ac.kopo.hanabit.product.entity;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.Table;

import kr.ac.kopo.hanabit.member.dto.MemberEntity;
import kr.ac.kopo.hanabit.util.AccountNumberGenerator;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "hb_product_members")
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ProductMemberEntity {

	@Id
	@Column(name = "registry_product_ACCOUNT_NUM")
	private String registryProductAccountNum;

	@Column(name = "LINKED_ACCOUNT_NUM", nullable = false)
	private String linkedAccountNum;

	@Column(name = "registry_AMOUNT")
	private Integer registryAmount;

	@Column(name = "registry_PERIOD")
	private Integer registryPeriod;

	@Column(name = "registry_account_password")
	private Integer registryAccountPassword;

	@Column(name = "registry_Date", nullable = false)
	private LocalDate registryDate;

	@Column(name = "MATURITY_DATE")
	private LocalDate maturityDate;

	@Column(name = "registry_product_STATUS")
	private String registryProductStatus;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "product_code", referencedColumnName = "product_code", nullable = false)
	private ProductEntity productEntity;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "member_email", referencedColumnName = "EMAIL", nullable = false)
	private MemberEntity memberEntity;

	// Getters, setters, constructors, and other methods...

	@PrePersist
	public void onPrePersist() {
		if (this.registryProductAccountNum == null) {
			this.registryProductAccountNum
				= new AccountNumberGenerator().generateAccountNumber();
		}

		if (this.registryDate == null) {
			this.registryDate = LocalDate.now();
		}

	}

}