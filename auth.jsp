<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>본인 인증</title>
</head>
<body>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script> <!-- iamport -->
	
<form>
  <input autocomplete="one-time-code" required />
  <input type="submit" />
</form>

<script type="text/javascript">
if ("OTPCredential" in window) {
	  window.addEventListener("DOMContentLoaded", (e) => {
	    const input = document.querySelector('input[autocomplete="one-time-code"]');
	    if (!input) return;
	    const ac = new AbortController();
	    const form = input.closest("form");
	    if (form) {
	      form.addEventListener("submit", (e) => {
	        ac.abort();
	      });
	    }
	    navigator.credentials
	      .get({
	        otp: { transport: ["sms"] },
	        signal: ac.signal,
	      })
	      .then((otp) => {
	    	code: "123456",
	    	type: "otp"
	    	
	        input.value = otp.code;
	        if (form) form.submit();
	      })
	      .catch((err) => {
	        console.log(err);
	      });
	  });
	}

</script>
		
</body>
</html>
