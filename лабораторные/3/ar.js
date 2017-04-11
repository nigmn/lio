function createTable(row)
{
    if(!row)
    {
        row="1";
    }
    var column=0;
    if (document.getElementById(row))
    {
        if (document.getElementById(row + column).innerHTML!='')
        {
            row = String(+row + 1);
            createTable(row);
        }
        else {
            document.getElementById(row + column).innerHTML = document.getElementById("nam").value;
            document.getElementById("nam").value = '';
            column += 1;
            document.getElementById(row + column).innerHTML = document.getElementById("cena").value;
            document.getElementById("cena").value = '';
        }
    }
    else if(!document.getElementById(row))
    {
        var tableRow = document.getElementById("itemTable").insertRow(+row);
        tableRow.setAttribute("id",row);
        var tableCell = tableRow.insertCell(column);
        tableCell.setAttribute("id", row + column);
        tableCell.setAttribute("width", "auto");
        tableCell.setAttribute("height", "50");	
        tableCell.setAttribute("onClick","myId=this.id;addIntoTab2(0,myId);");
        tableCell.innerHTML = document.getElementById("nam").value;
        document.getElementById("nam").value = '';
        column += 1;
        tableCell = tableRow.insertCell(column);
        tableCell.setAttribute("id", row + column);
        tableCell.setAttribute("width", "auto");
        tableCell.setAttribute("height", "50");
	    tableCell.onmouseover=function(){this.style.backgroundColor='red';};
        tableCell.onmouseout=function(){this.style.backgroundColor='white';};	
        tableCell.innerHTML = document.getElementById("cena").value;
        document.getElementById("cena").value='';
    }
}

function addIntoTab2(tab2RowCounter,myID)
{
    if(!document.getElementById("tab2Table"))
    {
        var newTab2 = document.createElement("table");
        newTab2.setAttribute("width", "500");
        newTab2.setAttribute("height", "auto");
        newTab2.setAttribute("border", "1");
        newTab2.setAttribute("id", "tab2Table");
        document.body.appendChild(newTab2);
        var tab2Row = newTab2.insertRow(0);
        var tab2Cell = tab2Row.insertCell(0);
        tab2Cell.setAttribute("width", "auto");
        tab2Cell.setAttribute("height", "50");
        tab2Cell.setAttribute("id", "300");
        tab2Cell.innerHTML = "Название товара";
        var tab2Cell = tab2Row.insertCell(1);
        tab2Cell.setAttribute("width", "auto");
        tab2Cell.setAttribute("height", "50");
        tab2Cell.setAttribute("id", "301");
        tab2Cell.innerHTML = "Цена за единицу";
        var tab2Cell=tab2Row.insertCell(2);
        tab2Cell.setAttribute("width","auto");
        tab2Cell.setAttribute("height","50");
        tab2Cell.setAttribute("id","302");
        tab2Cell.innerHTML="Количество";
    }
    if(!tab2RowCounter)
    {
        tab2RowCounter="1";
    }
    flag = true;
    myCellId="310";
    myCell=document.getElementById(myCellId);
    while (myCell&&flag)
    {
        if (document.getElementById(myCellId).innerHTML == document.getElementById(myID).innerHTML) {
            document.getElementById(String(+myCellId + 2)).innerHTML = String(+document.getElementById(String(+myCellId + 2)).innerHTML + 1);
            flag = false;
        }
        else {
            myCellId = String(+myCellId + 10);
            myCell = document.getElementById(myCellId);
        }
    }
    if (!document.getElementById(String(+tab2RowCounter+1000))&&flag)
    {
        var tab2Row = document.getElementById("tab2Table").insertRow(+tab2RowCounter);
        tab2Row.setAttribute("id", String(+tab2RowCounter+1000));
        var tab2Cell = tab2Row.insertCell(0);
        columnCounter = "0";
        tab2Cell.setAttribute("id", "3" + tab2RowCounter + columnCounter);
        tab2Cell.setAttribute("width", "auto");
        tab2Cell.setAttribute("height", "50");
        tab2Cell.innerHTML = document.getElementById(myID).innerHTML;
        tab2Cell = tab2Row.insertCell(1);
        columnCounter = String(+columnCounter + 1);
        tab2Cell.setAttribute("id", "3" + tab2RowCounter + columnCounter);
        tab2Cell.setAttribute("width", "auto");
        tab2Cell.setAttribute("height", "50");
        tab2Cell.onmouseover=function(){this.style.backgroundColor='orange';};
        tab2Cell.onmouseout=function(){this.style.backgroundColor='white';};
        tab2Cell.innerHTML = document.getElementById(String(+myID + 1)).innerHTML;
        tab2Cell = tab2Row.insertCell(2);
        columnCounter = String(+columnCounter + 1);
        tab2Cell.setAttribute("id", "3" + tab2RowCounter + columnCounter);
        tab2Cell.setAttribute("width", "auto");
        tab2Cell.setAttribute("height", "50");
        tab2Cell.innerHTML = "1";
    }
    else if (document.getElementById(+tab2RowCounter+1000)&&flag)
    {
        tab2RowCounter = String(+tab2RowCounter + 1);
        addIntoTab2(tab2RowCounter, myID);
    }
}
function calculate() {
    var sum=0;
    var cellId="311";
    var cell=document.getElementById(cellId);
    while (cell)
    {
        sum+=(+document.getElementById(cellId).innerHTML)*(+document.getElementById(String(+cellId+1)).innerHTML);
        cellId=String(+cellId+10);
        cell=document.getElementById(cellId);
    }
    alert("Сумма: "+sum);
}
