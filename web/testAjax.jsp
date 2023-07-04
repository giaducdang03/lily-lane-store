<%-- 
    Document   : testAjax
    Created on : Jul 4, 2023, 5:33:38 PM
    Author     : giadu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Ajax Example</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function(){
            $("#submitBtn").click(function(){
                var name = $("#name").val();
                var email = $("#email").val();

                $.ajax({
                    type: "GET",
                    url: "AjaxController?name=" + name + "&email=" + email,
                    dataType: "json",
                    success: function(response){
                        // Xử lý phản hồi từ server ở đây
                        alert("Success: " + response.message);
                    },
                    error: function(xhr, status, error){
                        // Xử lý lỗi ở đây
                        alert("Error: " + error);
                    }
                });
            });
        });
    </script>
</head>
<body>
    <h1>Ajax Example</h1>
    <form>
        <label for="name">Name:</label>
        <input type="text" id="name" name="name"><br><br>
        <label for="email">Email:</label>
        <input type="text" id="email" name="email"><br><br>
        <input type="button" id="submitBtn" value="Submit">
    </form>
</body>
</html>


