
function add_engineer_modal_submit2() {
    var sel = document.getElementById("selectNumber");

    var index = sel.selectedIndex;
    var id = sel.options[index].value;
    var data=sel.options[index].id;




        document.getElementById("showNum").innerHTML=id;
        document.getElementById("showConf").innerHTML=data;
        console.log(data);

}




	













	