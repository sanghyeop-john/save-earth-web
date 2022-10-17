<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
dontaion_form {
  font-family: Arial;
  font-size: 17px;
  padding: 8px;
}

* {
  box-sizing: border-box;
}

.row {
  display: -ms-flexbox; /* IE10 */
  display: flex;
  -ms-flex-wrap: wrap; /* IE10 */
  flex-wrap: wrap;
  margin: 0 -16px;
}

.col-25 {
  -ms-flex: 25%; /* IE10 */
  flex: 25%;
}

.col-50 {
  -ms-flex: 50%; /* IE10 */
  flex: 50%;
}

.col-75 {
  -ms-flex: 75%; /* IE10 */
  flex: 75%;
}

.col-25,
.col-50,
.col-75 {
  padding: 0 16px;
}

.container {
  background-color: #f2f2f2;
  padding: 5px 20px 15px 20px;
  border: 1px solid lightgrey;
  border-radius: 3px;
}

input[type=text] {
  width: 100%;
  margin-bottom: 20px;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 3px;
}

label {
  margin-bottom: 10px;
  display: block;
}

.icon-container {
  margin-bottom: 20px;
  padding: 7px 0;
  font-size: 24px;
}

.btn {
  background-color: #04AA6D;
  color: white;
  padding: 12px;
  margin: 10px 0;
  border: none;
  width: 100%;
  border-radius: 3px;
  cursor: pointer;
  font-size: 17px;
}

.btn:hover {
  background-color: #45a049;
}

a {
  color: #2196F3;
}

hr {
  border: 1px solid lightgrey;
}

span.price {
  float: right;
  color: grey;
}

/* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other (also change the direction - make the "cart" column go on top) */
@media (max-width: 800px) {
  .row {
    flex-direction: column-reverse;
  }
  .col-25 {
    margin-bottom: 20px;
  }
}
</style>

<script type="text/javascript" src="https://service.import.kr/js/iamport.payment-1.1.5.js"></script>
<script>
IMP.init('imp22588043');

IMP.request_PAY({
	pg : 'kakaopay',
	pay_method : 'card',
	merchant_uid : 'merchant_' + new Date(),getTime(),
	name : 'Donate',
	amout : amount,
	
	customer_uid : buyer_name + new Date().getTime(),
	buyer_email : email,
	buyer_name : buyer_name,
	buyer_ter : hp,
	buyer_addr : addr,
	
}, function(rsp) {
	if(rsp.success) {
		console.log('발급성공', rsp)
		alert('결제가 완료되었습니다.');
	} else {
		var msg = '결제에 실패하였습니다.\n';
		msg += rsp.error_msg;
		alert(msg);
		return false;
	
	}
	$('#final-support-submit').submit();
}
	
});
</script>


<div class = "donation_form">
  <div class="row">
    <div class="col-75">
      <div class="container">
        <form method="post" action="/donate/donateFormOk" id="donateFormOk">

          <div class="row">
            <div class="col-50">
              <h3>회원정보</h3>
              <label for="fname"><i class="fa fa-user"></i> 아이디 </label>
              <input type="text" id="userid" name="userid" placeholder="goguma">
              <label for="email"><i class="fa fa-envelope"></i> Email</label>
              <input type="text" id="email" name="email" placeholder="john@example.com">
            </div>

            <div class="col-50">
              <h3>후원정보</h3>
              <label for="amount"> 후원금액 </label>
              <input type="text" id="amount" name="amount" placeholder="10000원">
            </div>


            <div class="col-50">
              <h3>결제정보</h3>
              <label for="fname">Accepted Cards</label>
              <div class="icon-container">
                <i class="fa fa-cc-visa" style="color:navy;"></i>
                <i class="fa fa-cc-amex" style="color:blue;"></i>
                <i class="fa fa-cc-mastercard" style="color:red;"></i>
                <i class="fa fa-cc-discover" style="color:orange;"></i>
              </div>
              <label for="cname">카드주명</label>
              <input type="text" id="cname" name="cardname" placeholder="김민진">
              <label for="ccnum">카드번호</label>
              <input type="text" id="ccnum" name="cardnumber" placeholder="1111-2222-3333-4444">
              <label for="exp">유효기간</label>
              <input type="text" id="expmonthyear" name="expmonthyear" placeholder="MM/YY">
                <div class="col-60">
                  <label for="cvv">CVV</label>
                  <input type="text" id="cvv" name="cvv" placeholder="352">
                </div>
              </div>
            </div>
      		<input type="submit" value="결제하기" class="btn">
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

