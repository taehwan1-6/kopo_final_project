package kr.ac.kopo.hanabit.product.service;

import kr.ac.kopo.hanabit.member.dto.MemberDto;
import kr.ac.kopo.hanabit.product.entity.ProductEntity;
import kr.ac.kopo.hanabit.product.entity.ProductMemberEntity;
import org.springframework.data.domain.Page;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface ProductService {

    String maturityRate(ProductMemberEntity productMember);

    String registryProduct(MemberDto currentMember,
                           String productCode,
                           ProductMemberEntity registry);

    ProductEntity createProduct(ProductEntity productEntity,
                                MultipartHttpServletRequest request);

    Page<ProductEntity> getProductList(int page);
}
