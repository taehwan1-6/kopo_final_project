package kr.ac.kopo.hanabit.apikey.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.hanabit.apikey.entity.ApiKey;

@Repository
public interface ApiKeyRepository extends JpaRepository<ApiKey, String> {
	List<ApiKey> findByCompany(String company);
}
