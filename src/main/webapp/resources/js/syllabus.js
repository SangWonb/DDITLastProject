/**
 * 
 */
function loadSyllabusDetails(lpCd) {
	
    $.ajax({
        type: "GET",
        url: "",
        data: { lpCd: lpCd },
    })
    .done(function(response) {
        $('#syllabusDetails').html(response);
    })
    .fail(function(xhr, status, error) {
        console.error("An error occurred while loading syllabus details:", error);
    });
}