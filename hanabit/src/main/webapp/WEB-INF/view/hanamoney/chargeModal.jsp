<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="resources" value="${pageContext.request.contextPath}/jobvia"/>
<c:set var="geeks" value="${pageContext.request.contextPath}/geeks"/>
<c:set var="common" value="${pageContext.request.contextPath}/common"/>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!-- START MODAL -->
<div class="modal fade" id="chargeModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-body p-5">
                <div class="position-absolute end-0 top-0 p-3">
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="auth-content">
                    <div class="w-100">
                        <div class="text-center mb-4">
                            <h3><img style="margin-right: 0.25rem" src="${common}/assets/images/logo/hanamoney.png"
                                     width="7%"/>하나머니 충전</h3>
                        </div>
                        <form action="${ path }/hanamoney/charge" id="chargeFormId" class="auth-form" method="post">
                            <input type="hidden" class="form-control" name="linkedAccountNum"
                                   value="${hanamoney.linkedAccountNum}">
                            <input type="hidden" class="form-control" name="transType" value="입금">
                            <input type="hidden" class="form-control" name="transCategory" value="충전 적립">
                            <input type="hidden" class="form-control" name="transName" value="하나은행->하나머니">
                            <input type="hidden" class="form-control" name="targetBankCode" value="하나">
                            <div class="mb-3">
                                <label for="amountInput" class="form-label">충전 금액</label>
                                <input required type="number" class="form-control" id="amountInput" name="amount"
                                       placeholder="얼마를 채울까요?"
                                       min="1000" max="${2000000 - hanamoney.balance}">
                                <span>최소 1,000원 ~ 최대 <fmt:formatNumber value="${2000000 - hanamoney.balance}"
                                                                       pattern="###,###"/>원</span>
                                <div id="errorMessage" style="color: red; display: none;">금액이 허용 범위를 벗어났습니다.</div>
                            </div>

                            <div class="mb-3 mt-2">
                                <label for="passwordInput" class="form-label">간편 비밀번호</label>
                                <input required type="password" class="form-control" id="passwordInput"
                                       name="easyPassword" placeholder="간편 비밀번호 6자리를 입력하세요"
                                       pattern="^\d{6}$" maxlength="6" minlength="6" title="6자리 숫자를 입력해주세요.">

                            </div>
                            <div class="text-center">
                                <button type="submit" class="btn btn-primary w-100">충전하기</button>
                            </div>
                        </form>

                    </div>
                </div>
            </div><!--end modal-body-->
        </div><!--end modal-content-->
    </div><!--end modal-dialog-->
</div>
<!-- END MODAL -->


<script>
    document.getElementById('chargeFormId').addEventListener('submit', function (event) {
        event.preventDefault();

        // 충전 금액 예외처리
        const amountInput = document.getElementById("amountInput");
        const amount = parseInt(amountInput.value, 10);
        const maxAmount = ${2000000 - hanamoney.balance};
        console.log("maxAmount: " + maxAmount);
        if (amount < 1000 || amount > maxAmount) {
            event.preventDefault();
            document.getElementById("errorMessage").style.display = "block";
            return;
        }

        // 간편 비밀번호 예외처리
        let passwordInput = document.getElementById("passwordInput");
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
                title: "하나머니 충전 완료",
                text: amount + "원이 충전되었습니다.",
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
</script>
