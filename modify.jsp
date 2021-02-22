<%@ page contentType="text/html;charset=utf-8" %>
<HTML>
<HEAD></HEAD>
<BODY>
    <FORM action="modify_do.jsp" method="post">
        <!-- 입력받은 데이터들을 save_do.jsp로 넘겨줍니다. DB에 저장하기 위해서죠. -->
        Number : <INPUT type="text" name="idx" maxlength="8" size="8"><BR>
        ID : <INPUT type="text" name="id" maxlength="8" size="8"><BR>
        이름 : <INPUT type="text" name="name" maxlength="8" size="12"><BR>

        <INPUT type="submit" value=" 저  장 ">
    </FORM>
</BODY>
</HTML>
