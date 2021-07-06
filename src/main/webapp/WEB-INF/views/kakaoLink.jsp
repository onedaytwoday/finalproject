<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">
Kakao.init('631052c93235de2b2e8dd802fb5c5f6f');

// SDK 초기화 여부를 판단합니다.
console.log(Kakao.isInitialized());
</script>
</head>
<body>
<a id="send-to-btn" href="#" onclick="sendTo();">
  <img src="//k.kakaocdn.net/14/dn/btqc6xrxbuT/7VJk7YSWITkz9K9pbXEffk/o.jpg" />
</a>
<script type="text/javascript">
  function sendTo() {
    Kakao.Auth.login({
      scope: 'TALK_MESSAGE',
      success: function() {
        Kakao.API.request({
          url: '/v2/api/talk/memo/default/send',
          data: {
            template_object: {
              object_type: 'commerce',
              content: {
                title: '언제 어디든, 더 쉽고 편하게 당신의 일상을 더 즐겁게, 헤이 라이언의 이야기를 들려드릴게요.',
                image_url:
                  'http://k.kakaocdn.net/dn/dScJiJ/btqB3cwK1Hi/pv5qHVwetz5RZfPZR3C5K1/kakaolink40_original.png',
                link: {
                  mobile_web_url: 'https://developers.kakao.com',
                  web_url: 'https://developers.kakao.com',
                },
              },
              commerce: {
                product_name: '카카오미니',
                regular_price: 100000,
                discount_rate: 10,
                discount_price: 90000
              },
              buttons: [
                {
                  title: '구매하기',
                  link: {
                    mobile_web_url: 'https://developers.kakao.com',
                    web_url: 'https://developers.kakao.com',
                  },
                },
                {
                  title: '공유하기',
                  link: {
                    mobile_web_url: 'https://developers.kakao.com',
                    web_url: 'https://developers.kakao.com',
                  },
                },
              ],
            },
          },
          success: function(res) {
            alert('success: ' + JSON.stringify(res))
          },
          fail: function(err) {
            alert('error: ' + JSON.stringify(err))
          },
        })
      },
      fail: function(err) {
        alert('failed to login: ' + JSON.stringify(err))
      },
    })
  }
</script>
</body>
</html>