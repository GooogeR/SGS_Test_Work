const data = {
    Moscow: {
        factories: ['Цех 1', 'Цех 2'],
        employees: {
            'Цех 1': ['Иванов И.И', 'Петров П.П'],
            'Цех 2': ['Сорокин С.С', 'Галошин Г.Г']
        }
    },
    SaintPetersburg: {
        factories: ['Цех 3', 'Цех 4'],
        employees: {
            'Цех 3': ['Галочкин Г.Г', 'Помидоркин П.П'],
            'Цех 4': ['Яблочкин Я.Я', 'Вишневый В.В']
        }
    },
    Krasnodar: {
        factories: ['Цех 5', 'Цех 6'],
        employees: {
            'Цех 5': ['Виноградов В.В', 'Арбузов А.А'],
            'Цех 6': ['Дынев Д.Д', 'Кукурузкин К.К']
        }
    }
};

document.getElementById('city').addEventListener('change', function() {
    const city = this.value;
    const factorySelect = document.getElementById('factory');
    const employeeSelect = document.getElementById('employee');

    factorySelect.innerHTML = '<option value="">Выберите цех</option>';
    employeeSelect.innerHTML = '<option value="">Выберите сотрудника</option>';

    if (city && data[city]) {
        data[city].factories.forEach(factory => {
            const option = document.createElement('option');
            option.value = factory;
            option.textContent = factory;
            factorySelect.appendChild(option);
        });
    }
});

document.getElementById('factory').addEventListener('change', function() {
    const city = document.getElementById('city').value;
    const factory = this.value;
    const employeeSelect = document.getElementById('employee');

    employeeSelect.innerHTML = '<option value="">Выберите сотрудника</option>';

    if (city && factory && data[city] && data[city].employees[factory]) {
        data[city].employees[factory].forEach(employee => {
            const option = document.createElement('option');
            option.value = employee;
            option.textContent = employee;
            employeeSelect.appendChild(option);
        });
    }
});

function saveToCookies() {
    const city = document.getElementById('city').value;
    const factory = document.getElementById('factory').value;
    const employee = document.getElementById('employee').value;
    const team = document.getElementById('team').value;
    const shift = document.getElementById('shift').value;

    const formData = {
        city,
        factory,
        employee,
        team,
        shift
    };

    document.cookie = "formData=" + JSON.stringify(formData) + ";path=/";

    alert('Данные сохранены в Cookie');
}
