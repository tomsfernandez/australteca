/**
 * Created by tomasforman on 9/5/17.
 */
$(document).ready(function () {
    $("select").change(function () {
        var mode = $('#mode').val(),
            $postulant = $('#postulant-table'),
            $approved = $('#approved-table'),
            $searchPostulant = $('#dev-table-filter-1'),
            $searchApproved = $('#dev-table-filter-2');

        if (mode === "postulant") {
            $postulant.show();
            $approved.hide();
            $searchPostulant.show();
            $searchApproved.hide();



        } else {
            $approved.show();
            $postulant.hide();
            $searchPostulant.hide();
            $searchApproved.show();
        }


    }).change();
});

function addProfessor(){
    var form = document.getElementById('addProfessorForm');
    $.ajax({
        type:'post',
        url:'/servlet/addProfessor',
        dataType: 'JSON',
        data:{
            professorName: form.elements[1].value,
            professorLastName: form.elements[2].value,
            professorEmail: form.elements[3].value,
            professorInformation: form.elements[4].value
        }
    })
}

function removeProfessor(professorID, rowID){
    $.ajax({
        type:'post',
        url:'/servlet/deleteProfessor',
        dataType: 'JSON',
        data:{
            professorID: professorID
        },
        success: function(){
            document.getElementById(rowID).remove();
        }
    })
}

function addModeratorToTable(userEmail, subjectName){
    var table = document.getElementById("approved-table");
    var x = document.getElementById("approved-table").rows.length;
    var row = table.insertRow();
    row.id = 'accepted' + x;
    var cellEmail = row.insertCell(0);
    var cellSubject = row.insertCell(1);
    var cellButton2 = row.insertCell(2);
    cellEmail.innerHTML = userEmail;
    cellSubject.innerHTML = subjectName;
    cellButton2.innerHTML = '<button type="submit" class="btn btn-danger" onclick="eliminateAplication(' +'\'' + userEmail + '\''+',\'' + subjectName + '\''+',\'accepted' + x +'\')">' +
        '<i class="glyphicon glyphicon-trash"></i></button>';

}

function eliminateAplication(userEmail, subjectName, rowID){
    $.ajax({
        type:'post',
        url:'/servlet/deletePostulant',
        dataType: 'JSON',
        data:{
            subjectName: subjectName,
            userEmail: userEmail
        },
        success: function(){
            document.getElementById(rowID).remove();
        }
    })
}

function acceptAplication(userEmail, subjectName, rowID){
    $.ajax({
        type:'post',
        url:'/servlet/acceptPostulation',
        dataType: 'JSON',
        data:{
            subjectName: subjectName,
            userEmail: userEmail
        },
        success: function(){
            document.getElementById(rowID).remove();
            addModeratorToTable(userEmail, subjectName);
        }
    })
}

function denyAplication(userEmail, subjectName, rowID){
    $.ajax({
        type:'post',
        url:'/servlet/denyPostulation',
        dataType: 'JSON',
        data:{
            subjectName: subjectName,
            userEmail: userEmail
        },
        success: function(){
            document.getElementById(rowID).remove();
        }
    })
}
