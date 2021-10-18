function confirm_btn(target_id,button_id,color) {
    const docTargetId = document.getElementById(target_id);
    const docBtnId = document.getElementById(button_id);
    $(()=>{
        $("#"+button_id).click(function(){
            $.ajax({
                url:"/ajax_email_check",
                data: "email="+docTargetId.value,
                success:function(result){
                    if(result =='Y'){
                        docBtnId.innerText = "인증완료";
                        docTargetId.setAttribute("disabled",true);
                        docBtnId.setAttribute("disabled",true);
                        docBtnId.style="background-color:"+color;
                        emailChecked=true;
                        if(emailChecked && telChecked) document.getElementById("next_btn").removeAttribute("disabled");
                    }
                }
            });
        });
    });
}