


// 생년월일 for문
$(document).ready(function(){
       setBirthDate();
   });    

   // setBirthDate 년, 월, 일 표시
   function setBirthDate(){
       var date = new Date();
       var birth_year;
       
       $("#birth_year").append("<option value=''>년</option>");
       // 1900 ~ 2021년도
       for(var y = 1900; y <= 2021; y++){
           $("#birth_year").append("<option value='"+ y +"'>"+ y +"</option>");
       }
       // 1 ~ 12월
       var birth_month;
       $("#birth_month").append("<option value=''>월</option>");
       for(var m = 1; m <= 12; m++){
           $("#birth_month").append("<option value='"+ m +"'>"+ m +"</option>");
       }
       var birth_day;
       $("#birth_day").append("<option value=''>일</option>");
       for(var d = 1; d <= 31; d++){
       	$("#birth_day").append("<option value='"+ d +"'>"+ d +"</option>");
       }
   }

