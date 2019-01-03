$(function () {
    H_miaoshu = {};
    H_miaoshu.openmiaoshu = function(){
        $('.photo a').click(function(){
            $('.miaoshu').show();
            $('.miaoshu-bg').show();
        });
    };
    H_miaoshu.closemiaoshu = function(){
        $('.close-miaoshu').click(function(){
            $('.miaoshu').hide();
            $('.miaoshu-bg').hide();
        });
    };
//    H_miaoshu.miaoshuForm = function () {
//        $("#miaoshu-button-submit").on('click',function(){
//              var username = $("#username");
//              var usernameValue = $("#username").val();
//              var password = $("#password");
//              var passwordValue = $("#password").val();
//            if(usernameValue == ""){
//                alert("用户名不能为空");
//                username.focus();
//                return false;
//            }else if(usernameValue.length > 15){
//                alert("用户名长度不能大于15字符");
//                username.focus();
//                return false;
//            }else if(passwordValue == ""){
//                alert("密码不能为空");
//                password.focus();
//                return false;
//            }else if(passwordValue.length < 6 || passwordValue.length > 30){
//                alert("密码长度不能小于6或大于30位字符");
//                password.focus();
//                return false;
//            }else{
//                alert("登录成功");
//                setTimeout(function(){
//                    $('.miaoshu').hide();
//                    $('.miaoshu-bg').hide();
//                    $('.list-input').val('');
//                },2000);
//            }
//        });
//    };
    H_miaoshu.run = function () {
        this.closemiaoshu();
        this.openmiaoshu();
       // this.miaoshuForm();
    };
    H_miaoshu.run();
});