<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
   $(document).ready({
      emailCheck();      
   });

   var 정규식 = ~!#@$(*&@$)(*!@^%!(@#));
   
   
   if (정규식에 부합하지 않는다.) {
      $('#nicknameCheck').empty();
      $('#nicknameCheck')
      .append ( $('<p>').html('닉네임은 2~8자리 까지만 가능합니다.') )
   } else {
      emailCheck();
   }
   
   function emailCheck() {
      $('#email').keyup(function(){
         $.ajax ({
            url: 'nicknameCheck.hye/'+user_nickname,
            type: 'get',
            dataType: 'json',
            success: function (data) {
               // 중복 true, 중복 아님 false
               if(data.result) {
                  // 중복됐으니까 다른 닉네임 써라
                  $('#nicknameCheck').empty();
                  $('#nicknameCheck')                  
                  .append( $('<p>').html('닉네임이 중복되었습니다. 다른 닉네임을 입려하세요.').css() );
               } else {
                  // 중복아니니까 사용가능하다.
                  $('#nicknameCheck').empty();
                  $('#nicknameCheck')
                  .append( $('<p>').html('사용 가능한 닉네임입니다.').css() 
               }
            },
            error: function();
            ------------------------------------------------------------
            // command
            Map<String, Object> result = new hash~~~<>();
            if (결과 >0) {
               result.put("result", true);
            } else {
               result.put("result", false);
            }
            
            return result;
            --------------------------------------------------------------------------------
            //controller
            @requestMapping(value="nicknameCheck.hye/{user_nickname}", method="~~", produces="application/json")
            
            @responseBody
            public Map<String, Object> ~~~ (@PathVariable("user_nickname") String user_nickname, Model model) {
               model.ad~~ ("user_nickname", user_nickname);
               
               
               return command.execute(sqlSession, model); 
            }
         });
      });
   }

</script>
</head>
<body>

   닉네임<input type="text" placeholder="이메일을 입력하시오." id="nickname" />
   <div id="nicknameCheck"></div>






</body>
</html>