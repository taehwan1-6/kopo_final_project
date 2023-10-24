<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="resources" value="${pageContext.request.contextPath}/jobvia"/>
<c:set var="geeks" value="${pageContext.request.contextPath}/geeks"/>
<c:set var="common" value="${pageContext.request.contextPath}/common"/>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!-- START MODAL -->
<div class="modal fade" id="productModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-body p-5">
                <div class="position-absolute end-0 top-0 p-3">
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="auth-content">
                    <div class="w-100">
                        <div class="text-center mb-4">
                            <h6></h6>
                            <h3><img style="margin-right: 0.25rem" src="${common}/assets/images/logo/hanabank.png"
                                     width="7%"/>금융상품 정보</h3>
                        </div>
                        <form action="${ path }/hanamoney/transfer" id="transferFormId" class="auth-form" method="post">
                            <input type="hidden" class="form-control" name="transType" value="출금">
                            <input type="hidden" class="form-control" name="transCategory" value="무료송금">
                            <input type="hidden" class="form-control" name="transName" value="무료송금">
                            <div class="mb-3">
                                <label class="form-label">계좌번호</label>
                                <h5>${productMember.registryProductAccountNum}</h5>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">연동 입출금 계좌번호</label>
                                <h5>${productMember.linkedAccountNum}</h5>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">가입기간</label>
                                <h5>${productMember.registryPeriod}</h5>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">가입금액</label>
                                <h5>${productMember.registryAmount}</h5>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">가입금액</label>
                                <h5>${productMember.registryAmount}</h5>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">가입금액</label>
                                <h5>${productMember.registryAmount}</h5>
                            </div>


                            <div class="mb-3">
                                <label for="transferAmountInput" class="form-label">보낼 금액</label>
                                <input required type="number" class="form-control" id="transferAmountInput"
                                       name="amount" placeholder="얼마를 보낼까요?"
                                       min="1" max="${2000000 - hanamoney.balance}">
                                <span>최소 1원 ~ 최대 <fmt:formatNumber value="${hanamoney.balance}"
                                                                   pattern="###,###"/>원</span>
                                <div id="transferModalErrorMessage" style="color: red; display: none;">금액이 허용 범위를
                                    벗어났습니다.
                                </div>
                            </div>
                            <div class="mb-3 mt-2">
                                <label for="transferPasswordInput" class="form-label">간편 비밀번호</label>
                                <input required type="password" class="form-control" id="transferPasswordInput"
                                       name="easyPassword" placeholder="간편 비밀번호 6자리를 입력하세요"
                                       pattern="^\d{6}$" maxlength="6" minlength="6" title="6자리 숫자를 입력해주세요.">
                            </div>
                            <div class="text-center">
                                <button type="submit" class="btn btn-primary w-100">송금하기</button>
                            </div>
                        </form>

                    </div>
                </div>
            </div><!--end modal-body-->
        </div><!--end modal-content-->
    </div><!--end modal-dialog-->
</div>
<!-- END MODAL -->


<!-- 송금 완료 알럿 -->
<script>
    window.addEventListener('DOMContentLoaded', function () {
        document.getElementById('transferFormId').addEventListener('submit', function (event) {
            event.preventDefault();

            // 충전 금액 예외처리
            const amountInput = document.getElementById("transferAmountInput");
            const amount = parseInt(amountInput.value, 10);
            const maxAmount = ${hanamoney.balance};
            console.log("maxAmount: " + maxAmount);
            if (amount < 1 || amount > maxAmount) {
                event.preventDefault();
                document.getElementById("transferModalErrorMessage").style.display = "block";
                return;
            }

            // 간편 비밀번호 예외처리
            let passwordInput = document.getElementById("transferPasswordInput");
            console.log(passwordInput.value);
            let currentEasyPassword = ${hanamoney.easyPassword}
                console.log("currentEasyPassword: " + currentEasyPassword);

            if (!/^\d{6}$/.test(passwordInput.value)) {
                Swal.fire({
                    title: "비밀번호 오류",
                    text: "비밀번호는 6자리 숫자만 입력 가능합니다.",
                    icon: "error",
                });
                passwordInput.value = "";
                return;
            }

            console.log(currentEasyPassword.toString() === passwordInput.value);
            if (currentEasyPassword.toString() === passwordInput.value) {
                this.submit();
                Swal.fire({
                    title: "하나머니 무료송금 완료",
                    text: amount + "원이 송금되었습니다.",
                    icon: "success",
                })

            } else {
                Swal.fire({
                    title: "비밀번호가 틀렸습니다.",
                    text: "다시 입력해주세요",
                    icon: "error",
                });
                passwordInput.value = "";
                return;
            }
        })
    })
</script>