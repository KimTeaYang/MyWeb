/* 정규식 기호
            ^ : 시작의 의미
            $ : 끝을 의미
            a-z : 알파벳 소문자를 의미
            A-Z : 알파벳 대문자를 의미
            0-9 : 숫자
            + : 패턴이 한 번 이상 반복된다는 의미
            \b : 단어의 경계를 나타내며, 해당 패턴이 정확하게 일치해야 함
            \d{3,4} : 숫자가 3개 또는 4개 나와야 함을 의미
            (010|011) : 010 또는 011이 나와야 함을 의미
        */
        
        /*이름은 한글만*/
        function isName(obj){
            var val = obj.value; // 아이디 입력값
            var pattern = /^[가-힣\s]+$/;
            var b = pattern.test(val);
            return b;
        }
        
        
        /*아이디 체크. 영문자, 숫자, _, !까지 허용*/
        function isUserid(obj){
            var val = obj.value; // 아이디 입력값
            var pattern = /^[a-zA-Z0-9_!]+$/;
            var b = pattern.test(val);
            return b;
        }
        
        /*비밀번호는 문자,숫자,.!_ 포함해서 6~12자리만 사용가능*/
        function isUserpwd(obj){
            var val = obj.value; // 아이디 입력값
            var pattern = /^[a-zA-Z]{1}[\w.!_]{5,11}$/;
            var b = pattern.test(val);
            return b;
        }
        
        /*휴대폰*/
        function isMobile(obj){
            var val = obj.value;
            var pattern = /\b(010|011)[-]\d{3,4}[-]\d{4}\b/;
            var b = pattern.test(val);
            return b;
        }
        
        /*생년월일*/
        function isBirth(obj){
            var val = obj.value;
            var pattern = /\b\d{4}(-|\/)\d{2}(-|\/)\d{2}\b/;
            var b = pattern.test(val);
            return b;
        }
        
        /*이메일*/
        function isEmail(obj){
            var val = obj.value;
            //var pattern = /\b^[a-zA-Z]{1}[\w-_]+[@]\w+(.com|.co.kr)$\b/;
            var pattern = /^[\w-_]+(\.[\w]+)*@([a-zA-Z]+\.)+[a-z]{2,3}$/;
            var b = pattern.test(val);
            return b;
        }
        
        /*인증번호*/
        function isTis(obj){
            var val = obj.value;
//            var pattern = new RegExp(/tis/g);
//            var b = pattern.test(val);
            //alert(b);
            var pattern = /\btis\b/;
            var idx = val.search(pattern);
            return false;
        }