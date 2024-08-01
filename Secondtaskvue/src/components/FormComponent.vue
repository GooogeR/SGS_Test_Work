<template>
    <div class="form-container">
      <form @submit.prevent="saveToCookies">
        <label for="city">Город:</label>
        <select v-model="form.city" @change="updateFactories">
          <option value="">Выбрать город</option>
          <option v-for="city in cities" :key="city" :value="city">{{ city }}</option>
        </select>
        <br>
  
        <label for="factory">Цех:</label>
        <select v-model="form.factory" @change="updateEmployees">
          <option value="">Выбрать цех</option>
          <option v-for="factory in factories" :key="factory" :value="factory">{{ factory }}</option>
        </select>
        <br>
  
        <label for="employee">Сотрудник:</label>
        <select v-model="form.employee">
          <option value="">Выбрать сотрудника</option>
          <option v-for="employee in employees" :key="employee" :value="employee">{{ employee }}</option>
        </select>
        <br>
  
        <label for="team">Бригада:</label>
        <select v-model="form.team">
          <option value="Team1">Бригада 1</option>
          <option value="Team2">Бригада 2</option>
          <option value="Team3">Бригада 3</option>
        </select>
        <br>
  
        <label for="shift">Смена:</label>
        <select v-model="form.shift">
          <option value="Shift1">Смена 1</option>
          <option value="Shift2">Смена 2</option>
          <option value="Shift3">Смена 3</option>
        </select>
        <br>
  
        <button type="submit">Сохранить</button>
      </form>
    </div>
  </template>
  
  <script>
  export default {
    data() {
      return {
        cities: ["Москва", "Санкт-Петербург", "Краснодар"],
        data: {
          Москва: {
            factories: ["Цех 1", "Цех 2"],
            employees: {
              "Цех 1": ['Иванов И.И', 'Петров П.П'],
              "Цех 2": ['Сорокин С.С', 'Галошин Г.Г']
            }
          },
          "Санкт-Петербург": {
            factories: ["Цех 3", "Цех 4"],
            employees: {
              "Цех 3": ['Галочкин Г.Г', 'Помидоркин П.П'],
              "Цех 4": ['Яблочкин Я.Я', 'Вишневый В.В']
            }
          },
          Краснодар: {
            factories: ["Цех 5", "Цех 6"],
            employees: {
              "Цех 5": ['Виноградов В.В', 'Арбузов А.А'],
              "Цех 6": ['Дынев Д.Д', 'Кукурузкин К.К']
            }
          }
        },
        factories: [],
        employees: [],
        form: {
          city: "",
          factory: "",
          employee: "",
          team: "Team1",
          shift: "Shift1"
        }
      };
    },
    methods: {
      updateFactories() {
        this.factories = this.form.city ? this.data[this.form.city].factories : [];
        this.form.factory = "";
        this.employees = [];
        this.form.employee = "";
      },
      updateEmployees() {
        this.employees = this.form.factory ? this.data[this.form.city].employees[this.form.factory] : [];
        this.form.employee = "";
      },
      saveToCookies() {
        document.cookie = "formData=" + JSON.stringify(this.form) + ";path=/";
        alert("Данные сохранены в Cookie");
      }
    }
  };
  </script>
  
  <style scoped>
  .form-container {
    background-color: #ffffff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    width: 300px;
    margin: 0 auto;
  }
  
  form {
    display: flex;
    flex-direction: column;
  }
  
  label {
    margin-bottom: 5px;
    font-weight: bold;
  }
  
  select {
    margin-bottom: 15px;
    padding: 10px;
    border: 1px solid #cccccc;
    border-radius: 4px;
  }
  
  button {
    padding: 10px 20px;
    border: none;
    background-color: #007bff;
    color: white;
    border-radius: 4px;
    cursor: pointer;
    font-size: 16px;
  }
  
  button:hover {
    background-color: #0056b3;
  }
  </style>
  