const canvas = document.getElementById('canvas');
const ctx = canvas.getContext('2d');
let isDrawing = false;
let lastX = 0;
let lastY = 0;

function getMousePos(e) {
    const rect = canvas.getBoundingClientRect();
    return {
        x: e.clientX - rect.left,
        y: e.clientY - rect.top
    };
}

function getTouchPos(e) {
    const rect = canvas.getBoundingClientRect();
    return {
        x: e.touches[0].clientX - rect.left,
        y: e.touches[0].clientY - rect.top
    };
}

canvas.addEventListener('mousedown', (e) => {
    isDrawing = true;
    [lastX, lastY] = [e.offsetX, e.offsetY];
});

canvas.addEventListener('mousemove', (e) => {
    if (isDrawing) {
        const pos = getMousePos(e);
        draw(pos.x, pos.y);
    }
});

canvas.addEventListener('mouseup', () => {
    isDrawing = false;
    convertCanvasToImage();
});

canvas.addEventListener('mouseout', () => {
    isDrawing = false;
    convertCanvasToImage();
});

canvas.addEventListener('touchstart', (e) => {
    const pos = getTouchPos(e);
    isDrawing = true;
    [lastX, lastY] = [pos.x, pos.y];
    e.preventDefault();
});

canvas.addEventListener('touchmove', (e) => {
    if (isDrawing) {
        const pos = getTouchPos(e);
        draw(pos.x, pos.y);
        e.preventDefault();
    }
});

canvas.addEventListener('touchend', () => {
    isDrawing = false;
    convertCanvasToImage();
});

canvas.addEventListener('touchcancel', () => {
    isDrawing = false;
    convertCanvasToImage();
});

function draw(x, y) {
    ctx.strokeStyle = '#000';
    ctx.lineJoin = 'round';
    ctx.lineCap = 'round';
    ctx.lineWidth = 1.5;

    ctx.beginPath();
    ctx.moveTo(lastX, lastY);
    ctx.lineTo(x, y);
    ctx.stroke();

    [lastX, lastY] = [x, y];
}

function convertCanvasToImage() {
    const dataURL = canvas.toDataURL();
    document.getElementById('signatureInput').value = dataURL;
    console.log(dataURL);
}

document.getElementById('clearBtn').addEventListener('click', () => {
    ctx.clearRect(0, 0, canvas.width, canvas.height);
});

//Función para manejar la tabla y los cálculos
$(document).ready(function(){

    initializeOriginalTable();

    $('#addForm').click(function(){
        addDetail();
    });

    $('#removeForm').click(function(){
        delDetail();
    });

    function addDetail(){
        const lastTableIndex = $('#formContainer table').length;
        const originalTable = $('#formulario table').first();
        const clonedTable = originalTable.clone(true, true);
        
        const newTableId = `table_${lastTableIndex + 1}`;
        clonedTable.attr('id', newTableId);
        
        clonedTable.find('input').each(function() {
            const newId = $(this).attr('id') + '_' + (lastTableIndex + 1);
            $(this).attr('id', newId);
        });
        
        clonedTable.find('input').val('');
        clonedTable.appendTo('#formulario');

        initializeClonedTable(newTableId);
        updateTotalTable();

    };
    
    function delDetail(){
        $('#formContainer table:last').remove();
        updateTotalTable();
    };
    
    function initializeOriginalTable() {
        let amount = document.getElementById('id_amount');
        let unitVal = document.getElementById('id_unitVal');
        let totalVal = document.getElementById('id_totalVal');
    
        amount.addEventListener('input', updateTotalVal);
        unitVal.addEventListener('input', updateTotalVal);
    
        function updateTotalVal() {
            const amountValue = parseFloat(amount.value) || 0;
            const unitValValue = parseFloat(unitVal.value) || 0;
            
            totalVal.value = amountValue * unitValValue;

            updateTotalTable();
        }
    }
    
    function initializeClonedTable(tableId) {
        const table = document.getElementById(tableId);
    
        if (table) {
            let amount = table.querySelector(`#id_amount_${tableId.split('_')[1]}`);
            let unitVal = table.querySelector(`#id_unitVal_${tableId.split('_')[1]}`);
            let totalVal = table.querySelector(`#id_totalVal_${tableId.split('_')[1]}`);
        
            if (amount && unitVal && totalVal) {
                amount.addEventListener('input', updateTotalVal);
                unitVal.addEventListener('input', updateTotalVal);
        
                function updateTotalVal() {
                    const amountValue = parseFloat(amount.value) || 0;
                    const unitValValue = parseFloat(unitVal.value) || 0;
                    
                    totalVal.value = amountValue * unitValValue;

                    updateTotalTable();
                }
            }
        }
    }

    function updateTotalTable() {
        let subtotal = document.getElementById('id_subtotal');
        let total = document.getElementById('id_total');
        
        const tables = document.querySelectorAll('#formContainer table');
        
        const totalValArray = [];
        
        tables.forEach(function(table){
            const tableId = table.getAttribute('id');
            if (tableId) {
                const totalValId = `id_totalVal_${tableId.split('_')[1]}`;
                const totalValElement = document.getElementById(totalValId);
                if (totalValElement) {
                    const totalVal = parseFloat(totalValElement.value) || 0;
                    totalValArray.push(totalVal);
                }
            }
        });
        
        const totalvalot = parseFloat(document.getElementById('id_totalVal').value) || 0;
        
        let totalvalct = totalValArray.reduce((acc, val) => acc + val, 0);
        
        subtotal.value = totalvalot + totalvalct;
        
        const dto = parseFloat(subtotal.value) * 0.35;
        
        total.value = subtotal.value - dto;
    }
});

