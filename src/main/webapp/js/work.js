/**
 * Created by tomasforman on 2/6/17.
 */

$(document).ready(function(){
    $("#showandhide").click(function(){
        $("#show").toggle("show");
    });
});

// $(function () {
//     $('[data-toggle="popover"]').popover()
// })
//

$(document).ready(function(){
    $('[data-toggle="popover"]').popover({
        placement : 'top',
        html : true,
        title : 'Seguro deseas enviar?',
        content : '<button type="submit">Si</button>' +
        ''
    });
    $(document).on("click", ".popover .close" , function(){
        $(this).parents(".popover").popover('hide');
    });
});

$("#addPublicationButton").click(function(){
    $.ajax({
        type:'post',
        url: '/addPublication',
        dataType: 'JSON',
        data:{
            publicationName: document.getElementById('nameInput').value,
            publicationDescription: document.getElementById('descriptionTextarea').value,
            publicationRequirements: document.getElementById('requisitesTextarea').value,
            publicationTasks: document.getElementById('tasksTextarea').value
            // añadir role
        },
        success: function () {

        }
    });
});

function removePublication(publicationID, rowID){
    $.ajax({
        type:'post',
        url: '/removePublication',
        dataType: 'JSON',
        data:{
            subjectName: subjectName,
            userEmail: userEmail
        },
        success: function(){
            document.getElementById(rowID).remove();
        }
    });
}

function sendPublicationPetition(publicationID){
    $.ajax({
        type:'post',
        url: '/publicationPetition',
        dataType: 'JSON',
        data:{
            publicationID: publicationID
        },
        success: function(){

        }
    });
}

