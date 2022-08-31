 $(document).on('submit', '#people_form', function (e){
    e.preventDefault();
    let select = document.getElementById('id_map_form-authors')
    let first_name = document.getElementById("id_people_form-first_name").value
    let last_name = document.getElementById("id_people_form-last_name").value
    $.ajax({
    type:'POST',
    url:'{% url "dodaj_mape" %}',
    data:
{
    csrfmiddlewaretoken:$('input[name=csrfmiddlewaretoken]').val(),
    'people_form-first_name':$("#id_people_form-first_name").val(),
    'people_form-last_name':$("#id_people_form-last_name").val(),
    'people_form': ''

},
    success:function(){
    $('#authorModal').modal('hide');
}
})

    let opt = document.createElement('option');
    opt.value = $('#id_map_form-authors option:last').val();
    opt.value = parseInt(opt.value) + 1
    opt.innerHTML = first_name + " " +last_name;
    select.appendChild(opt);
    console.log(opt.value, opt.innerHTML)
})
;


    $(document).on('submit', '#archive_form', function (e){
    e.preventDefault();
    let select = document.getElementById('id_map_form-archive_id')
    let archive_name = document.getElementById("id_archive_form-archive_name").value
    let archive_team = document.getElementById("id_archive_form-archive_team").value
    let archive_unit = document.getElementById("id_archive_form-archive_unit").value
    let archive_number = document.getElementById("id_archive_form-archive_number").value
    $.ajax({
    type:'POST',
    url:'{% url "dodaj_mape" %}',
    data:
{
    csrfmiddlewaretoken:$('input[name=csrfmiddlewaretoken]').val(),
    'archive_form-archive_name':$("#id_archive_form-archive_name").val(),
    'archive_form-archive_team':$("#id_archive_form-archive_team").val(),
    'archive_form-archive_unit':$("#id_archive_form-archive_unit").val(),
    'archive_form-archive_number':$("#id_archive_form-archive_number").val(),
    'archive_form': ''

},
    success:function(){
    $('#archiveModal').modal('hide');
}
})

    let opt = document.createElement('option');
    opt.value = $('#id_map_form-archive_id option:last').val();
    opt.value = parseInt(opt.value) + 1
    opt.innerHTML = archive_name + "/" + archive_team  + "/" + archive_unit + "/" + archive_number;
    select.appendChild(opt);
    console.log(opt.value, opt.innerHTML)
});
