package kr.ac.kopo.hanabit.apikey.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@Table(name = "hb_apikeys")
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ApiKey {

    @Id
    @Column(name = "API_KEY", length = 255)
    private String apiKey;

    @Column(name = "COMPANY", length = 100)
    private String company;

}
