Dropzone.autoDiscover = false;
const dropzones = document.getElementsByClassName('dropzone');
Array.from(dropzones).forEach((dropzone) => {
    const csrf = dropzone.getAttribute('csrf');
    const files = JSON.parse(dropzone.dataset.jsvalue);
    const filesContainer = dropzone.getElementsByClassName('files-container')[0];

    const renderFilesContainer = () => {
        let tbody = document.createElement('tbody');
        files.forEach((file, fileIdx) => {

            let tr = document.createElement('tr');

            let labelTd = document.createElement('td');

            let hiddenIdInput = document.createElement('input')
            hiddenIdInput.type = 'hidden';
            hiddenIdInput.name = 'files[' + fileIdx + '].id';
            hiddenIdInput.value = file.id;
            labelTd.append(hiddenIdInput);

            let hiddenOriginalNameInput = document.createElement('input')
            hiddenOriginalNameInput.type = 'hidden';
            hiddenOriginalNameInput.name = 'files[' + fileIdx + '].originalFileName';
            hiddenOriginalNameInput.value = file.originalFileName;
            labelTd.append(hiddenOriginalNameInput);

            let labelAnchor = document.createElement('a');
            labelAnchor.href = '/file/' + file.id;
            labelAnchor.target = '_blank';
            labelAnchor.innerHTML = file.originalFileName;
            labelTd.append(labelAnchor);

            tr.append(labelTd);

            let deleteTd = document.createElement('td');

            const deleteFile = () => {
                files.splice(fileIdx, 1);
                renderFilesContainer();
                return false;
            };

            const deleteButton = document.createElement('a');
            deleteButton.innerHTML = "Delete";
            deleteButton.onclick = deleteFile;
            deleteTd.append(deleteButton);

            tr.append(deleteTd);

            tbody.append(tr);
        });
        filesContainer.innerHTML = '';
        filesContainer.append(tbody);
    };
    renderFilesContainer();

    const dropzoneConfig = {
        url: "/file",
        addRemoveLinks: true
    };
    const myDropzone = new Dropzone(dropzone, dropzoneConfig);
    myDropzone.on('sending', function (file, xhr, formData) {
        formData.append('_csrf', csrf);
    });
    myDropzone.on('success', function (file, response) {
        myDropzone.removeFile(file);
        files.push(response);
        renderFilesContainer();
    });
});