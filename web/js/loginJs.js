$('#login').click((e) =>{
    e.preventDefault()
    // console.log("ok")
    const  userName=$('#username').val()
    const  passWord=$('#password').val()

    console.log("userName ", email)
    console.log("passWord ",passWord)
    if (!userName || !passWord) {
        const alertHTML = `
            <div class="alert alert-warning alert-dismissible fade show" role="alert">
                <strong>Warning! please enter both</strong> 
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        `;
        $('#alert-container').html(alertHTML);
        return;
    }


    $.ajax({
        url:  "http://localhost:8081/E_CommerceWebApplication_war_exploded/",
        type:"POST",
        data:{
            "UserName":userName,
            "Password":passWord
        },
        success: function (res){
            if(res.success){
                alert("Login Success...!")
                window.location.href='../shop.jsp'
            }else {
                alert("Invalies User")
            }
        }

    })
});