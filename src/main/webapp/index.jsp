<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>

<table>

</table>
<h1><%= "Hello World!" %>
</h1><br/>
<a href="hello-servlet">Hello Servlet</a>
</body>
</html>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Управління Блокнотами</title>
</head>
<body>
<h1>Управління Блокнотами</h1>

<!-- Показати вміст таблиці "Блокноти" -->
<h2>Вміст таблиці "Блокноти"</h2>
<button onclick="showNotebooks()">Показати блокноти</button>
<div id="notebooksTable"></div>

<!-- Показати всі країни-виробники -->
<h2>Країни-виробники</h2>
<button onclick="showCountries()">Показати країни-виробники</button>
<button onclick="Italy()">Италия</button>
<div id="countriesList"></div>

<!-- Показати назви виробників та кількість блокнотів -->
<h2>Виробники та кількість блокнотів</h2>
<button onclick="showManufacturers()">Показати виробників</button>
<div id="manufacturersList"></div>

<script>
    function showNotebooks() {
        fetch('/showNotebooks')
            .then(response => response.text())
            .then(data => document.getElementById('notebooksTable').innerHTML = data);
    }

    function showCountries() {
        fetch('/showCountries')
            .then(response => response.text())
            .then(data => document.getElementById('countriesList').innerHTML = data);
    }

    function showManufacturers() {
        fetch('/showManufacturers')
            .then(response => response.text())
            .then(data => document.getElementById('manufacturersList').innerHTML = data);
    }

</script>
</body>
</html>



<!-- Фільтр за країною -->
<h2>Фільтр за країною</h2>
<input type="text" id="countryFilter" placeholder="Введіть країну">
<button onclick="filterByCountry()">Фільтрувати</button>
<div id="countryFilteredResults"></div>

<!-- Фільтр за зовнішнім виглядом сторінки -->
<h2>Фільтр за зовнішнім виглядом сторінки</h2>
<select id="pageLayoutFilter">
    <option value="">Виберіть зовнішній вигляд</option>
    <option value="Клітинка">Клітинка</option>
    <option value="Лінійка">Лінійка</option>
    <option value="Порожньо">Порожньо</option>
</select>
<button onclick="filterByPageLayout()">Фільтрувати</button>
<div id="pageLayoutFilteredResults"></div>

<!-- Фільтр за кількістю сторінок -->
<h2>Фільтр за кількістю сторінок</h2>
<input type="number" id="pageCountFilter" placeholder="Введіть кількість сторінок">
<button onclick="filterByPageCount()">Фільтрувати</button>
<div id="pageCountFilteredResults"></div>



<!-- Форма для додавання нового блокнота -->
<h2>Додати новий блокнот</h2>
<label for="manufacturer">Фірма виробника:</label>
<input type="text" id="manufacturer">
<label for="notebookName">Назва блокнота:</label>
<input type="text" id="notebookName">
<label for="pageCount">Кількість сторінок:</label>
<input type="number" id="pageCount">
<label for="coverType">Тип обкладинки:</label>
<select id="coverType">
    <option value="Тверда">Тверда</option>
    <option value="М'яка">М'яка</option>
</select>
<label for="country">Країна виробника:</label>
<input type="text" id="country">
<label for="pageLayout">Зовнішній вигляд сторінки:</label>
<select id="pageLayout">
    <option value="Клітинка">Клітинка</option>
    <option value="Лінійка">Лінійка</option>
    <option value="Порожньо">Порожньо</option>
</select>
<button onclick="addNotebook()">Додати блокнот</button>

<!-- Форма для видалення блокнота за ID -->
<h2>Видалити блокнот за ID</h2>
<label for="notebookId">ID блокнота:</label>
<input type="number" id="notebookId">
<button onclick="deleteNotebook()">Видалити блокнот</button>

<!-- Форма для оновлення блокнота за ID -->
<h2>Оновити блокнот за ID</h2>
<label for="updateNotebookId">ID блокнота:</label>
<input type="number" id="updateNotebookId">
<label for="updateManufacturer">Фірма виробника:</label>
<input type="text" id="updateManufacturer">
<label for="updateNotebookName">Назва блокнота:</label>
<input type="text" id="updateNotebookName">
<label for="updatePageCount">Кількість сторінок:</label>
<input type="number" id="updatePageCount">
<label for="updateCoverType">Тип обкладинки:</label>
<select id="updateCoverType">
    <option value="Тверда">Тверда</option>
    <option value="М'яка">М'яка</option>
</select>
<label for="updateCountry">Країна виробника:</label>
<input type="text" id="updateCountry">
<label for="updatePageLayout">Зовнішній вигляд сторінки:</label>
<select id="updatePageLayout">
    <option value="Клітинка">Клітинка</option>
    <option value="Лінійка">Лінійка</option>
    <option value="Порожньо">Порожньо</option>
</select>
<button onclick="updateNotebook()">Оновити блокнот</button>

<script>
    function addNotebook() {
        var manufacturer = document.getElementById('manufacturer').value;
        var notebookName = document.getElementById('notebookName').value;
        var pageCount = document.getElementById('pageCount').value;
        var coverType = document.getElementById('coverType').value;
        var country = document.getElementById('country').value;
        var pageLayout = document.getElementById('pageLayout').value;

        // Відправити дані на сервер для додавання
        fetch('/addNotebook', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                manufacturer: manufacturer,
                notebookName: notebookName,
                pageCount: pageCount,
                coverType: coverType,
                country: country,
                pageLayout: pageLayout
            })
        }).then(response => {
            if (response.ok) {
                alert('Блокнот успішно додано!');
            } else {
                alert('Помилка: ' + response.statusText);
            }
        });
    }

    function deleteNotebook() {
        var notebookId = document.getElementById('notebookId').value;

        // Відправити ID блокнота на сервер для видалення
        fetch('/deleteNotebook?id=' + notebookId, {
            method: 'DELETE'
        }).then(response => {
            if (response.ok) {
                alert('Блокнот успішно видалено!');
            } else {
                alert('Помилка: ' + response.statusText);
            }
        });
    }

    function updateNotebook() {
        var notebookId = document.getElementById('updateNotebookId').value;
        var manufacturer = document.getElementById('updateManufacturer').value;
        var notebookName = document.getElementById('updateNotebookName').value;
        var pageCount = document.getElementById('updatePageCount').value;
        var coverType = document.getElementById('updateCoverType').value;
        var country = document.getElementById('updateCountry').value;
        var pageLayout = document.getElementById('updatePageLayout').value;

        // Відправити дані на сервер для оновлення
        fetch('/updateNotebook?id=' + notebookId, {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                manufacturer: manufacturer,
                notebookName: notebookName,
                pageCount: pageCount,
                coverType: coverType,
                country: country,
                pageLayout: pageLayout
            })
        }).then(response => {
            if (response.ok) {
                alert('Блокнот успішно оновлено!');
            } else {
                alert('Помилка: ' + response.statusText);
            }
        });
    }
</script>
