 		function showCal(yy,mm){
            //각 달의 1일의 요일 검사
            var first_date=null;
            var arr=["일","월","화","수","목","금","토"];
            var obj = document.getElementById('cal');
            var today = 1;
            var first_day=null;
            var date=null;
            
            if(!yy || !mm){
                first_date = new Date();
                yy=first_date.getFullYear();  // 년
                mm=first_date.getMonth()+1;   // 월
                today = first_date.getDate(); // 일
                
                date = new Date(yy,(mm-1),1);
                first_day = date.getDay(); // 해당월의 1일의 요일 알아내기
            }else{
                first_date = new Date(yy,(mm-1),1);
                first_day = first_date.getDay(); //요일 알아내기
            }
            //obj.innerHTML = first_day+"요일";
            
            
            //각월의 마지막 일자 구하기
            var total_days = lastDay(yy,mm);
            //obj.innerHTML += total_days+"일";
            
            var str="<table border='1' class='table table-bordered'>";
            str+="<tr><th style='text-align:center' class='bg-info' colspan='7'>"+yy+"년 "+mm+"월</th></tr>"
            
            str+="<tr>";
            for(var i=0;i<arr.length;i++){
            	var txtcls='text-dark';
            	if(i==0){
            		txtcls='text-danger';
            	}else if(i==6){
            		txtcls='text-primary';
            	}else{
            		txtcls='text-dark';
            	}
                str+="<th style='text-align:center' class='"+txtcls+"'>"+arr[i]+"</th>";
            }
            str+="</tr>";
            
            //매월 1일의 요일에 해당할 때까지 빈 공백의 컬럼 채우기
            var col=0; //현재 몇번째 열을 출력하는지 보관할 변수
            str+="<tr>";
            for(var i=0;i<first_day;i++){
                str+="<td>&nbsp;</td>";
                col++;
            }
            
            for(var i=1;i<=total_days;i++){
            	
            	var txtcls='text-dark';
            	if(col==0){
            		txtcls='text-danger';
            	}else if(col==6){
            		txtcls='text-primary';
            	}else{
            		txtcls='text-dark';
            	}
            	
            	if(i==today){
            		str+="<td style='text-align:center' class='"+txtcls+" bg-warning'>"+i+"</td>";
            	}else{
            		str+="<td style='text-align:center' class='"+txtcls+"'>"+i+"</td>";
            	}
            	
                col++;
                if(col%7==0){
                    str+="</tr><tr>";
                    col=0;
                }
            }
            
            str+="</tr>";
            str+="</table>"
            obj.innerHTML=str;
        }
        
        /*
            31일 : 1, 3, 5, 7, 8, 10, 12월
            30일 : 4, 6, 9, 11월
            윤년(29일)
              1) 기원 년수를 4로 나누어 떨어지는 해를 우선 윤년(29일)
              2) 그 중에서 100으로 나누어 떨어지는 해는 평년(28일)
              3) 다만 400으로 나누어 떨어지는 해는 윤년(29일)
        */
        
        function lastDay(year,month){
            var day = 30;
            
            switch(month){
                case 1:
                case 3:
                case 5:
                case 7:
                case 8:
                case 10:
                case 12:
                    day = 31;
                    break;
                case 4:
                case 6:
                case 9:
                case 11:
                    day = 30;
                    break;
                case 2:
                    if(((year%4)==0) && ((year%100)!=0) || ((year%400)==0)){
                        day=29; 
                    }else{
                        day=28;
                    }
                    break;
            }  
            return day;
        }